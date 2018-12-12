<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends MY_Controller {
	
	public function __construct()
	{
    parent::__construct(TRUE);
    $this->output->enable_profiler(TRUE);
  }
    
  public function index($aLink){
    $this->set_config = $this->Main->compile($aLink);
    //print_r($this->set_config);
    $this->execute();
  }
}