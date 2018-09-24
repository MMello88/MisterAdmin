<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
  
	public $data = array();
	public $set_config = array();
	/* exemplo
	$this->set_config = 
		array(
			'table' => 
				array('nome'     => 'tbl_empresa', 
					  'chave_pk' => 'id_empresa'
					  'display'  => 'Empresa'),
			'columns' => 
				array('id_empresa' => 
					array('Id Empresa', 'required', 'valordefailt', 'tratar_compo', 'apresenta na grid'),
				),
			'dropdown' => array(),
		);
	*/

	public function __construct($checa_loginho = FALSE)
	{
		parent::__construct();
		if ($checa_loginho) 
			if ($this->session->userdata('is_loginho') === null) redirect('/');
		
		$this->data['__CLASS__'] = __CLASS__;
		$this->getStatusPedido(False);
		$this->getMenus();
	}

	public function getMenus(){
		$this->data['menus'] = $this->Generico->getAllMenus();
	}

	public function getStatusPedido($param = True){
		$this->data['PedidoAbertoFechado'] = $this->Pedidos->getQtdAbertoFechado();
		if($param === True)
			print_r(json_encode($this->data['PedidoAbertoFechado']));
	}

	public function _example_output($output = null, $layout = 'restrito/admin')
	{
		$output = array_merge($this->data,(array)$output);
		$this->load->view('restrito/header_admin',$output);
		$this->load->view("$layout",$output);
		$this->load->view('restrito/footer_admin',$output);
	}

	public function execute(){


		$layout = "base/".$this->set_config['layout']['action'];

		if(empty($this->set_config['layout']['action'])){
			$this->data['rows'] = $this->Mister->get($this->set_config['layout']['value']);
			$layout = "base/grid";
			//configurar para a view grid
		} else if($this->set_config['layout']['action'] == 'view'){
			$this->data['row'] = $this->Mister->get($this->set_config['layout']['value']);
			//tela para visualizar
		} else if(in_array($this->set_config['layout']['action'], array('add', 'edit', 'delete'))){

			//tela para edição e adição
		}


		foreach ($this->set_config['columns'] as $column => $rules) {
			echo 'coluna:'. $column . '<br/>';

			$this->form_validation->set_rules($column, $rules['display_column'], $rules['rules']);

			//print_r($rules);
			foreach ($rules as $rule => $value) {
				if ($rule === 'rules'){
					echo 'achou ';
					echo $rule .' => '. $value .' / ';
				}
				//echo $rule .' => '. $value .' / ';
			}

		}

		$this->_example_output(null, $layout);

	}
}