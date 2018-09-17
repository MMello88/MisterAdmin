<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class BemVindo extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index(){
		$this->load->view('bemvindo/index');
	}

	public function planos(){
		$this->load->view('bemvindo/planos');
	}
}