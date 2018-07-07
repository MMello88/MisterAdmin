<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Generico_model extends CI_Model {

	public function  __construct() {
	}
	
	public function getArquivoController($arquivo_controller_id) {
	    $query = $this->db->get_where('tbl_arquivo_controller', array('arquivo_controller_id' => $arquivo_controller_id));
	    return $query->row();
	}

	public function getFunctionByIdController($arquivo_controller_id) {
	    $query = $this->db->get_where('tbl_function_controller', array('arquivo_controller_id' => $arquivo_controller_id));
	    return $query->result_array();
	}
}