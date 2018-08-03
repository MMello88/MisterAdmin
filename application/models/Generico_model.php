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

	public function gerarMovimentacao($id_loja, $id_produto, $tipo_movimentacao, $qtde_movimentacao, $id_item_pedido = ''){
    
		$data_movimentacao = date("Y-m-d H:i:s");
		$data = array(
    		'id_loja' => $id_loja,
    		'id_produto' => $id_produto,
    		'tipo_movimentacao' => $tipo_movimentacao,
    		'data_movimentacao' => $data_movimentacao,
    		'qtde_movimentacao' => $qtde_movimentacao,
    		'id_item_pedido' => $id_item_pedido
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

	public function getPedidoSolicitados($id_pedido = ''){
		$sql = "SELECT p.id_pedido,
					   p.id_cidade,
				       c.nome nome_cliente,
				       cd.nome nome_cidade,
				       CASE
				         WHEN p.situacao = 's' THEN 'Solicitado'
				         WHEN p.situacao = 'v' THEN 'Visualizado'
				         WHEN p.situacao = 'p' THEN 'Produzindo'
				         WHEN p.situacao = 't' THEN 'Saíu p/ Entregar'
				         WHEN p.situacao = 'e' THEN 'Entregue'
				         ELSE '' END situacao,
				       p.data_pedido,
				       CASE
				         WHEN p.forma_pgto = 'd' THEN 'Dinheiro'
				         WHEN p.forma_pgto = 'cd' THEN 'Cartão de Débito'
				         WHEN p.forma_pgto = 'cc' THEN 'Cartão de Crédito'
				         ELSE '' END forma_pgto,
				       CASE 
				         WHEN p.forma_entrega = 'r' THEN 'Retirar'
				         WHEN p.forma_entrega = 'e' THEN 'Entregar'
				         ELSE '' END forma_entrega,
				       p.valor,
				       CASE 
				         WHEN p.forma_entrega = 'e' THEN p.taxa_entrega
				         ELSE 0 END taxa_entrega,
				       p.valor_total,
				       CONCAT(p.data_entrega, ' ', p.hora_entrega) dthr_entrega,
				       CASE 
				         WHEN p.end_entrega IS NULL THEN CONCAT(c.endereco, ', Nr.', c.numero, ', ', c.bairro, ' ', IFNULL(c.complemento,''))
				         ELSE CONCAT(IFNULL(p.end_entrega,''), ', Nr.', IFNULL(p.num_entrega,''), ' ', IFNULL(p.bairro_entrega,''), ' ', IFNULL(p.comp_entrega,'')) END end_completo
				  FROM tbl_pedido p
				  LEFT JOIN tbl_cliente c ON (c.id_cliente = p.id_cliente)
				  LEFT JOIN tbl_cidade cd ON (cd.id_cidade = p.id_cidade)
				 WHERE p.situacao = 's' ";
		if(!empty($id_pedido)){
			$sql .= " AND p.id_pedido = $id_pedido";
		}
		$sql .= " ORDER BY p.data_entrega, p.hora_entrega";
		$query = $this->db->query($sql);
		$pedidos = $query->result_array();

		foreach ($pedidos as $key => $pedido) {
			$pedidos[$key]['itens'] = $this->getItensPedido($pedido['id_pedido']);
		}

		return $pedidos;
	}

	public function getItensPedido($id_pedido){
		$query = $this->db->query(" SELECT i.id_item_pedido,
									       p.id_produto,
									       p.nome nome_produto,
									       c.nome nome_categoria,
									       i.qtde
									  FROM tbl_item_pedido i
									  LEFT JOIN tbl_produto p ON (p.id_produto = i.id_produto)
									  LEFT JOIN tbl_categoria_produto c ON (c.id_categoria_produto = i.id_categoria_produto)
									 WHERE i.id_pedido = $id_pedido");
		return $query->result_array();
	}

	public function AlterarSituacaoPedido($id_pedido, $situacao){
		$this->db->set('situacao', $situacao);
		$this->db->where(array('id_pedido' => $id_pedido));
    	$this->db->update('tbl_pedido');
	}

	public function geraProximaContaAPagarFixa($key, $nrvezes = FALSE){
		$query = $this->db->get_where('tbl_contas_apagar', array('id_contas_apagar' => $key));
		$conta = $query->row();
		$conta->dt_cadastro = date("Y-m-d H:i:s");
		$conta->dt_venc = date('Y-m-d', strtotime("+1 month", strtotime($conta->dt_venc)));
		$conta->situacao = 'a';
		$conta->id_contas_apagar = null;
		$conta->dt_pago = null;
		$conta->valor_pgto = null;
		$conta->valor_desconto = null;
		$conta->valor_juros = null;
		$conta->tipo_pagamento = null;
		if ($nrvezes){
			if ($conta->nr_vezes <> null)
				if((int)$conta->nr_vezes >= 2){
					$conta->nr_vezes = (int)$conta->nr_vezes - 1;
					$this->db->insert('tbl_contas_apagar', $conta);
				}
		} else {
			$conta->nr_vezes = null;
			$this->db->insert('tbl_contas_apagar', $conta);
		}
	}

	public function geraProximaContaAReceberFixa($key, $nrvezes){
		$query = $this->db->get_where('tbl_contas_areceber', array('id_contas_areceber' => $key));
		$conta = $query->row();
		//log_message('error', json_encode($conta));
		$conta->dt_cadastro = date("Y-m-d H:i:s");
		$conta->dt_venc = date('Y-m-d', strtotime("+1 month", strtotime($conta->dt_venc)));
		$conta->situacao = 'a';
		$conta->id_contas_areceber = null;
		$conta->dt_recebido = null;
		$conta->valor_recebido = null;
		$conta->valor_desconto = null;
		$conta->valor_juros = null;
		$conta->tipo_recebimento = null;
		if ($nrvezes){
			if ($conta->nr_vezes <> null)
				if((int)$conta->nr_vezes >= 2){
					$conta->nr_vezes = (int)$conta->nr_vezes - 1;
					$this->db->insert('tbl_contas_areceber', $conta);
				}
		} else {
			$conta->nr_vezes = null;
			$this->db->insert('tbl_contas_areceber', $conta);
		}
	}
}