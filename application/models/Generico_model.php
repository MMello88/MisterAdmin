<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Generico_model extends CI_Model {

	public function  __construct() {
	}
	
	public function getArquivoController($arquivo_controller_id) {
	    $query = $this->db->get_where('tbl_arquivo_controller', array('arquivo_controller_id' => $arquivo_controller_id));
	    return $query->row();
	}

	public function getFunctionByIdController($arquivo_controller_id) {
	    $query = $this->db->get_where('tbl_function_controller', array('arquivo_controller_id' => $arquivo_controller_id));
	    return $query->result_array();
	}

	public function getMenus(){
		$query = $this->db->order_by('order', 'ASC')->get_where('tbl_menu', array('ativo' => 'a'));
	    return $query->result_array();	
	}

	public function getSubMenu($menu_id) {
	    $query = $this->db->join('tbl_arquivo_controller', 'tbl_arquivo_controller.arquivo_controller_id = tbl_submenu.arquivo_controller_id')
	    				  ->join('tbl_function_controller', 'tbl_function_controller.function_controller_id = tbl_submenu.function_controller_id')
	    				  ->order_by('order', 'ASC')
	    				  ->get_where('tbl_submenu', array('menu_id' => $menu_id, 'ativo' => 'a'));
	    return $query->result_array();
	}

	public function getAllMenus(){
		$menus = $this->getMenus();
		foreach ($menus as $key => $menu) {
			$menus[$key]['submenus'] = $this->getSubMenu($menu['menu_id']);
		}
		return $menus;
	}
}