<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Empresa extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(TRUE);
	}

	public function index(){
		$usuario = $this->Usuario->getByEmail($this->session->userdata('email_user'));
		$this->data['usuario'] = $usuario;
		$this->_example_output(null, 'restrito/perfil/perfil');
	}

	public function add(){
		$this->_example_output(null, 'restrito/empresa/empresa_edit');
	}

	public function edit($id){
		$this->form_validation->set_rules('telefone', 'Telefone', 'trim|required');
		$this->form_validation->set_rules('end_completo', 'Endereço Completo', 'trim|required');
		if ($this->form_validation->run() === TRUE)
		{
			$this->data['msg_result'] = $this->Usuario->update();
		}
		
		$usuario = $this->Usuario->getByEmail($this->session->userdata('email_user'));

		$this->data['usuario'] = $usuario;
		$this->_example_output(null, 'restrito/empresa/empresa_edit');
	}

	public function salvar(){
		
	}
}