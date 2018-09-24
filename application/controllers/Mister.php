<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(FALSE);
	}

	public function Empresa($action = 'grid', $id = ''){
		print_r($_POST);
		$this->set_config = 
			array(
				'layout' => array('action' => $action, 'value' => $id),
				'table' => 
					array('nome'     => 'tbl_empresa', 
						  'chave_pk' => 'id_empresa',
						  'display'  => 'Empresa'),
				'columns' => 
					array(
					  'id_empresa' => 
						array('display_column' => 'Id', 
							  'input' => array('type' => 'text', 'required' => 'readonly'),
							  'rules' => '',
							  'display_grid' => 'true'),
					  'nome' =>
					  	array('display_column' => 'Nome', 
							  'input' => array('type' => 'text', 'required' => ''),
							  'rules' => 'required',
							  'display_grid' => 'true'),
					  'razao_social' =>
					  	array('display_column' => 'Razão Social', 
							  'input' => array('type' => 'text', 'required' => 'required'),
							  'rules' => 'required',
							  'display_grid' => 'true'),
					  'nome_fantasia' =>
					  	array('display_column' => 'Nome Fantasia', 
							  'input' => array('type' => 'text', 'required' => 'required'),
							  'rules' => 'required',
							  'display_grid' => 'true'),

					),
				'where' => array('id_usuario' => $this->session->userdata('id_user'))/*,
				'dropdown' => array(),*/
			);
		$this->execute();
	}
}