<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
  
	public $data = array();
	public $set_config = array();
	private $view;

	public function __construct($checa_loginho = FALSE)
	{
		parent::__construct();
		if (($checa_loginho) && ($this->session->userdata('is_loginho') === null)) redirect('/');
		$this->getMenus();
	}

	public function _output_view($output = null, $view = '')
	{
		$output = array_merge($this->data,(array)$output);
		$this->load->view('base/header',$output);
		$this->load->view("base/$view",$output);
		$this->load->view('base/footer',$output);
	}

	public function getMenus(){
		$this->data['menus'] = $this->Generico->getAllMenus();
	}

	private function defineSegment(){
		if(isset($this->set_config['table']['chave_pai'])){
		    $class  = $this->uri->segment(1);
			$funct  = $this->uri->segment(2);
			$view   = $this->uri->segment(4);
			$valor  = $this->uri->segment(5);
		} else {
			$class  = $this->uri->segment(1);
			$funct  = $this->uri->segment(2);
			$view   = $this->uri->segment(3);
			$valor  = $this->uri->segment(4);
		}

		$this->set_config['layout']['limit'] = 0;
		$this->set_config['layout']['view'] = $view;
		$this->view = $view;

		if (in_array($view,['edit','view','delete'])) {
			$this->set_config['layout']['value'] = $valor;
		}

		if (in_array($view,['list'])) {
			$this->set_config['layout']['limit'] = $valor;
		}

		if (in_array($view,['','search','list'])) {
			if(empty($view)){
				$this->set_config['layout']['limit'] = 0;
				$this->set_config['layout']['view'] = 'grid';
			}
			$this->view = "grid";
		}

		if (!in_array($view,['add','edit','view','delete', 'list', 'search'])) {
			$valor = $view;
			$this->view = "grid";
			$this->set_config['layout']['value'] = $valor;
		}

		//echo "$class / $funct / $view / $valor <br/>";
		//print_r($this->set_config['layout']);
		$this->data['segment_class'] = $class;
		$this->data['segment_funct'] = $funct;

		$this->view = $this->view;

		$this->data['chave_pai'] = "";
		$this->data['link_chave_pai'] = "";
		if(isset($this->set_config['table']['chave_pai'])){
			$key = $this->set_config['table']['chave_pai'];
		    $value_pai = $this->set_config['columns'][$key]['default_value'];
		    $this->data['chave_pai'] = $value_pai;
		    $this->data['link_chave_pai'] = "$value_pai/";
		}
	}

	private function doConfigInputSelect(){
		foreach ($this->set_config['columns'] as $key => $config) {

			if(isset($config['select_relacional'])){

				$campo_id = $config['select_relacional'][0];
				$table = $config['select_relacional'][1];
				$campo_valor = $config['select_relacional'][2];
				$where = $config['select_relacional'][3];

				$rows = $this->Mister->get_where($table, $where);

				$select = array();
				foreach ($rows as $row) {
					$select[$row->$campo_id] = $row->$campo_valor;
				}
				$this->set_config['columns'][$key]['select'] = $select;
			}
		}

		$this->data['set_config'] = $this->set_config;
	}

	private function doRules(){
		foreach ($this->set_config['columns'] as $column => $rules) {
			if($this->set_config['layout']['view'] == 'delete'){
				if ($column == $this->set_config['table']['chave_pk'])
					$this->form_validation->set_rules($column, $rules['display_column'], 'required');
			} else if(in_array($this->set_config['layout']['view'], ['grid','search'])) {
				$this->form_validation->set_rules('search_field', 'Pesquisar por:', 'required');
				$this->form_validation->set_rules('search_value', 'Valor da Pesquisa', 'required');
			} else {
				if (isset($rules['rules']))
					$this->form_validation->set_rules($column, $rules['display_column'], $rules['rules']);
			}
		}
	}

	private function getRows(){
		if (in_array($this->set_config['layout']['view'],['view','edit', 'delete'])) {
			$this->data['rows'] = $this->Mister->get($this->set_config['layout']['value']);
		}

		if(in_array($this->set_config['layout']['view'],['grid', 'list'])){

			$this->data['rows'] = $this->Mister->get('', array(), 10, $this->set_config['layout']['limit']);

			$pagin['attributes'] = array('class' => 'page-link');
			$pagin['prev_tag_open'] = '<li class="page-item">';
			$pagin['prev_tag_close'] = '</li>';
			$pagin['next_tag_open'] = '<li class="page-item">';
			$pagin['next_tag_close'] = '</li>';
			$pagin['cur_tag_open'] = '<li class="page-item active"><span class="page-link">';
			$pagin['cur_tag_close'] = '</span></li>'; 
			$pagin['num_tag_open'] = '<li class="page-item">';
			$pagin['num_tag_close'] = '</li>'; 
			$pagin['base_url'] = base_url($this->uri->segment(1)."/".$this->uri->segment(2)."/".$this->data['link_chave_pai']."/list");
			$pagin['total_rows'] = count($this->Mister->get());
			$pagin['per_page'] = 10;
			$pagin['num_links'] = 5;
			$this->pagination->initialize($pagin);
		}

		if($this->set_config['layout']['view'] == 'search') {
			$where = array();
			if ($this->form_validation->run() === TRUE){
				$where = array($this->input->post('search_field') . " LIKE " => "%".$this->input->post('search_value')."%");
				$this->session->set_userdata('search_field', $this->input->post('search_field'));
				$this->session->set_userdata('search_value', $this->input->post('search_value'));
			} else {
				if($this->session->userdata('search_field') !== null && $this->session->userdata('search_value') !== null){
					$where = array($this->session->userdata('search_field') . " LIKE " => "%".$this->session->userdata('search_value')."%");	
				}
			}

			$this->data['rows'] = $this->Mister->get('', $where);
			if (empty($this->data['rows']))
				$this->data['erro_message'] = "Não foi encontrado nenhum resultado!";
			else
				$this->data['success_message'] = "Consulta realizada com sucesso!";
		}
	}

	private function doFormValidation(){
		$result = "";

		if ($this->form_validation->run() === TRUE){
			if($this->set_config['layout']['view'] == 'add'){
				$result = $this->Mister->insert();
				if (is_numeric($result)){
					$result = "Dados inserido com sucesso!";
				}
			}

			if($this->set_config['layout']['view'] == 'edit')
				$result = $this->Mister->update();

			if($this->set_config['layout']['view'] == 'delete') {
				$result = $this->Mister->delete();
				if (!is_array($result)){
					$this->session->set_flashdata('msg_flash', $result);
					redirect($this->uri->segment(1)."/".$this->uri->segment(2)."/".$this->data['link_chave_pai']);
				}
			}

			if($this->input->post('btnSalvarVoltar') === "Salvar e Voltar"){
				$this->session->set_flashdata('msg_flash', $result);
				redirect($this->uri->segment(1)."/".$this->uri->segment(2)."/".$this->data['link_chave_pai']);
			}

			if (is_array($result)){
				$this->data['erro_message'] = $result['message'];
			} else {
				$this->data['success_message'] = $result;
			}
		}
	}

	public function doLinkBack(){
		$this->data['LinkGoBack'] = "";
		$arrLinkBack = $this->session->userdata("arrLinkBack");
		if($arrLinkBack === null){
			$arrLinkBack = array();
			array_push($arrLinkBack,$this->uri->uri_string());
		} else {
			$key = array_search($this->uri->uri_string(), $arrLinkBack);
			if ($key === FALSE){
				$this->data['LinkGoBack'] = $arrLinkBack[count($arrLinkBack) == 1 ? 0 : count($arrLinkBack)-1];
				$arrLinkBack[] = $this->uri->uri_string();

			}
			else {
				$arrLinkBack = array_slice($arrLinkBack, -count($arrLinkBack), $key+1);
				$this->data['LinkGoBack'] = $key == 0 ? "" : $arrLinkBack[$key-1];
			}
		}
		$this->session->set_userdata("arrLinkBack", $arrLinkBack);
	}

	public function PaginasAnteriores(){
		$this->data['PagAnterior'] = "";
		 $arrPaginas = $this->session->userdata("arrPaginas");
		if($arrPaginas === null){
			$arrPaginas = array();
			array_push($arrPaginas,$this->uri->uri_string());
		} else {
			$key = array_search($this->uri->uri_string(), $arrPaginas);
			if ($key === FALSE){
				$this->data['PagAnterior'] = $arrPaginas[count($arrPaginas) == 1 ? 0 : count($arrPaginas)-1];
				$arrPaginas[] = $this->uri->uri_string();

			}
			else {
				$arrPaginas = array_slice($arrPaginas, -count($arrPaginas), $key+1);
				$this->data['PagAnterior'] = $key == 0 ? "" : $arrPaginas[$key-1];
			}
		}
		$this->session->set_userdata("arrPaginas", $arrPaginas);
	}

	public function execute(){

		$this->PaginasAnteriores();

		$this->doLinkBack();
		
		$this->defineSegment();		

		$this->doConfigInputSelect();
		
		$this->Mister->setConfigMister($this->set_config);

		$this->doRules();	

		$this->doFormValidation();
		
		$this->getRows();

		$this->_output_view(null, $this->view);
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