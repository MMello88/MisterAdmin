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

	public function gerarMovimentacao($id_loja, $id_produto, $tipo_movimentacao, $qtde_movimentacao){
    
		$data_movimentacao = date("Y-m-d H:i:s");
		$data = array(
    		'id_loja' => $id_loja,
    		'id_produto' => $id_produto,
    		'tipo_movimentacao' => $tipo_movimentacao,
    		'data_movimentacao' => $data_movimentacao,
    		'qtde_movimentacao' => $qtde_movimentacao
  		);

		$this->db->insert('tbl_movimentacao_estoque', $data);

		$this->geraEstoque($id_loja, $id_produto, $tipo_movimentacao, $qtde_movimentacao);

		$this->geraFichaKardex($id_loja, $id_produto, $tipo_movimentacao, 'me', $qtde_movimentacao);
}

	public function geraFichaKardex($id_loja, $id_produto, $tipo_movimentacao, $origem_movimento, $qtde_movimentacao){
		$data = array(
	        'id_loja' => $id_loja,
	        'id_produto' => $id_produto,
	        'tipo_movimentacao' => $tipo_movimentacao,
	        'origem_movimentacao' => $origem_movimento,
	        'data_movimentacao' => date("Y-m-d H:i:s"),
	        'qtde_movimentacao' => $qtde_movimentacao
		);

    	$this->db->insert('tbl_ficha_kardex', $data);
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
			$this->db->where(array('id_loja' => $id_loja,'id_produto' => $id_produto));
	    	$this->db->update('tbl_estoque');
	    }
	}

	public function getprodutoByCategoria($id_categoria_produto) {
	    $query = $this->db->get_where('tbl_produto', array('id_categoria_produto' => $id_categoria_produto));
	    return $query->result_array();
	}

	public function getEstoque(){
		$query = $this->db->query(" SELECT e.id_estoque,
	       								   e.id_loja,
	        							   e.id_produto,
									       l.nome_fantasia,
									       p.nome produto,
									       e.qtde_total,
									       e.qtde_minima,
									       CASE WHEN e.qtde_total <= e.qtde_minima THEN 1 ELSE 0 END estoque_baixo
									  FROM tbl_estoque e
									  LEFT JOIN tbl_produto p ON (e.id_produto = p.id_produto)
									  LEFT JOIN tbl_loja l ON (l.id_loja = e.id_loja)");
		return $query->result_array();
	}

	public function AFazerRealizado($id_afazer, $realizado){
		$this->db->set('realizado', $realizado);
		$this->db->where(array('id_afazer' => $id_afazer));
    	$this->db->update('tbl_afazer');
	}

	public function getAFazer(){
		$query = $this->db->order_by('dt_fim', 'asc')->get_where('tbl_afazer', array('realizado' => 'n'));
	    return $query->result_array();
	}
}