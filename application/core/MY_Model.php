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

  public function get($id_value = '', $where = array()){
    $where = array_merge($where, $this->Where);
    if (!empty($id_value))
      $where[$this->FieldId] = $id_value;

    $query = $this->db->get_where($this->Table, $where);
    return $query->result_object();
  }

  public function getBy($field, $value){
    $query = $this->db->get_where($this->Table, array($field => $value));
    return $query->result_object();
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