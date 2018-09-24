<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(FALSE);
	}

	public function Empresa($action = '', $id = ''){
		$this->set_config = 
			array(
				'layout' => array('action' => $action, 'value' => $id),
				'table' => 
					array('nome'     => 'tbl_empresa', 
						  'chave_pk' => 'id_empresa',
						  'display'  => 'Empresa'),
				'columns' => 
					array('id_empresa' => 
						array('display_column' => 'Id Empresa', 
							  'rules' => 'required', 
							  'default_value' => '', 
							  'costumer_value' => 'md5', 
							  'display_grid' => 'true')
					)/*,
				'dropdown' => array(),*/
			);
		$this->execute();
	}
}