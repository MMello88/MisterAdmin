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
	public function __construct() {
		
		parent::__construct();
	}
	
	
	public function index() {
	}

	public function register(){
		$this->load->view('user/includes/headerV3');
		$this->load->view('user/register/register');
		$this->load->view('user/includes/footerV3');
	}

	public function forgot(){
		$this->load->view('user/includes/headerV3');
		$this->load->view('user/forgot/forgot');
		$this->load->view('user/includes/footerV3');
	}

	/**
	 * login function.
	 * 
	 * @access public
	 * @return void
	 */
	public function login() {
		
		if ($this->session->userdata('is_loginho') !== null && $this->session->userdata('is_loginho') === true)
			redirect('Dashboard/index');

		// create the data object
		$data = new stdClass();
		
		// load form helper and validation library
		$this->load->helper('form');
		$this->load->library('form_validation');
		
		// set validation rules
		$this->form_validation->set_rules('user', 'Usuário', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
		
		if ($this->form_validation->run() == false) {
			
			// validation not ok, send validation errors to the view
			$this->load->view('user/includes/headerV3');
			$this->load->view('user/login/loginV3');
			$this->load->view('user/includes/footerV3');
			
		} else {
			
			// set variables from the form
			$user = $this->input->post('user');
			$password = $this->input->post('password');
			
			if ($this->resolve_user_login($user, $password)) {
				
				$arrConfirm = array(
					"is_loginho" => True,
					"nome_user"  => ucfirst($this->input->post('user')));
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

	public function resolve_user_login($user, $password)
	{
		$arrUserSenha = array('matheus' => '#@!mello', 'rogerio' => '1mister');
		foreach ($arrUserSenha as $key => $value) {
			if ($key === $user && $value === $password)
				return true;
		}
		return false;
	}
}
