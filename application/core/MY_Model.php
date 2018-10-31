<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

abstract class MY_Model extends CI_Model {

  public $Values = array();
  public $Fields = array();
  public $FieldId = null;
  public $Table = null;
  public $ValuesDefault = array();
  public $ValuesConfig = array();
  public $Where = array();

  public function __construct() {
    $this->setConfigure();
    $this->setValues();
  }

  /*
    return array se houver erro;
      Mensagem: $this->db->error()['message'];
      Código: $this->db->error()['code']
  */
  public function insert(){
    $this->setDefault();
    $this->setValueConfig();
    if ($this->db->insert($this->Table, $this->Values)){
        $this->Values[$this->FieldId] = $this->db->insert_id();
        return $this->Values[$this->FieldId];
    }
    else
        return $this->db->error();
  }

  public function update(){
    $this->db->update($this->Table, $this->Values, array($this->FieldId => $this->Values[$this->FieldId]));
    if ($this->db->error()['code'] > 0)
      return $this->db->error();
    return 'Dados Atualizado com Sucesso';
  }

  public function delete(){
    $this->db->delete($this->Table, array($this->FieldId => $this->Values[$this->FieldId]));
    if ($this->db->error()['code'] > 0)
        return $this->db->error();
    return 'Dado Removido com Sucesso';
  }

  public function get($id_value = '', $where = array(), $start = null, $limit = null){
    $where = array_merge($where, $this->Where);
    if (!empty($id_value))
      $where[$this->FieldId] = $id_value;

    $query = $this->db->get_where($this->Table, $where, $start, $limit);
    //echo $this->db->last_query();

    return $query->result_object();
  }

  public function get_where($tabela = '', $where = null, $start = null, $limit = null){
    if ($where == null) {
      $query = $this->db->get($tabela, $start, $limit);
    } else {
      $query = $this->db->get_where($tabela, $where, $start, $limit);
    }
    return $query->result_object();
  }

  public function getBy($field, $value){
    $query = $this->db->get_where($this->Table, array($field => $value));
    return $query->result_object();
  }

  public function get_show_columns($table_name, $column_name = '')
  {
    $sql = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'miste872_prod' AND TABLE_NAME = '$table_name'";
    if (!empty($column_name))
      $sql .= " AND COLUMN_NAME = '$column_name'";
      //echo $sql;
    $query = $this->db->query($sql);
    return $query->result_array();
  }

  public function get_all_table($tabela = ''){
    $sql = "SELECT TABLE_NAME, TABLE_COMMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'miste872_prod' ";
    if (!empty($tabela))
      $sql .= "AND TABLE_NAME = '$tabela'";
    $query = $this->db->query($sql);
    return $query->result_array();
  }

  public function get_table_ref($tabela, $coluna){
    $sql = "SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS  RC
            INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
                ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
                AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
                AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
            WHERE RC.CONSTRAINT_SCHEMA = 'miste872_prod' AND RC.TABLE_NAME = '$tabela' AND KCU1.COLUMN_NAME = '$coluna';";
    $query = $this->db->query($sql);
    return $query->result_array();
  }

  public function setConfigMister($configFields){
    $this->Table = $configFields['table']['nome'];
    $this->FieldId = $configFields['table']['chave_pk'];
    foreach ($configFields['columns'] as $coluna => $config) {
      $this->Fields[] = $coluna;
    }
    $this->Where = $configFields['where'];
    $this->setValues();
  }

  abstract protected function setConfigure();

  protected function setValues(){
    if($_POST){
      foreach($this->Fields as $field) {
        if($this->input->post($field) !== null)
          $this->Values[$field] = $this->input->post($field);
      } 
    }
  }

  private function setDefault(){
    foreach ($this->ValuesDefault as $Campo => $Valor) {
      $this->Values[$Campo] = $Valor;
    }
  }

  private function setValueConfig(){
    foreach ($this->ValuesConfig as $Campo => $function) {
        if(preg_match('/(.*?)\[(.*)\]/', $function, $match)){
          $function = $match[1];
          $this->Values[$Campo] = $function($this->Values[$match[2]]);
        } else {
          $this->Values[$Campo] = $function($this->Values[$Campo]);
        }
    }
  }
}