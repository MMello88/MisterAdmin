<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
  
	public $data = array();
	public $set_config = array();

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

		if ($this->set_config['layout']['action'] == 'list')
			$this->set_config['layout']['action'] = 'grid';

		$this->data['segment_class'] = $this->uri->segment(1);
		$this->data['segment_funct'] = $this->uri->segment(2);

		foreach ($this->set_config['columns'] as $key => $config) {
			if(isset($config['select_relacional'])){
				$rows = $this->Mister->get_where($config['select_relacional'][1], $config['select_relacional'][3]);
				$campo_id = $config['select_relacional'][0];
				$campo_valor = $config['select_relacional'][2];
				$select = array();
				foreach ($rows as $row) {
					$select[$row->$campo_id] = $row->$campo_valor;
				}
				$this->set_config['columns'][$key]['select'] = $select;
			}
		}

		$this->data['set_config'] = $this->set_config;

		$this->Mister->setConfigMister($this->set_config);

		$layout = "base/".$this->set_config['layout']['action'];

		if($this->set_config['layout']['action'] == 'search'){
			$layout = "base/grid";
		}
		

		foreach ($this->set_config['columns'] as $column => $rules) {
			if($this->set_config['layout']['action'] == 'delete'){
				if ($column == $this->set_config['table']['chave_pk']){
					$this->form_validation->set_rules($column, $rules['display_column'], 'required');
				}
			} else if($this->set_config['layout']['action'] !== 'search') {
				if (isset($rules['rules'])){
					$this->form_validation->set_rules($column, $rules['display_column'], $rules['rules']);
				}
			}
		}

		$value = $this->set_config['layout']['value'];

		if ($this->form_validation->run() === TRUE){

			if($this->set_config['layout']['action'] == 'add'){
				$result = $this->Mister->insert();
				if (is_numeric($result)){
					$value = $result;
					$result = "Dados inserido com sucesso!";
				}
			}

			if($this->set_config['layout']['action'] == 'edit')
				$result = $this->Mister->update();

			if($this->set_config['layout']['action'] == 'delete') {
				$result = $this->Mister->delete();
				if (!is_array($result)){
					$this->session->set_flashdata('msg_flash', $result);
					redirect($this->uri->segment(1)."/".$this->uri->segment(2));
				}
			}

			if($this->input->post('btnSalvarVoltar') === "Salvar e Voltar"){
				$this->session->set_flashdata('msg_flash', $result);
				redirect($this->uri->segment(1)."/".$this->uri->segment(2));
			}

			if($this->set_config['layout']['action'] == 'search'){
				$where = array($this->input->post('search_field') . " LIKE " => "%".$this->input->post('search_value')."%");
				print_r($where);
				$this->data['rows'] = $this->Mister->get('', $where);
				$result = "Não foi encontrado nenhum resultado!";
				$result = "Consulta realizada com sucesso!";
			}

			if (is_array($result)){
				$this->data['erro_message'] = $result['message'];
			} else {
				$this->data['success_message'] = $result;
			}
		} 

		if($this->set_config['layout']['action'] !== 'add'){
			
			if ($this->set_config['layout']['action'] == 'grid') {
				if(empty($value)){
					$value = '0';
				}
				$this->data['rows'] = $this->Mister->get('', array(), 10, $value);

				$pagin['attributes'] = array('class' => 'page-link');
				$pagin['prev_tag_open'] = '<li class="page-item">';
				$pagin['prev_tag_close'] = '</li>';
				$pagin['next_tag_open'] = '<li class="page-item">';
				$pagin['next_tag_close'] = '</li>';
				$pagin['cur_tag_open'] = '<li class="page-item active"><span class="page-link">';
				$pagin['cur_tag_close'] = '</span></li>'; 
				$pagin['num_tag_open'] = '<li class="page-item">';
				$pagin['num_tag_close'] = '</li>'; 
				$pagin['base_url'] = base_url($this->uri->segment(1)."/".$this->uri->segment(2)."/list");
				$pagin['total_rows'] = count($this->Mister->get());
				$pagin['per_page'] = 10;
				$pagin['num_links'] = 5;
				$this->pagination->initialize($pagin);
			} else {
				$this->data['rows'] = $this->Mister->get($value);
			}
		}

		$this->_example_output(null, $layout);
	}
}

/*
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
                              'input' => array('type' => 'hidden', 'required' => ''),
                              'rules' => 'required',
                              'default_value' => '', 
                              'costumer_value' => 'md5', 
                              'display_grid' => 'true')
                    ),
                'where' => array('id_usuario' => $this->session->userdata('id_user'))/*,
                'dropdown' => array(),
            );
*/