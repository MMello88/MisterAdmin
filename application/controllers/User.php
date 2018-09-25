<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User class.
 * 
 * @extends CI_Controller
 */
class User extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public $data;

	public function __construct() {
		
		parent::__construct();
	}
	
	
	public function index() {
	}

	public function register(){
		if($this->session->userdata('id_usuario')){
			redirect('Dashboard/index');
		}

		$this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[tbl_usuario.email]');
		$this->form_validation->set_rules('senha', 'Senha', 'trim|required|min_length[8]');
		$this->form_validation->set_rules('resenha', 'Confirmar Senha', 'required|min_length[8]|matches[senha]');
		$this->form_validation->set_rules('nome', 'Nome', 'trim|required');

		if ($this->form_validation->run() === FALSE)
		{
			$this->load->view('user/includes/headerV3', $this->data);
			$this->load->view('user/register/register', $this->data);
			$this->load->view('user/includes/footerV3', $this->data);
		} else {
            $idUsuario = $this->Usuario->insert();
            if(is_numeric($idUsuario)){
				$this->data['usuario'] = $this->Usuario;
				$this->enviarEmailCofirmandoAcesso($this->Usuario->Values['nome'], $this->Usuario->Values['email'], $this->Usuario->Values['hash']);
				$this->load->view('user/includes/headerV3', $this->data);
				$this->load->view('user/register/register_success', $this->data);
				$this->load->view('user/includes/footerV3', $this->data);
			} else {
				$this->data['erro_cadastro'] = "Erro ao realizar o cadastro. Erro: " . $idUsuario;
				$this->load->view('user/includes/headerV3', $this->data);
				$this->load->view('user/register/register', $this->data);
				$this->load->view('user/includes/footerV3', $this->data);
				
			}
		}
	}

	public function forgot($hash = ''){
		$this->data['titulo'] = 'Recupere a sua senha - Mister Salgadinhos.';
		$this->data['hash'] = $hash;
		if (empty($hash)){
			$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
			if ($this->form_validation->run() === TRUE){
				$usuario = $this->Usuario->getBy('email',$this->input->post('email'));
				if (empty($usuario)){
					$this->data['email_nao_encontrado'] = 'E-mail não foi encontrado em nossa base de dados. Verifique novamente!';
				} else {
					$novoHash = md5($usuario->email);
					$this->Usuario->gerarNovoHash($usuario->id_usuario, $novoHash);
					$this->enviarEmailRecuperarSenha($usuario->nome, $usuario->email, $novoHash);
					$this->data['email_encontrado'] = 'Foi enviado em seu e-mail instruções para recuperar o sua senha.';
				}
			} 
		} else {
			$this->form_validation->set_rules('senha', 'Senha', 'trim|required|min_length[8]');
			if ($this->form_validation->run() === TRUE){
				$usuario = $this->Usuario->getBy('hash', $hash);
				if(!empty($usuario)){
					$this->Usuario->alterarSenha($usuario->id_usuario, $this->input->post('senha'));
					$this->Usuario->ativarUsuario($usuario->id_usuario);
					$this->data['recuperado_sucesso'] = "Senha foi alterada com sucesso! <a href='".base_url('Portal/login')."'> Clique aqui </a> para realizar novamente o loginho!";
				} else {
					$this->data['email_nao_encontrado'] = 'Não tem nenhuma solicitação de recuperar senha!';
				}
			}
		}

		$this->load->view('user/includes/headerV3', $this->data);
		$this->load->view('user/forgot/forgot', $this->data);
		$this->load->view('user/includes/footerV3', $this->data);
	}

	/**
	 * login function.
	 * 
	 * @access public
	 * @return void
	 */
	public function login() {
		
		/*if ($this->session->userdata('is_loginho') !== null && $this->session->userdata('is_loginho') === true)
			redirect('Dashboard/index');*/

		// create the data object
		$data = new stdClass();
		
		// load form helper and validation library
		$this->load->helper('form');
		$this->load->library('form_validation');
		
		// set validation rules
		$this->form_validation->set_rules('email', 'Usuário', 'trim|required|valid_email');
		$this->form_validation->set_rules('senha', 'Password', 'trim|required|min_length[8]');
		
		if ($this->form_validation->run() == false) {
			
			// validation not ok, send validation errors to the view
			$this->load->view('user/includes/headerV3');
			$this->load->view('user/login/loginV3');
			$this->load->view('user/includes/footerV3');
			
		} else {
			
			// set variables from the form
			$email = $this->input->post('email');
			$senha = $this->input->post('senha');
			
			$usuario = $this->resolve_user_login($email, $senha);
			if ($usuario !== null) {
				$arrConfirm = array(
					"is_loginho" => True,
					"id_user"    => $usuario->id_usuario,
					"nome_user"  => $usuario->nome,
					"email_user" => $usuario->email);
				$this->session->set_userdata($arrConfirm);
				
				// user login ok
				redirect('Dashboard/index');
				
			} else {
				
				// login failed
				$data->error = 'Usuário e Senha errados.';
				
				// send error to the view
				$this->load->view('user/includes/headerV3');
				$this->load->view('user/login/loginV3', $data);
				$this->load->view('user/includes/footerV3');
			}
		}
	}
	
	/**
	 * logout function.
	 * 
	 * @access public
	 * @return void
	 */
	public function logout() {
		
		// create the data object
		$data = new stdClass();
		
		if ($this->session->userdata('is_loginho') !== null && $this->session->userdata('is_loginho') === true) {
			
			// remove session datas
			$this->session->unset_userdata('is_loginho');
			$this->session->unset_userdata('nome_user');
			
			// user logout ok
			$this->load->view('user/includes/headerV3');
			$this->load->view('user/logout/logout_success', $data);
			$this->load->view('user/includes/footerV3');
			
		} else {
			
			// there user was not logged in, we cannot logged him out,
			// redirect him to site root
			redirect('/');
		}
	}

	public function resolve_user_login($email, $senha)
	{
		$usuarios = $this->Usuario->getBy('email',$email);
		$usuario = $usuarios[0];
		
		if (empty($usuario)) return null;
		
		if ($usuario->email === $email && $usuario->senha === md5($senha))
			return $usuario;
		return null;
	}

	public function ativar($hash){
		$usuario = $this->Usuario->getBy('hash', $hash);
		if(!empty($usuario)){
			if ($this->Usuario->ativarUsuario($usuario->id_usuario) === TRUE){
				$this->data['usuario'] = $usuario;
				$this->load->view('user/includes/headerV3', $this->data);
				$this->load->view('user/register/register_ativado', $this->data);
				$this->load->view('user/includes/footerV3', $this->data);
				return;
			} 
		}
		$this->load->view('includes/header_navbar_fixed_top', $this->data);
		$this->load->view('cliente/erro_ativacao', $this->data);
		$this->load->view('includes/footer_main', $this->data);
	}

	private function enviarEmailCofirmandoAcesso($nome, $email, $hash){
    	$link = base_url("Portal/ativar/$hash");
    	$html = 
		"<!DOCTYPE html>
		<html lang=\"pt-br\">
		  <head>
		  </head>
		  <body> 
		    <h3><b>Olá,  {$nome}.</b></h3>
		    <p>Sejá Bem Vindo ao <b>Mister</b> Salgadinhos</p>
		    <p>
		    Agradecemos pela preferência.</b> Pedimos que clique no link abaixo para ativar sua conta. <br>
		    Após clicar no link para ativar sua conta já poder realizar compras em nossa loja virtual. <br>
		    Obrigado!
		    </p>
		    <a href='{$link}'>Clique Aqui - Ativar sua Conta</a>
		    <br/>
		    <p><smal>**Por favor, não responder para este e-mail</smal></p>
		  </body>
		</html>";

		if (ENVIRONMENT === 'development'){
		    $this->load->library('email');
		    $this->email
		      ->from('pedido@mistersalgadinhos.com.br', 'Mister Salgadinhos')
		      ->to($email)
		      ->subject("Mister Salgadinhos - Link para ativar o cadastro!.")
		      ->message($html)
		      ->send();
	    }
    }

    private function enviarEmailRecuperarSenha($nome, $email, $hash){
    	$link = base_url("Portal/forgot/$hash");
    	$link_ativar = base_url("Portal/forgot/$hash");
    	$html = 
		"<!DOCTYPE html>
		<html lang=\"pt-br\">
		  <head>
		  </head>
		  <body> 
		    <h3><b>Olá,  {$nome}.</b></h3>
		    <p>Você solicitou a recuperação de senha do <b>Mister</b> Salgadinhos?</p>
		    <p>
		    Se foi você quem solicitou a recuperação de senha por favor <a href='{$link}'>Clique Aqui</a> para registrar uma nova senha. <br>
		    Se não foi você quem solicitou a recuperação de senha por favor <a href='{$link_ativar}'>Clique Aqui</a> para desfazer este pedido. <br>
		    Obrigado!
		    </p>
		    <br/>
		    <p><smal>**Por favor, não responder para este e-mail</smal></p>
		  </body>
		</html>";

		if (ENVIRONMENT === 'development'){
		    $this->load->library('email');
		    $this->email
		    	->from('pedido@mistersalgadinhos.com.br', 'Mister Salgadinhos')
		    	->to($email)
		    	->subject("Mister Salgadinhos - Pedido de Recuperação de Senha.")
		    	->message($html)
		    	->send();
		}
    }
}
