<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

abstract class MY_Model extends CI_Model {

  public function __construct() {
  }
  
  protected function set_post($class){
    if ($_POST) {
      $class_vars = array_keys(get_class_vars(get_class($class)));
      foreach($class_vars as $var){
        $class->$var = empty($this->input->post($var)) ? $class->$var : $this->input->post($var);
      }
    }
  }
}