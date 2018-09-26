<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(FALSE);
	}

	public function Empresa($action = 'grid', $id = ''){
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
					  'id_usuario' =>
					  	array('display_column' => 'Id Usuário', 
							  'input' => array('type' => 'hidden', 'required' => ''),
							  'rules' => 'required',
							  'default_value' => $this->session->userdata('id_user'), 
							  'display_grid' => 'true'),
					  	'id_tipo' =>
					  	array('display_column' => 'Filial', 
							  'select' => array('1' => 'Principal', '2' => 'Filial'),
							  'rules' => 'required',
							  'default_value' => '', 
							  'display_grid' => 'true'),

					),
				'where' => array('id_usuario' => $this->session->userdata('id_user'))/*,
				'dropdown' => array(),*/
			);
		$this->execute();
	}
}