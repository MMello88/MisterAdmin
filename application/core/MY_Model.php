<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

abstract class MY_Model extends CI_Model {

  public $Values = array();
  public $Fields = array();
  public $FieldId = null;
  public $Table = null;
  public $ValuesDefault = array();
  public $ValuesConfig = array();

  public function __construct() {
    $this->setConfigure();
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

  public function insert(){
    $this->setDefault();
    $this->setValueConfig();
    if ($this->db->insert($this->Table, $this->Values)){
        $this->Values[$this->FieldId] = $this->db->insert_id();
        return $this->Values[$this->FieldId];
    }
    else
        return $this->db->error()['message'];
  }

  public function update(){
    $this->db->update($this->Table, $this->Values, array($this->FieldId => $this->Values[$this->FieldId]));
    if ($this->db->error()['code'] > 0)
      return $this->db->error()['message'];
    return 'Dados Atualizado com Sucesso';
  }

  public function delete(){        
    $this->db->delete($this->Table, array($this->FieldId => $this->Values[$this->FieldId]));
    if ($this->db->error()['code'] > 0)
      $this->set_log_error_db();
    $this->set_response_db('Removido com sucesso');
  }

  public function get($id_value = ''){
    if (empty($id_value)) {
      $query = $this->db->get_where($this->Table, array($this->FieldId => $id_value));
      $result = $query->result_object();
      return empty($result) ? "" : $result[0];
    } else {
      $query = $this->db->get($this->Table);
      $result = $query->result_object();
      return empty($result) ? "" : $result;
    }    
  }

  public function getBy($field, $value){
    $query = $this->db->get_where($this->Table, array($field => $value));
    $result = $query->result_object();
    return empty($result) ? "" : $result[0];
  }
}