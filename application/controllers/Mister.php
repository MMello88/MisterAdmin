<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(FALSE);
	}

	public function Empresa($action = 'grid', $id = ''){
		$this->set_config = 
			[
				'layout' => ['action' => $action, 'value' => $id],
				'table' => 
					['nome'     => 'tbl_empresa', 
					 'chave_pk' => 'id_empresa',
					 'display'  => 'Empresa'],
				'columns' => 
					[
					  'id_empresa' => 
						['display_column' => 'Id', 
							  'input' => ['type' => 'text', 'required' => 'readonly'],
							  'rules' => '',
							  'display_grid' => 'true'],
					  'nome' =>
					  	['display_column' => 'Nome', 
							  'input' => ['type' => 'text', 'required' => ''],
							  'rules' => 'required',
							  'display_grid' => 'true'],
					  'razao_social' =>
					  	['display_column' => 'Razão Social', 
							  'input' => ['type' => 'text', 'required' => 'required'],
							  'rules' => 'required',
							  'display_grid' => 'true'],
					  'nome_fantasia' =>
					  	['display_column' => 'Nome Fantasia', 
							  'input' => ['type' => 'text', 'required' => 'required'],
							  'rules' => 'required',
							  'display_grid' => 'true'],
					  'id_usuario' =>
					  	['display_column' => 'Id Usuário', 
							  'input' => ['type' => 'text', 'required' => 'readonly'],
							  'rules' => 'required',
							  'default_value' => $this->session->userdata('id_user'), 
							  'display_grid' => 'true'],
					  'sn_filial' =>
					  	['display_column' => 'Filial', 
							  'select' => ['s' => 'Sim', 'n' => 'Não'],
							  'rules' => 'required',
							  'default_value' => '', 
							  'display_grid' => 'true'],
					  'id_tipo' =>
					  	['display_column' => 'Filial', 
							  'select' => ['relacional' => ['campo', 'tbl_tipo',]],
							  'rules' => 'required',
							  'default_value' => '', 
							  'display_grid' => 'true'],

					],
				'where' => ['id_usuario' => $this->session->userdata('id_user')]/*,
				'dropdown' => array(),*/
			];
		$this->execute();
	}
}