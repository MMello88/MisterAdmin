<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public $data = array();

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('is_loginho') === null)
			redirect('/');
		$this->getStatusPedido(False);
	}

	public function getStatusPedido($param = True){
		$this->data['PedidoAbertoFechado'] = $this->Pedidos->getQtdAbertoFechado();
		if($param === True)
			print_r(json_encode($this->data['PedidoAbertoFechado']));
	}

	public function _example_output($output = null)
	{
		$output = array_merge($this->data,(array)$output);
		$this->load->view('restrito/admin.php',$output);
	}

	public function index()
	{
		$this->data['main_page'] = 'isset';
		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}

	public function cliente_unique($id_cliente = '')
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_cliente');
		if (!empty($id_cliente)){
			$crud->where('tbl_cliente.id_cliente',$id_cliente);
		}
		$crud->set_subject('Cadastro de Cliente');
		$crud->columns('nome','email','endereco','tipo');
		$crud->fields('id_cliente','nome','cpf_cnpj','email','senha','telefone','endereco','numero','bairro',                     
					  'complemento','situacao','tipo','ganho_unitario','ativo');
		
		$crud->display_as('nome','Nome');
		$crud->display_as('email','E-mail');
		$crud->display_as('cpf_cnpj','CPF/CNPJ');
		$crud->display_as('senha','Senha');
		$crud->display_as('telefone','Telefone');
		$crud->display_as('endereco','Endereco');
		$crud->display_as('numero','N°');
		$crud->display_as('bairro','Bairro');
		$crud->display_as('complemento','Complemento');
		$crud->display_as('situacao','Situação');
		$crud->display_as('tipo','Tipo');
		$crud->display_as('ganho_unitario','Ganho %');
		$crud->display_as('ativo','Ativo');

		$crud->field_type('situacao','dropdown', array('a' => 'Ativo', 'd' => 'Desativado'));
		$crud->field_type('tipo','dropdown', array('c' => 'Cliente', 'r' => 'Revendedor', 's' => 'Representante', 'p' => 'Parceiro'));
		$crud->field_type('ativo','dropdown', array('1' => 'True', '0' => 'False'));
		 
		$output = $crud->render();

		$this->_example_output($output);
	}

	public function clientes()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_cliente');
		$crud->set_subject('Cadastro de Cliente');
		$crud->columns('nome','email','endereco','tipo');
		$crud->fields('id_cliente','nome','cpf_cnpj','email','senha','telefone','endereco','numero','bairro',                     
					  'complemento','situacao','tipo','ganho_unitario','ativo');
		
		$crud->display_as('nome','Nome');
		$crud->display_as('email','E-mail');
		$crud->display_as('cpf_cnpj','CPF/CNPJ');
		$crud->display_as('senha','Senha');
		$crud->display_as('telefone','Telefone');
		$crud->display_as('endereco','Endereco');
		$crud->display_as('numero','N°');
		$crud->display_as('bairro','Bairro');
		$crud->display_as('complemento','Complemento');
		$crud->display_as('situacao','Situação');
		$crud->display_as('tipo','Tipo');
		$crud->display_as('ganho_unitario','Ganho %');
		$crud->display_as('ativo','Ativo');

		$crud->field_type('situacao','dropdown', array('a' => 'Ativo', 'd' => 'Desativado'));
		$crud->field_type('tipo','dropdown', array('c' => 'Cliente', 'r' => 'Revendedor', 's' => 'Representante', 'p' => 'Parceiro'));
		$crud->field_type('ativo','dropdown', array('1' => 'True', '0' => 'False'));
		 
		$output = $crud->render();

		$this->_example_output($output);
	}

	public function cidades()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_cidade');
		$crud->set_subject('Cadastro de Cidade');
		$crud->columns('nome','uf','link');
		$crud->fields('id_cidade','nome','uf','link');
		
		$crud->display_as('nome','Nome da Cidade');
		$crud->display_as('uf','UF');
		$crud->display_as('link','Link');

		$crud->field_type('uf','dropdown', array('AC' => 'Acre', 'AL' => 'Alagoas', 'AP' => 'Amapá',
												 'AM' => 'Amazonas', 'BA' => 'Bahia', 'CE' => 'Ceará',
												 'DF' => 'Distrito Federal', 'ES' => 'Espírito Santo',
												 'GO' => 'Goiás', 'MA' => 'Maranhão', 'MT' => 'Mato Grosso',
												 'MS' => 'Mato Grosso do Sul', 'MG' => 'Minas Gerais',
												 'PA' => 'Pará', 'PB' => 'Paraíba', 'PR' => 'Paraná',
												 'PE' => 'Pernambuco', 'PI' => 'Piauí', 'RJ' => 'Rio de Janeiro',
												 'RN' => 'Rio Grande do Norte', 'RS' => 'Rio Grande do Sul',
												 'RO' => 'Rondônia', 'RR' => 'Roraima', 'SC' => 'Santa Catarina',
												 'SP' => 'São Paulo', 'SE' => 'Sergipe', 'TO' => 'Tocantins'));
	 
		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function fornecedores()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_fornecedor');
		$crud->set_subject('Cadastro de Fornecedor');
		$crud->columns('nome','telefone','situacao');
		$crud->fields('id_fornecedor','nome','telefone','situacao');
		
		$crud->display_as('nome','Nome Fornecedor');
		$crud->display_as('telefone','Telefone');
		$crud->display_as('situacao','Situação');
	 
	 	$crud->field_type('situacao','dropdown', array('a' => 'Ativo', 'd' => 'Desativado'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function tipos()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_tipo');
		$crud->set_subject('Cadastro de Tipo');
		$crud->columns('id_tipo','campo','tipo','descricao');
		$crud->fields('campo','tipo','descricao');
		
		$crud->display_as('campo','Nome do Campo');
		$crud->display_as('tipo','Tipo');
		$crud->display_as('descricao','Descrição');
	 	
		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function categorias()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_categoria_produto');
		$crud->set_subject('Cadastro da Categoria do Produto');
		$crud->columns('nome','situacao');
		$crud->fields('id_categoria_produto','nome','situacao');
		
		$crud->display_as('Nome','Nome da Categoria');
		$crud->display_as('situacao','Situação');
	 	
	 	$crud->field_type('situacao','dropdown', array('a' => 'Ativo', 'd' => 'Desativado'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function produtos()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_produto');
		$crud->set_subject('Cadastro de Produto');
		$crud->columns('nome','id_categoria_produto','situacao');
		$crud->fields('id_produto','nome','id_categoria_produto','situacao','imagem');
		
		$crud->display_as('nome','Nome do Produto');
		$crud->display_as('id_categoria_produto','Categoria');
		$crud->display_as('situacao','Situação');
	 	
	 	$crud->field_type('situacao','dropdown', array('a' => 'Ativo', 'd' => 'Desativado'));

	 	$crud->set_relation('id_categoria_produto','tbl_categoria_produto','nome');
	 	
	 	$crud->add_action('Valores', '', 'Dashboard/valores', 'ui-icon-plus');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function valores($id_produto)
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_valor_produto');
		$crud->where('tbl_valor_produto.id_produto', $id_produto);
		$crud->set_subject('Cadastro de Valor do Produto');
		$crud->columns('id_produto','data_atualizacao','preco');
		$crud->fields('id_valor_produto','id_produto','data_atualizacao','preco');
		
		$crud->display_as('id_produto','Nome do Produto');
		$crud->display_as('data_atualizacao','Data Atualização');
		$crud->display_as('preco','Preço');

	 	$crud->set_relation('id_produto','tbl_produto','nome');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function pedidos()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_pedido');
		$crud->where('tbl_pedido.situacao <>', 'e');
		$crud->order_by("data_entrega", "desc");
		$crud->set_subject('Cadastro de Valor do Produto');
		$crud->columns('id_cliente','data_pedido','data_entrega','situacao');
		$crud->fields('id_pedido','id_cliente','id_cidade','data_pedido','valor','valor_total','situacao','forma_pgto','forma_entrega',
					  'taxa_entrega','data_entrega','hora_entrega','end_entrega','num_entrega','bairro_entrega','comp_entrega','data_pagamento');
		
		$crud->display_as('id_cliente','Nome do Cliente');
		$crud->display_as('id_cidade','Cidade');
		$crud->display_as('data_pedido','Data do Pedido');
		$crud->display_as('valor','Valor');
		$crud->display_as('valor_total','Valor Total');
		$crud->display_as('situacao','Situação');
		$crud->display_as('forma_pgto','Forma Pgto');
		$crud->display_as('forma_entrega','Forma Entrega');
		$crud->display_as('taxa_entrega','Taxa de Entrega');
		$crud->display_as('data_entrega','Data da Entrega');
		$crud->display_as('hora_entrega','Hora de Entrega');
		$crud->display_as('end_entrega','Novo Endereço');
		$crud->display_as('num_entrega','N°');
		$crud->display_as('bairro_entrega','Bairro');
		$crud->display_as('comp_entrega','Complemento');
		$crud->display_as('data_pagamento','Data Pagamento');

		$crud->field_type('situacao','dropdown', array('s' => 'Solicitação', 'v' => 'Visualizado', 'p' => 'Produzindo', 't' => 'Saiu p/ entregar', 'e' => 'Entregue'));
		$crud->field_type('forma_pgto','dropdown', array('d' => 'Dinheiro', 'cd' => 'Cartão Débito', 'cc' => 'Cartão Crédito'));
		$crud->field_type('forma_entrega','dropdown', array('r' => 'Retirar', 'e' => 'Entregar'));

	 	$crud->set_relation('id_cliente','tbl_cliente','nome');
	 	$crud->set_relation('id_cidade','tbl_cidade','nome');

	 	$crud->add_action('Itens do Pedido', '', 'Dashboard/itemPedido', 'ui-icon-plus');
	 	$crud->add_action('Cliente Pedido', '', '', 'ui-icon-plus', array($this,'ClientePedido'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function ClientePedido($primary_key , $row)
	{
		return site_url("Dashboard/cliente_unique/$row->id_cliente");
	}

	public function itemPedido($id_pedido)
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_item_pedido');
		$crud->where('tbl_item_pedido.id_pedido', $id_pedido);
		$crud->set_subject('Item Pedido');
		$crud->columns('id_pedido','id_produto','qtde');
		$crud->fields('id_item_pedido','id_pedido','id_produto','qtde', 'valor_unitario');
		
		$crud->display_as('id_pedido','Id do Pedido');
		$crud->display_as('id_produto','Produto');
		$crud->display_as('qtde','Qntde');

		$crud->set_relation('id_produto','tbl_produto','nome');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}
}
