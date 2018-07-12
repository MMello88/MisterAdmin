<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public $data = array();

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('is_loginho') === null)
			redirect('/');
		$this->getStatusPedido(False);
		$this->getMenus();
	}

	public function getMenus(){
		$this->data['menus'] = $this->Generico->getAllMenus();
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
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/pedidos")."'>Voltar ao Pedido</a>";

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
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/pedidos")."'>Voltar ao Pedido</a>";

		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_valor_produto');
		$crud->where('tbl_valor_produto.id_produto', $id_produto);
		$crud->set_subject('Cadastro de Valor do Produto');
		$crud->columns('id_produto','data_atualizacao','preco', 'tipo_cliente');
		$crud->fields('id_valor_produto','id_produto','data_atualizacao','preco', 'tipo_cliente');
		
		$crud->display_as('id_produto','Nome do Produto');
		$crud->display_as('data_atualizacao','Data Atualização');
		$crud->display_as('preco','Preço');

	 	$crud->set_relation('id_produto','tbl_produto','nome');

	 	$crud->field_type('tipo_cliente','dropdown', array('c' => 'Cliente', 'r' => 'Revendedor', 's' => 'Representante', 'p' => 'Parceiro'));

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
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/pedidos")."'>Voltar ao Pedido</a>";

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

	public function lojas(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_loja');
		$crud->set_subject('Loja');
		$crud->columns('id_loja','nome_proprietario','razao_social','nome_fantasia');
		$crud->fields('id_loja','nome_proprietario','cpf','razao_social','nome_fantasia','cnpj','nr_inscricao_muni','cnae','data_nascimento','data_abertura','endereco','numero','complemento','bairro','cep','municipio','uf');
		
		$crud->display_as('nome_proprietario','Nome do Proprietário');
		$crud->display_as('cpf','CPF');
		$crud->display_as('razao_social','Razão Social');
		$crud->display_as('nome_fantasia','Nome Fantasia');
		$crud->display_as('cnpj','CNPJ');
		$crud->display_as('nr_inscricao_muni','Insc. Municipal');
		$crud->display_as('cnae','CNAE');
		$crud->display_as('data_nascimento','Data Nascimento');
		$crud->display_as('data_abertura','Data de Abertura');
		$crud->display_as('endereco','Endereço');
		$crud->display_as('numero','N°');
		$crud->display_as('complemento','Compl.');
		$crud->display_as('bairro','Bairro');
		$crud->display_as('cep','CEP');
		$crud->display_as('municipio','Municipio');
		$crud->display_as('uf','UF');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function arquivo_controller(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_arquivo_controller');
		$crud->set_subject('Arquivo Controller');
		$crud->columns('nome_controller','diretorio');
		$crud->fields('nome_controller','diretorio');
		
		$crud->display_as('arquivo_controller_id','Id Controller');
		$crud->display_as('nome_controller','Nome da Controller');
		$crud->display_as('diretorio','Diretório');

		$crud->required_fields('nome_controller');

	 	$crud->add_action('Funções', '', 'Dashboard/funcoes', 'ui-icon-plus');
	 	$crud->add_action('Gerar Controller', '', 'Dashboard/gerar_controller', 'ui-icon-plus');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function funcoes($arquivo_controller_id){
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/arquivo_controller")."'>Voltar ao Arq. Controller</a>";

		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_function_controller');
		$crud->where('tbl_function_controller.arquivo_controller_id', $arquivo_controller_id);
		$crud->set_subject('Funções da Controller (' . $arquivo_controller_id . ')');
		$crud->columns('nome_function');
		$crud->fields('arquivo_controller_id','nome_function','funcao');
		
		$crud->display_as('arquivo_controller_id','Id Controller');
		$crud->display_as('nome_function','Nome da Function');
		$crud->display_as('funcao','Função');

		$crud->required_fields('nome_function','funcao');

		$crud->field_type('arquivo_controller_id', 'hidden', $arquivo_controller_id);

		$crud->unset_texteditor('funcao');		

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function gerar_controller($arquivo_controller_id)
	{
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/arquivo_controller")."'>Voltar ao Arq. Controller</a>";

		$controller = $this->Generico->getArquivoController($arquivo_controller_id);
		$functions = $this->Generico->getFunctionByIdController($arquivo_controller_id);

		$data = 
			"<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');\nclass $controller->nome_controller extends CI_Controller {\n";
		foreach ($functions as $funcao) {
			$data .= $funcao['funcao']."\n\n";
		}
		$data .= '}';

		if (is_null($controller->diretorio)){
			$dir_controller = FCPATH."/application/controllers/{$controller->nome_controller}.php";
		} else {
			$dir_controller = FCPATH."/application/controllers/{$controller->diretorio}/{$controller->nome_controller}.php";
		}

		if (write_file($dir_controller, $data) == FALSE)
		{
			$this->data['msg_file_create'] = 'Unable to write the file';
		} else {
			$this->data['msg_file_create'] = 'File written!';                           
		}

		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}

	public function menu()
	{
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_menu');
		$crud->set_subject('Cadastro de Menu');
		$crud->columns('nome_menu','menu_titulo', 'order', 'ativo');
		$crud->fields('nome_menu','menu_titulo','tag_i', 'order', 'ativo');
		
		$crud->display_as('menu_id','Id Menu');
		$crud->display_as('nome_menu','Nome do Menu');
		$crud->display_as('menu_titulo','Titulo');
		$crud->display_as('tag_i','Tag Img');
		$crud->display_as('order','N° Ordenação');
		$crud->display_as('ativo','Ativo');

		$crud->field_type('ativo','dropdown', array('a' => 'Ativado', 'd' => 'Desativado'));
		$crud->required_fields('nome_menu');

	 	$crud->add_action('Sub Menu', '', 'Dashboard/submenu', 'ui-icon-plus');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function submenu($menu_id)
	{
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/menu")."'>Voltar ao Menu</a>";

		$crud = new grocery_CRUD();
		$crud->set_table('tbl_submenu');
		$crud->where('tbl_submenu.menu_id', $menu_id);
		$crud->set_subject('Cadastro do Sub Menu');
		$crud->columns('menu_id','nome_submenu','arquivo_controller_id', 'function_controller_id','order', 'ativo');
		$crud->fields('menu_id','nome_submenu','arquivo_controller_id', 'function_controller_id','order', 'ativo');
		
		$crud->display_as('submenu_id','Id Sub Menu');
		$crud->display_as('menu_id','Menu');
		$crud->display_as('nome_submenu','Nome Sub Menu');
		$crud->display_as('arquivo_controller_id','Nome Controller');
		$crud->display_as('function_controller_id','Nome Function');
		$crud->display_as('order','N° Ordenação');
		$crud->display_as('ativo','Ativo');

		
		$crud->set_relation('arquivo_controller_id', 'tbl_arquivo_controller', 'nome');
		$crud->set_relation('function_controller_id', 'tbl_function_controller', 'nome');

		$crud->field_type('ativo','dropdown', array('a' => 'Ativado', 'd' => 'Desativado'));
		$crud->field_type('menu_id', 'hidden', $menu_id);

		$crud->required_fields('nome_submenu','arquivo_controller_id','function_controller_id');

		$this->load->library('gc_dependent_select');

		$fields = array(
			// first field:
			'arquivo_controller_id' => array( // first dropdown name
			'table_name' => 'tbl_arquivo_controller', // table of country
			'title' => 'nome', // country title
			'relate' => null // the first dropdown hasn't a relation
			),
			// second field
			'function_controller_id' => array( // second dropdown name
			'table_name' => 'tbl_function_controller', // table of state
			'title' => 'nome', // state title
			'id_field' => 'function_controller_id', // table of state: primary key
			'relate' => 'arquivo_controller_id', // table of state:
			'data-placeholder' => 'selecionar function' //dropdown's data-placeholder:
			)
		);

		$config = array(
			'main_table' => 'tbl_submenu',
			'main_table_primary' => 'submenu_id',
			"url" => base_url() . 'index.php/' . __CLASS__ . '/', //	.$id.'/add' //path to method
			'ajax_loader' => base_url() . 'ajax-loader.gif', // path to ajax-loader image. It's an optional parameter
			'segment_name' =>'get_functionByIdController' // It's an optional parameter. by default "get_items"
		);

		$mult = new gc_dependent_select($crud, $fields, $config);

		// the second method:
		$js = $mult->get_js();

		$output = $crud->render();

		$output->output.= $js;
		 
		$this->_example_output($output);
	}

	public function get_functionByIdController($id){
		$functions = $this->Generico->getFunctionByIdController($id);
		
		$arr = array();
		foreach ($functions as $item) {
			array_push($arr, array('value' => $item['function_controller_id'], 'property' => $item['nome']));
		}
		
		echo json_encode($arr);
	}

	public function estoque(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_estoque');
		$crud->set_subject('Consulta de Estoque');
		$crud->columns('id_loja','id_produto', 'qtde_minima', 'qtde_movimento');
		$crud->fields('id_loja','id_produto', 'qtde_minima', 'qtde_movimento');
		
		$crud->display_as('id_loja','Loja');
		$crud->display_as('id_produto','Produto');
		$crud->display_as('qtde_minima','Qtde Estoque Minimo');
		$crud->display_as('qtde_movimento','Qtde do Movimento');
		$crud->display_as('qtde_total','Qtde Disponível');

		$crud->set_relation('id_loja', 'tbl_loja', 'nome_fantasia');
		$crud->set_relation('id_produto', 'tbl_produto', 'nome');

		//$crud->field_type('movimentacao','dropdown', array('e' => 'Entrada', 's' => 'Saída'));
		$crud->unset_add();
		$crud->unset_edit();
		$crud->unset_delete();
		$crud->required_fields('id_loja','id_produto', 'movimentacao', 'qtde_minima', 'qtde_movimento');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function movimentacao_estoque(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_movimentacao_estoque');
		$crud->set_subject('Movimentação de Estoque');
		$crud->columns('id_loja','id_produto', 'tipo_movimentacao', 'qtde_movimentacao', 'data_movimentacao');
		$crud->fields('id_loja','id_produto', 'tipo_movimentacao', 'qtde_movimentacao', 'data_movimentacao');
		
		$crud->display_as('id_loja','Loja');
		$crud->display_as('id_produto','Produto');
		$crud->display_as('tipo_movimentacao','Movimentação de');
		$crud->display_as('qtde_movimentacao','Qtde Movimentação');
		$crud->display_as('data_movimentacao','Data Movimentação');

		$crud->set_relation('id_loja', 'tbl_loja', 'nome_fantasia');
		$crud->set_relation('id_produto', 'tbl_produto', 'nome');

		$crud->field_type('tipo_movimentacao','dropdown', array('e' => 'Entrada', 's' => 'Saída', 'a' => 'Ajuste'));
		$crud->field_type('data_movimentacao','hidden', date("Y-m-d H:i:s"));
		$crud->required_fields('id_loja','id_produto', 'tipo_movimentacao', 'qtde_movimentacao');

		$crud->unset_delete();
		$crud->unset_edit();

		$crud->callback_after_insert(array($this, 'after_insert_update_mov_estoque'));
		$crud->callback_after_update(array($this, 'after_insert_update_mov_estoque'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function after_insert_update_mov_estoque($post_array,$primary_key){
		$this->Generico->geraEstoque();
	}
}
