<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MyDashboard extends CI_Controller {
	public $data = array();

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('is_loginho') === null)
			redirect('/');
		$this->data['__CLASS__'] = __CLASS__;
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
		$this->data['estoques'] = $this->Generico->getEstoque();
		$this->data['afazeres'] = $this->Generico->getAFazer();
		$this->data['PedidosSolicitados'] = $this->Generico->getPedidoSolicitados();
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
		$crud->columns('nome', 'apelido', 'whatsapp', 'email','site');
		$crud->fields('nome','apelido','telefone','celular','whatsapp','email','site','observacao',
				 	  'tipo_pessoa','cpf_cnpj','rg','inscr_municipal','inscr_estadual','tipo_ie','cep',
					  'endereco','numero','bairro','complemento','banco','agencia','digito_ag','conta_corrente','digito_cc');
		
		$crud->display_as('id_fornecedor','Id Fornecedor');
		$crud->display_as('nome','Nome');
		$crud->display_as('apelido','Apelido/ Razão Social'); 
		$crud->display_as('whatsapp','Whatsapp');
		$crud->display_as('celular','Celular');	
		$crud->display_as('telefone','Telefone');
		$crud->display_as('email','E-mail');
		$crud->display_as('site','Site');
		$crud->display_as('tipo_pessoa','Fisíca/Juridica');
		$crud->display_as('cpf_cnpj','CPF / CNPJ');
		$crud->display_as('rg','RG');
		$crud->display_as('inscr_municipal','Inscrição Municipal');
		$crud->display_as('inscr_estadual','Inscrição Estadual');
		$crud->display_as('tipo_ie','Indicador IE');
		$crud->display_as('cep','CEP');
		$crud->display_as('endereco','Endereço');
		$crud->display_as('numero','Nr.');
		$crud->display_as('bairro','Bairro');
		$crud->display_as('complemento','Complemento');
		$crud->display_as('banco','Banco');
		$crud->display_as('agencia','Agência');
		$crud->display_as('digito_ag','Digito');
		$crud->display_as('conta_corrente','Conta Corrente');
		$crud->display_as('digito_cc','Digito');

		$crud->display_as('observacao','Descrição');

		$crud->set_relation('banco','tbl_tipo','descricao', array('campo' => 'banco'));
		$crud->set_relation('tipo_ie','tbl_tipo','descricao', array('campo' => 'tipo_ie'));

		$crud->unset_texteditor('observacao');


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
		$crud->columns('nome','situacao');
		$crud->fields('id_produto','nome','situacao','imagem');
		
		$crud->display_as('nome','Nome do Produto');
		$crud->display_as('situacao','Situação');
	 	
	 	$crud->field_type('situacao','dropdown', array('a' => 'Ativo', 'd' => 'Desativado'));
	 	
	 	$crud->add_action('Valores', '', __CLASS__.'/valores', 'ui-icon-plus');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function valores($id_produto)
	{
		$this->data['navigation_back'] = "<a href='".base_url(__CLASS__."/produtos")."'>Voltar ao Produto</a>";

		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_valor_produto');
		$crud->where('tbl_valor_produto.id_produto', $id_produto);
		$crud->set_subject('Cadastro de Valor do Produto');
		$crud->columns('id_produto','id_categoria_produto', 'data_atualizacao','preco', 'tipo_cliente');
		$crud->fields('id_valor_produto','id_produto','id_categoria_produto', 'data_atualizacao','preco', 'tipo_cliente');
		
		$crud->display_as('id_produto','Nome do Produto');
		$crud->display_as('id_categoria_produto','Categoria');
		$crud->display_as('data_atualizacao','Data Atualização');
		$crud->display_as('preco','Preço');

	 	$crud->set_relation('id_produto','tbl_produto','nome');
	 	$crud->set_relation('id_categoria_produto','tbl_categoria_produto','nome', array('situacao' => 'a'));

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

		$crud->field_type('situacao','dropdown', array('s' => 'Solicitação', 'v' => 'Visualizado', 'p' => 'Produzindo', 't' => 'Saiu p/ entregar', 'e' => 'Entregue', 'c' => 'Cancelado'));
		$crud->field_type('forma_pgto','dropdown', array('d' => 'Dinheiro', 'cd' => 'Cartão Débito', 'cc' => 'Cartão Crédito'));
		$crud->field_type('forma_entrega','dropdown', array('r' => 'Retirar', 'e' => 'Entregar'));

	 	$crud->set_relation('id_cliente','tbl_cliente','nome');
	 	$crud->set_relation('id_cidade','tbl_cidade','nome');

	 	$crud->add_action('Itens do Pedido', '', __CLASS__.'/itemPedido', 'ui-icon-plus');
	 	$crud->add_action('Cliente Pedido', '', '', 'ui-icon-plus', array($this,'ClientePedido'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function ClientePedido($primary_key , $row)
	{
		return site_url(__CLASS__."/cliente_unique/$row->id_cliente");
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

	 	$crud->add_action('Funções', '', __CLASS__.'/funcoes', 'ui-icon-plus');
	 	$crud->add_action('Gerar Controller', '', __CLASS__.'/gerar_controller', 'ui-icon-plus');

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

		$crud->order_by('order','asc');

		$crud->required_fields('nome_menu');

	 	$crud->add_action('Sub Menu', '', __CLASS__.'/submenu', 'ui-icon-plus');

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

		
		$crud->set_relation('arquivo_controller_id', 'tbl_arquivo_controller', 'nome_controller');
		$crud->set_relation('function_controller_id', 'tbl_function_controller', 'nome_function');

		$crud->field_type('ativo','dropdown', array('a' => 'Ativado', 'd' => 'Desativado'));
		$crud->field_type('menu_id', 'hidden', $menu_id);

		$crud->required_fields('nome_submenu','arquivo_controller_id','function_controller_id');

		$this->load->library('gc_dependent_select');

		$fields = array(
			// first field:
			'arquivo_controller_id' => array( // first dropdown name
			'table_name' => 'tbl_arquivo_controller', // table of country
			'title' => 'nome_controller', // country title
			'relate' => null // the first dropdown hasn't a relation
			),
			// second field
			'function_controller_id' => array( // second dropdown name
			'table_name' => 'tbl_function_controller', // table of state
			'title' => 'nome_function', // state title
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
			array_push($arr, array('value' => $item['function_controller_id'], 'property' => $item['nome_function']));
		}
		
		echo json_encode($arr);
	}

	public function estoque(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_estoque');
		$crud->set_subject('Consulta de Estoque');
		$crud->columns('id_loja','id_produto', 'qtde_minima', 'qtde_total');
		$crud->edit_fields('qtde_minima');
		
		$crud->display_as('id_loja','Loja');
		$crud->display_as('id_produto','Produto');
		$crud->display_as('qtde_minima','Qtde Estoque Minimo');
		$crud->display_as('qtde_total','Qtde Disponível');

		$crud->set_relation('id_loja', 'tbl_loja', 'nome_fantasia');
		$crud->set_relation('id_produto', 'tbl_produto', 'nome');

		$crud->field_type('tipo_movimentacao','dropdown', array('e' => 'Entrada', 's' => 'Saída', 'a' => 'Ajuste', 't' => 'Transferência'));

		$crud->unset_add();
		$crud->unset_delete();

		$crud->required_fields('id_loja','id_produto', 'movimentacao', 'qtde_minima', 'qtde_movimento');

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	public function movimentacao_estoque(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_movimentacao_estoque');
		$crud->set_subject('Movimentação de Estoque');
		$crud->columns('id_loja', 'id_produto', 'tipo_movimentacao', 'qtde_movimentacao', 'data_movimentacao', 'id_item_pedido');
		$crud->fields('id_loja', 'id_produto', 'tipo_movimentacao', 'qtde_movimentacao', 'data_movimentacao');
		
		$crud->display_as('id_loja','Loja');
		$crud->display_as('id_produto','Produto');
		$crud->display_as('tipo_movimentacao','Movimentação de');
		$crud->display_as('qtde_movimentacao','Qtde Movimentação');
		$crud->display_as('data_movimentacao','Data Movimentação');
		$crud->display_as('id_item_pedido','Id Item Pedido');

		$crud->set_relation('id_loja', 'tbl_loja', 'nome_fantasia');
		$crud->set_relation('id_produto', 'tbl_produto', 'nome');

		$crud->field_type('tipo_movimentacao','dropdown', array('e' => 'Entrada', 's' => 'Saída', 'a' => 'Ajuste', 't' => 'Transferência', 'c' => 'Cancelado'));
		$crud->field_type('data_movimentacao','hidden', date("Y-m-d H:i:s"));
		
		$crud->required_fields('id_loja', 'id_produto', 'tipo_movimentacao', 'qtde_movimentacao');

		$crud->unset_delete();
		$crud->unset_edit();

		$crud->callback_after_insert(array($this, 'after_insert_update_mov_estoque'));
		$crud->callback_after_update(array($this, 'after_insert_update_mov_estoque'));

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function after_insert_update_mov_estoque($post_array,$primary_key){
		$this->Generico->geraEstoque($post_array['id_loja'], $post_array['id_produto'], $post_array['tipo_movimentacao'], $post_array['qtde_movimentacao']);
		$this->Generico->geraFichaKardex($post_array['id_loja'], $post_array['id_produto'], $post_array['tipo_movimentacao'], 'me', $post_array['qtde_movimentacao']);
	}

	public function ficha_kardex(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_ficha_kardex');
		$crud->set_subject('Ficha Kardex');
		$crud->columns('id_ficha_kerdex', 'id_loja', 'id_produto', 'tipo_movimentacao', 'origem_movimentacao', 'qtde_movimentacao', 'data_movimentacao');
		$crud->fields('id_ficha_kerdex','id_loja', 'id_produto', 'tipo_movimentacao', 'origem_movimentacao', 'qtde_movimentacao', 'data_movimentacao');
		
		$crud->display_as('id_loja','Loja');
		$crud->display_as('id_produto','Produto');
		$crud->display_as('origem_movimentacao','Origem da Movimentação');
		$crud->display_as('tipo_movimentacao','Movimentação de');
		$crud->display_as('qtde_movimentacao','Qtde Movimentação');
		$crud->display_as('data_movimentacao','Data Movimentação');

		$crud->set_relation('id_loja', 'tbl_loja', 'nome_fantasia');
		$crud->set_relation('id_produto', 'tbl_produto', 'nome');

		$crud->field_type('tipo_movimentacao','dropdown', array('e' => 'Entrada', 's' => 'Saída', 'a' => 'Ajuste', 't' => 'Transferência', 'c' => 'Cancelado'));
		$crud->field_type('origem_movimentacao','dropdown', array('me' => 'Movimentação Estoque', 'nfs' => 'Nf Saída', 'nfe' => 'Nf Entrada', 'ps' => 'Pedido no Site'));

		$crud->unset_delete();
		$crud->unset_edit();
		$crud->unset_add();

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function postMoviEstoque(){
		if($_POST){
			$this->Generico->gerarMovimentacao($_POST['id_loja'], $_POST['id_produto'], $_POST['tipo_movimentacao'], $_POST['qtde_movimentacao']);
			redirect(__CLASS__.'/index');
		}
	}

	public function afazer(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_afazer');
		$crud->set_subject('A Fazer');
		$crud->columns('id_afazer', 'afazer', 'dt_inicio', 'dt_fim', 'realizado');
		$crud->fields('afazer', 'dt_inicio', 'dt_fim', 'realizado');
		
		$crud->display_as('id_afazer','Id A Fazer');
		$crud->display_as('afazer','A Fazer');
		$crud->display_as('dt_inicio','Data Inicio');
		$crud->display_as('dt_fim','Data Fim');
		$crud->display_as('realizado','Realizado');

		$crud->field_type('realizado','dropdown', array('s' => 'Sim', 'n' => 'Não'));

		$crud->required_fields('afazer', 'dt_inicio', 'realizado');

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function postAFazer(){
		if($_POST){
			$this->Generico->AFazerRealizado($_POST['id_afazer'], $_POST['realizado']);
			redirect(__CLASS__.'/index');
		}
	}

	public function postPedidoEntregue(){
		if($_POST){
			$this->Generico->AlterarSituacaoPedido($_POST['id_pedido'], 'e');
			redirect(__CLASS__.'/index');
		}
	}

	public function postCancelarPedido(){
		if($_POST){
			$pedido = $this->Generico->getPedidoSolicitados($_POST['id_pedido']);
			foreach ($pedido[0]['itens'] as $items) {
				$this->Generico->gerarMovimentacao($pedido[0]['id_cidade'], $items['id_produto'], 'c', $items['qtde'], $items['id_item_pedido']);
				$this->Generico->AlterarSituacaoPedido($_POST['id_pedido'], 'c');
			}
			redirect(__CLASS__.'/index');
		}
	}

	public function ContasAPagar(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_contas_apagar');
		$crud->where('situacao', 'a');
		$crud->set_subject('Cadastrar Contas A Pagar');
		$crud->columns('id_contas_apagar', 'id_fornecedor', 'id_conta_gerencial', 'dt_venc', 'valor_apagar');
		$crud->fields('id_conta_gerencial','dt_cadastro', 'id_fornecedor', 'dt_venc', 'valor_apagar', 'conta_fixa', 'nr_vezes', 'obs', 'situacao');
		
		$crud->display_as('id_conta_gerencial','Conta Gerencial');
		$crud->display_as('id_fornecedor','Fornecedor');
		$crud->display_as('dt_venc','Data Vencimento');
		$crud->display_as('valor_apagar','Valor A Pagar');
		$crud->display_as('conta_fixa','Conta Fixa');
		$crud->display_as('nr_vezes','Nr. Vezes');
		$crud->display_as('obs','Observação');

		$crud->field_type('dt_cadastro','hidden', date("Y-m-d H:i:s"));
		$crud->field_type('situacao','hidden', 'a');
		$crud->field_type('conta_fixa','dropdown', array('s' => 'Sim', 'n' => 'Não'));
		$crud->field_type('nr_vezes','dropdown', 
			array('1' => '1x', '2' => '2x', '3' => '3x', '4' => '4x', '5' => '5x', '6' => '6x', '7' => '7x', '8' => '8x',
			'9' => '9x'  , '10' => '10x', '11' => '11x', '12' => '12x', '13' => '13x', '14' => '14x', '15' => '15x', '16' => '16x',
			'17' => '17x', '18' => '18x', '19' => '19x', '20' => '20x', '21' => '21x', '22' => '22x', '23' => '23x', '24' => '24x',
			'25' => '25x', '26' => '26x', '27' => '27x', '28' => '28x', '29' => '29x', '30' => '30x', '31' => '31x', '32' => '32x',
			'33' => '33x', '34' => '34x', '35' => '35x', '36' => '36x'));

		$crud->required_fields('id_conta_gerencial', 'dt_venc', 'valor_apagar', 'conta_fixa');

		$crud->set_relation('id_conta_gerencial','tbl_conta_gerencial','nome_conta_gerencial');
		$crud->set_relation('id_fornecedor','tbl_fornecedor','apelido');

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function PagarAConta(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_contas_apagar');
		$crud->where('situacao', 'a');
		$crud->set_subject('Pagar A Contas');
		$crud->columns('id_fornecedor', 'id_conta_gerencial', 'dt_venc', 'valor_apagar');
		$crud->fields('id_contas_apagar', 'tipo_pagamento', 'dt_venc', 'dt_pago', 'id_conta_corrente', 'valor_apagar', 
			'valor_pgto', 'valor_desconto', 'valor_juros', 'conta_fixa', 'nr_vezes', 'situacao', 'id_fornecedor', 'id_conta_gerencial');
		
		$crud->display_as('id_conta_gerencial','Conta Gerencial');
		$crud->display_as('id_fornecedor','Fornecedor');
		$crud->display_as('dt_venc','Data Vencimento');
		$crud->display_as('valor_apagar','Valor A Pagar');
		$crud->display_as('conta_fixa','Conta Fixa');
		$crud->display_as('nr_vezes','Nr. Parcela');
		$crud->display_as('obs','Observação');

		$crud->display_as('dt_pago','Data Pagamento'); 
		$crud->display_as('id_conta_corrente','Conta corrente');
		$crud->display_as('valor_pgto','Valor Pago');
		$crud->display_as('valor_desconto','Valor Desconto');
		$crud->display_as('valor_juros','Valor Juros');
		$crud->display_as('tipo_pagamento','Tipo Pagamento');

		$crud->set_relation('id_conta_gerencial','tbl_conta_gerencial','nome_conta_gerencial');
		$crud->set_relation('id_conta_corrente','tbl_conta_corrente','nome_conta_corrente');
		$crud->set_relation('tipo_pagamento','tbl_tipo','descricao', array('campo' => 'tipo_pagamento'));
		$crud->set_relation('id_fornecedor','tbl_fornecedor','apelido');

		$crud->field_type('conta_fixa','hidden');
		$crud->field_type('nr_vezes','readonly');
		$crud->field_type('situacao','hidden', 'p');
		$crud->field_type('id_contas_apagar','hidden');
		$crud->field_type('id_fornecedor','readonly');
		$crud->field_type('id_conta_gerencial','readonly');
		$crud->field_type('dt_venc','readonly');
		$crud->field_type('valor_apagar','readonly');

		$crud->required_fields('tipo_pagamento', 'dt_pago', 'valor_pgto', 'id_conta_corrente');


		$crud->unset_add();
		$crud->unset_delete();

		$crud->callback_after_update(array($this, 'after_update_contas_apagar'));

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function after_update_contas_apagar($post_array,$primary_key){
		if ($post_array['conta_fixa'] == 's')
			$this->Generico->geraProximaContaAPagarFixa($primary_key);
		else 
			$this->Generico->geraProximaContaAPagarFixa($primary_key, TRUE);		
	}

	public function ContasPagas(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_contas_apagar');
		$crud->where('situacao', 'p');
		$crud->order_by('dt_pago', 'desc');
		$crud->set_subject('Pagar A Contas');
		$crud->columns('id_fornecedor', 'id_conta_gerencial', 'dt_venc', 'valor_apagar', 'tipo_pagamento', 'dt_pago', 'valor_apagar');
		$crud->fields('id_contas_apagar', 'tipo_pagamento', 'dt_venc', 'dt_pago', 'id_conta_corrente', 'valor_apagar', 
			'valor_pgto', 'valor_desconto', 'valor_juros', 'conta_fixa', 'nr_vezes', 'situacao', 'id_fornecedor', 'id_conta_gerencial');
		
		$crud->display_as('id_conta_gerencial','Conta Gerencial');
		$crud->display_as('id_fornecedor','Fornecedor');
		$crud->display_as('dt_venc','Data Vencimento');
		$crud->display_as('valor_apagar','Valor A Pagar');
		$crud->display_as('conta_fixa','Conta Fixa');
		$crud->display_as('nr_vezes','Nr. Parcela');
		$crud->display_as('obs','Observação');

		$crud->display_as('dt_pago','Data Pagamento');
		$crud->display_as('id_conta_corrente','Conta Corrente');
		$crud->display_as('valor_pgto','Valor Pago');
		$crud->display_as('valor_desconto','Valor Desconto');
		$crud->display_as('valor_juros','Valor Juros');
		$crud->display_as('tipo_pagamento','Tipo Pagamento');
		$crud->display_as('situacao','Situação');

		$crud->field_type('nr_vezes','readonly');
		$crud->field_type('conta_fixa','dropdown', array('s' => 'Sim', 'n' => 'Não'));
		$crud->field_type('situacao','dropdown', array('a' => 'Aberto', 'p' => 'Pago'));

		$crud->set_relation('id_conta_gerencial','tbl_conta_gerencial','nome_conta_gerencial');
		$crud->set_relation('id_conta_corrente','tbl_conta_corrente','nome_conta_corrente');
		$crud->set_relation('tipo_pagamento','tbl_tipo','descricao', array('campo' => 'tipo_pagamento'));
		$crud->set_relation('id_fornecedor','tbl_fornecedor','apelido');
		
		$crud->unset_add();
		$crud->unset_edit();
		$crud->unset_delete();

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function conta_gerencial(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_conta_gerencial');
		$crud->set_subject('Contas Gerenciais');
		$crud->columns('nome_conta_gerencial', 'tipo_conta', 'id_conta_dre');
		$crud->fields('nome_conta_gerencial', 'tipo_conta', 'id_conta_dre',
					  'cc_debito', 'cc_credito', 'permite_compras', 'ativo');
		
		$crud->display_as('id_contas_apagar','Id Conta Gerencial');
		$crud->display_as('nome_conta_gerencial','Nome');
		$crud->display_as('tipo_conta','Tipo');
		$crud->display_as('id_conta_dre','Conta DRE');
		$crud->display_as('cc_debito','Conta Débito');
		$crud->display_as('cc_credito','Conta Crédito');
		$crud->display_as('permite_compras','Permite Compra');
		$crud->display_as('ativo','Ativo');

		$crud->required_fields('nome_conta_gerencial', 'tipo_conta', 'permite_compras', 'ativo');

		$crud->field_type('tipo_conta','dropdown', array('e' => 'Entrada', 's' => 'Saída'));
		$crud->field_type('permite_compras','dropdown', array('S' => 'Sim', 'n' => 'Não'));
		$crud->field_type('ativo','dropdown', array('a' => 'Ativo', 'n' => 'Desativado'));

		$crud->set_relation('id_conta_dre','tbl_tipo','descricao', array('campo' => 'id_conta_dre'));

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function conta_corrente(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_conta_corrente');
		$crud->set_subject('Contas Corrente');
		$crud->columns('nome_conta_corrente', 'interna', 'banco', 'principal');
		$crud->fields('nome_conta_corrente', 'interna', 'banco', 'agencia', 'digito_ag', 
			'conta_corrente', 'digito_cc', 'principal', 'ativo');
		
		$crud->display_as('id_conta_corrente','Id Conta Corrente');
		$crud->display_as('nome_conta_corrente','Nome');
		$crud->display_as('interna','Interna');
		$crud->display_as('banco','Banco');
		$crud->display_as('agencia','Nr. Agência');
		$crud->display_as('digito_ag','Digito Ag');
		$crud->display_as('conta_corrente','Nr. Conta Corrente');
		$crud->display_as('digito_cc','Digíto Cc');
		$crud->display_as('principal','Principal');
		$crud->display_as('ativo','Ativo');

		$crud->required_fields('nome_conta_corrente', 'interna');

		$crud->field_type('interna','dropdown', array('S' => 'Sim', 'n' => 'Não'));
		$crud->field_type('ativo','dropdown', array('a' => 'Ativo', 'n' => 'Desativado'));
		$crud->field_type('principal','dropdown', array('s' => 'Sim', 'n' => 'Não'));
		
		$crud->set_relation('banco','tbl_tipo','descricao', array('campo' => 'banco'));

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function ContasAReceber(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_contas_areceber');
		$crud->where('situacao', 'a');
		$crud->set_subject('Cadastrar Contas A Receber');
		$crud->columns('id_contas_areceber', 'id_fornecedor', 'id_conta_gerencial', 'dt_venc', 'valor_areceber');
		$crud->fields('id_conta_gerencial','dt_cadastro', 'id_fornecedor', 'dt_venc', 'valor_areceber', 'conta_fixa', 'nr_vezes', 'obs', 'situacao');
		
		$crud->display_as('id_conta_gerencial','Conta Gerencial');
		$crud->display_as('id_fornecedor','Fornecedor');
		$crud->display_as('dt_venc','Data Vencimento');
		$crud->display_as('valor_areceber','Valor A Receber');
		$crud->display_as('conta_fixa','Conta Fixa');
		$crud->display_as('nr_vezes','Nr. Vezes');
		$crud->display_as('obs','Observação');

		$crud->field_type('dt_cadastro','hidden', date("Y-m-d H:i:s"));
		$crud->field_type('situacao','hidden', 'a');
		$crud->field_type('conta_fixa','dropdown', array('s' => 'Sim', 'n' => 'Não'));
		$crud->field_type('nr_vezes','dropdown', 
			array('1' => '1x', '2' => '2x', '3' => '3x', '4' => '4x', '5' => '5x', '6' => '6x', '7' => '7x', '8' => '8x',
			'9' => '9x'  , '10' => '10x', '11' => '11x', '12' => '12x', '13' => '13x', '14' => '14x', '15' => '15x', '16' => '16x',
			'17' => '17x', '18' => '18x', '19' => '19x', '20' => '20x', '21' => '21x', '22' => '22x', '23' => '23x', '24' => '24x',
			'25' => '25x', '26' => '26x', '27' => '27x', '28' => '28x', '29' => '29x', '30' => '30x', '31' => '31x', '32' => '32x',
			'33' => '33x', '34' => '34x', '35' => '35x', '36' => '36x'));

		$crud->required_fields('id_conta_gerencial', 'dt_venc', 'valor_areceber', 'conta_fixa');

		$crud->set_relation('id_conta_gerencial','tbl_conta_gerencial','nome_conta_gerencial');
		$crud->set_relation('id_fornecedor','tbl_fornecedor','apelido');

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function ReceberAConta(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_contas_areceber');
		$crud->where('situacao', 'a');
		$crud->set_subject('Receber A Contas');
		$crud->columns('id_fornecedor', 'id_conta_gerencial', 'dt_venc', 'valor_areceber');
		$crud->fields('id_contas_areceber', 'tipo_recebimento', 'dt_venc', 'dt_recebido', 'id_conta_corrente', 
			'valor_areceber', 'valor_recebido', 'valor_desconto', 'valor_juros', 'conta_fixa', 'nr_vezes', 'situacao', 
			'id_fornecedor', 'id_conta_gerencial');
		
		$crud->display_as('id_conta_gerencial','Conta Gerencial');
		$crud->display_as('id_fornecedor','Fornecedor');
		$crud->display_as('dt_venc','Data Vencimento');
		$crud->display_as('valor_areceber','Valor A Receber');
		$crud->display_as('conta_fixa','Conta Fixa');
		$crud->display_as('nr_vezes','Nr. Parcela');
		$crud->display_as('obs','Observação');

		$crud->display_as('dt_recebido','Data Recebimento'); 
		$crud->display_as('id_conta_corrente','Conta corrente');
		$crud->display_as('valor_recebido','Valor Recebido');
		$crud->display_as('valor_desconto','Valor Desconto');
		$crud->display_as('valor_juros','Valor Juros');
		$crud->display_as('tipo_recebimento','Tipo Recebimento');

		$crud->set_relation('id_conta_gerencial','tbl_conta_gerencial','nome_conta_gerencial');
		$crud->set_relation('id_conta_corrente','tbl_conta_corrente','nome_conta_corrente');
		$crud->set_relation('tipo_recebimento','tbl_tipo','descricao', array('campo' => 'tipo_pagamento'));
		$crud->set_relation('id_fornecedor','tbl_fornecedor','apelido');

		$crud->field_type('conta_fixa','hidden');
		$crud->field_type('nr_vezes','readonly');
		$crud->field_type('situacao','hidden', 'r');
		$crud->field_type('id_contas_areceber','hidden');
		$crud->field_type('id_fornecedor','readonly');
		$crud->field_type('id_conta_gerencial','readonly');
		$crud->field_type('dt_venc','readonly');
		$crud->field_type('valor_areceber','readonly');

		$crud->required_fields('tipo_recebimento', 'dt_recebido', 'valor_recebido', 'id_conta_corrente');


		$crud->unset_add();
		$crud->unset_delete();

		$crud->callback_after_update(array($this, 'after_update_contas_areceber'));

		$output = $crud->render();
 
		$this->_example_output($output);
	}

	public function after_update_contas_areceber($post_array,$primary_key){
		if ($post_array['conta_fixa'] == 's')
			$this->Generico->geraProximaContaAReceberFixa($primary_key);
		else 
			$this->Generico->geraProximaContaAReceberFixa($primary_key, TRUE);
	}

	public function ContasRecebidas(){
		$crud = new grocery_CRUD();
 
		$crud->set_table('tbl_contas_areceber');
		$crud->where('situacao', 'r');
		$crud->order_by('dt_recebido', 'desc');
		$crud->set_subject('Contas Recebidas');
		$crud->columns('id_fornecedor', 'id_conta_gerencial', 'dt_venc', 'valor_areceber', 'tipo_recebimento', 'dt_recebido', 'valor_recebido');
		$crud->fields('id_contas_apagar', 'tipo_recebimento', 'dt_venc', 'dt_recebido', 'id_conta_corrente', 'valor_apagar', 
			'valor_pgto', 'valor_desconto', 'valor_juros', 'conta_fixa', 'nr_vezes', 'situacao', 'id_fornecedor', 'id_conta_gerencial');
		
		$crud->display_as('id_conta_gerencial','Conta Gerencial');
		$crud->display_as('id_fornecedor','Fornecedor');
		$crud->display_as('dt_venc','Data Vencimento');
		$crud->display_as('valor_apagar','Valor A Receber');
		$crud->display_as('conta_fixa','Conta Fixa');
		$crud->display_as('nr_vezes','Nr. Parcela');
		$crud->display_as('obs','Observação');

		$crud->display_as('dt_recebido','Data Recebimento');
		$crud->display_as('id_conta_corrente','Conta Corrente');
		$crud->display_as('valor_pgto','Valor Pago');
		$crud->display_as('valor_desconto','Valor Desconto');
		$crud->display_as('valor_juros','Valor Juros');
		$crud->display_as('tipo_recebimento','Tipo Recebimento');
		$crud->display_as('situacao','Situação');

		$crud->field_type('nr_vezes','readonly');
		$crud->field_type('conta_fixa','dropdown', array('s' => 'Sim', 'n' => 'Não'));
		$crud->field_type('situacao','dropdown', array('a' => 'Aberto', 'r' => 'Recebido'));

		$crud->set_relation('id_conta_gerencial','tbl_conta_gerencial','nome_conta_gerencial');
		$crud->set_relation('id_conta_corrente','tbl_conta_corrente','nome_conta_corrente');
		$crud->set_relation('tipo_recebimento','tbl_tipo','descricao', array('campo' => 'tipo_pagamento'));
		$crud->set_relation('id_fornecedor','tbl_fornecedor','apelido');
		
		$crud->unset_add();
		$crud->unset_edit();
		$crud->unset_delete();

		$output = $crud->render();
 
		$this->_example_output($output);
	}

}