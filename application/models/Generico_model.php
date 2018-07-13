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

	public function geraEstoque($id_loja, $id_produto, $tipo_movimentacao, $qtde_movimentacao){
		$query = $this->db->get_where('tbl_estoque', array('id_loja' => $id_loja, 'id_produto' => $id_produto));
		
		$qtde_movimentacao = $tipo_movimentacao === 's' ? ($qtde_movimentacao*-1) : $qtde_movimentacao;

	    if(empty($query->row())){
			$data = array(
		        'id_loja' => $id_loja,
		        'id_produto' => $id_produto,
		        'qtde_total' => $qtde_movimentacao
			);		    

	    	$this->db->insert('tbl_estoque', $data);
	    } else {
			$this->db->set('qtde_total', 'qtde_total+'.$qtde_movimentacao, FALSE);
			$this->db->where(array('id_loja' => $id_loja,'id_produto' => $id_produto,));
	    	$this->db->update('tbl_estoque', $data);
	    }
	}

	public function getprodutoByCategoria($id_categoria_produto) {
	    $query = $this->db->get_where('tbl_produto', array('id_categoria_produto' => $id_categoria_produto));
	    return $query->result_array();
	}
}