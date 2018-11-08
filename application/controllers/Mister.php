<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(TRUE);
	}

	public function Clientes_old($idCliente = ''){
		$this->set_config = 
			[
				'table' => 
					['nome'     => 'tbl_cliente', 
					 'chave_pk' => 'id_cliente',
					 'display'  => 'Clientes'],
				'columns' => 
					[
					  'id_cliente' => 
						['display_column' => 'Id', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'nome' =>
					  	['display_column' => 'Nome', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'email' =>
					  	['display_column' => 'E-mail', 
						 'input' => ['type' => 'email', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'cpf_cnpj' =>
					  	['display_column' => 'CPF ou CNPJ', 
						 'input' => ['type' => 'text', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'senha' =>
					  	['display_column' => 'Senha', 
						 'input' => ['type' => 'password', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'false'],
					  'telefone' =>
					  	['display_column' => 'Telefone', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'endereco' =>
					  	['display_column' => 'Endereço', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'numero' =>
					  	['display_column' => 'Numero', 
						 'input' => ['type' => 'number', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'bairro' =>
					  	['display_column' => 'Bairro', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'complemento' =>
					  	['display_column' => 'Complemento', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'ganho_unitario' =>
					  	['display_column' => 'Ganho Untário %', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'dt_cadastro' =>
					  	['display_column' => 'Dt. Cadastro', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => '',
						 'default_value' => date("Y-m-d H:i:s"), 
						 'display_grid' => 'false'],
					  'situacao' =>
					  	['display_column' => 'Situação', 
						 'select' => ['a' => 'Ativo', 'd' => 'Desativado'],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'tipo' =>
					  	['display_column' => 'Situação', 
						 'select' => ['c' => 'Cliente', 'r' => 'Revendedor', 's' => 'Representante', 'p' => 'Parceiro'],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'ativo' =>
					  	['display_column' => 'Ativo', 
						 'select' => ['1' => 'True', '0' => 'False'],
						 'rules' => '',
						 'display_grid' => 'false'],
					],
				'where' => ['id_usuario' => $this->session->userdata('id_user')],
				'dropdown' => []
			];
		if (!empty($idCliente)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['id_cliente' => $idCliente]);
		}
		$this->execute();
	}

	public function Empresa_old(){
		$this->set_config = 
			[
				'table' => 
					['nome'     => 'tbl_empresa', 
					 'chave_pk' => 'id_empresa',
					 'display'  => 'Empresa'],
				'columns' => 
					[
					  'id_empresa' => 
						['display_column' => 'Id', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'nome' =>
					  	['display_column' => 'Nome', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'razao_social' =>
					  	['display_column' => 'Razão Social', 
						 'input' => ['type' => 'text', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'nome_fantasia' =>
					  	['display_column' => 'Nome Fantasia', 
						 'input' => ['type' => 'text', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'id_usuario' =>
					  	['display_column' => 'Id Usuário', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => 'required',
						 'default_value' => $this->session->userdata('id_user'), 
						 'display_grid' => 'true'],
					  'sn_filial' =>
					  	['display_column' => 'Filial', 
						 'select' => ['s' => 'Sim', 'n' => 'Não'],
						 'rules' => 'required',
						 'default_value' => '', 
						 'display_grid' => 'true'],
					  'id_tipo' =>
					  	['display_column' => 'Tipo', 
						 'select_relacional' => ['id_tipo','tbl_tipo', 'descricao', ['campo' =>'forma_pgto']],
						 'rules' => 'required',
						 'default_value' => '', 
						 'display_grid' => 'true'],
					],
				'where' => ['id_usuario' => $this->session->userdata('id_user')],
				'dropdown' => [['function' => 'teste', 'param' => 'id_empresa', 'display' => 'Realizar Teste'],
							   ['function' => 'abc', 'param' => '', 'display' => 'Teste Abc']]
			];
		$this->execute();
	}

	public function teste($idEmpresa){
		$this->set_config = 
		   ['table' => 
				['nome'      => 'tbl_teste', 
				 'chave_pk'  => 'id_teste',
				 'chave_pai' => 'id_empresa',
				 'display'   => 'Teste'],
			'columns' => 
				[
				  'id_teste' => 
					['display_column' => 'Id', 
					 'input' => ['type' => 'text', 'required' => 'readonly'],
					 'rules' => '',
					 'display_grid' => 'true'],
				  'id_empresa' => 
					['display_column' => 'Id Empresa', 
					 'input' => ['type' => 'text', 'required' => 'readonly'],
					 'rules' => '',
					 'default_value' => $idEmpresa,
					 'display_grid' => 'false'],
				  'descricao' =>
				  	['display_column' => 'Nome', 
					 'input' => ['type' => 'text', 'required' => ''],
					 'rules' => 'required',
					 'display_grid' => 'true'],
				  'id_usuario' =>
				  	['display_column' => 'Id Usuário', 
					 'input' => ['type' => 'text', 'required' => 'readonly'],
					 'rules' => 'required',
					 'default_value' => $this->session->userdata('id_user'), 
					 'display_grid' => 'true'],
				],
			'where' => ['id_usuario' => $this->session->userdata('id_user'), 'id_empresa' => $idEmpresa],
			'dropdown' => [['function' => 'teste', 'param' => 'id_empresa', 'display' => 'Realizar Teste'],
						   ['function' => 'abc', 'param' => '', 'display' => 'Teste Abc']]
			];
		$this->execute();
		//echo $idEmpresa;
	}

	public function abc(){
		echo "string";
	}

	public function Cidades_old($idCidade = ''){
		$this->set_config = 
			[
				'table' => 
					['nome'     => 'tbl_cidade', 
					 'chave_pk' => 'id_cidade',
					 'display'  => 'Cidades'],
				'columns' => 
					[
					  'id_cidade' => 
						['display_column' => 'Id', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'nome' =>
					  	['display_column' => 'Cidade', 
						 'input' => ['type' => 'text', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'uf' =>
					  	['display_column' => 'Estado', 
						 'select' => ['AC' => 'Acre', 'AL' => 'Alagoas', 'AP' => 'Amapá',
									 'AM' => 'Amazonas', 'BA' => 'Bahia', 'CE' => 'Ceará',
									 'DF' => 'Distrito Federal', 'ES' => 'Espírito Santo',
									 'GO' => 'Goiás', 'MA' => 'Maranhão', 'MT' => 'Mato Grosso',
									 'MS' => 'Mato Grosso do Sul', 'MG' => 'Minas Gerais',
									 'PA' => 'Pará', 'PB' => 'Paraíba', 'PR' => 'Paraná',
									 'PE' => 'Pernambuco', 'PI' => 'Piauí', 'RJ' => 'Rio de Janeiro',
									 'RN' => 'Rio Grande do Norte', 'RS' => 'Rio Grande do Sul',
									 'RO' => 'Rondônia', 'RR' => 'Roraima', 'SC' => 'Santa Catarina',
									 'SP' => 'São Paulo', 'SE' => 'Sergipe', 'TO' => 'Tocantins'],
						 'rules' => '',
						 'display_grid' => 'true'],
					  'link' =>
					  	['display_column' => 'Link', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'true'],
					  'id_usuario' =>
					  	['display_column' => 'Id Usuário', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => 'required',
						 'default_value' => $this->session->userdata('id_user'), 
						 'display_grid' => 'false'],
					],
				'where' => ['id_usuario' => $this->session->userdata('id_user')],
				'dropdown' => []
			];
		if (!empty($idCidade)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['id_cidade' => $idCidade]);
		}
		$this->execute();
	}

	/* Iniciando Aqui vindo do Thor */


	/* begin_tbl_afazer */
	public function afazer(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_afazer',
				 'chave_pk' => 'id_afazer',
				 'display'  => 'A Fazeres'],
			'columns' =>
				[
				  
			 'id_afazer' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'afazer' =>
				['display_column' => 'Descrição a Fazer', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'dt_inicio' =>
				['display_column' => 'Dt. Inicio', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'dt_fim' =>
				['display_column' => 'Dt. Fim', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'realizado' =>
				['display_column' => 'Realizado', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_afazer */


	/* begin_tbl_arquivo_controller */
	public function arquivo_controller(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_arquivo_controller',
				 'chave_pk' => 'arquivo_controller_id',
				 'display'  => 'Arquivo de Controler'],
			'columns' =>
				[
				  
			 'arquivo_controller_id' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome_controller' =>
				['display_column' => 'Nome da Controler', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'diretorio' =>
				['display_column' => 'Diretório', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_arquivo_controller */


	/* begin_tbl_cart */
	public function cart(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_cart',
				 'chave_pk' => 'id_cart',
				 'display'  => 'Carrinho'],
			'columns' =>
				[
				  
			 'id_cart' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_session' =>
				['display_column' => 'Id Session', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_categoria_produto' =>
				['display_column' => 'Categ. Produto', 
				 
				 'select_relacional' => ['id_categoria','tbl_categoria', 'nome', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_produto' =>
				['display_column' => 'Produto', 
				 
				 'select_relacional' => ['id_produto','tbl_produto', 'nome', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_cidade' =>
				['display_column' => 'Cidade', 
				 
				 'select_relacional' => ['id_cidade','tbl_cidade', 'nome', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'qtde' =>
				['display_column' => 'Qtde', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_unitario' =>
				['display_column' => 'Valor Unitário', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'situacao' =>
				['display_column' => 'Situação', 
				 
				 'select' => ["a" => "Ativo", "d" => "Desativado"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cod_promo' =>
				['display_column' => 'SN Cod. Promo', 
				 
				 'select' => ["1" => "True", "0" => "False"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_cart */


	/* begin_tbl_categoria */
	public function categoria(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_categoria',
				 'chave_pk' => 'id_categoria',
				 'display'  => 'Categoria'],
			'columns' =>
				[
				  
			 'id_categoria' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome' =>
				['display_column' => 'Categoria', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'situacao' =>
				['display_column' => 'Situação', 
				 
				 'select' => ["a" => "Ativo", "d" => "Desativado"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cssClass' =>
				['display_column' => 'Css', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'controla_estoque' =>
				['display_column' => 'SN Controla Estoque', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_categoria */


	/* begin_tbl_cidade */
	public function cidade(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_cidade',
				 'chave_pk' => 'id_cidade',
				 'display'  => ''],
			'columns' =>
				[
				  
			 'id_cidade' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome' =>
				['display_column' => 'Cidade', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'uf' =>
				['display_column' => 'UF', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'link' =>
				['display_column' => 'Link', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_cidade */


	/* begin_tbl_cidade_categoria */
	public function cidade_categoria(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_cidade_categoria',
				 'chave_pk' => 'id_cidade_categoria',
				 'display'  => 'Cidade por Categoria'],
			'columns' =>
				[
				  
			 'id_cidade_categoria' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_cidade' =>
				['display_column' => 'Cidade', 
				 
				 'select_relacional' => ['id_cidade','tbl_cidade', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_categoria' =>
				['display_column' => 'Categoria', 
				 
				 'select_relacional' => ['id_categoria','tbl_categoria', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_cidade_categoria */


	/* begin_tbl_cliente */
	public function cliente(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_cliente',
				 'chave_pk' => 'id_cliente',
				 'display'  => 'Cliente'],
			'columns' =>
				[
				  
			 'id_cliente' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome' =>
				['display_column' => 'Nome', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'email' =>
				['display_column' => 'E-mail', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'senha' =>
				['display_column' => 'Senha', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'telefone' =>
				['display_column' => 'Telefone', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'endereco' =>
				['display_column' => 'Endereço', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'numero' =>
				['display_column' => 'Nr.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'bairro' =>
				['display_column' => 'Bairro', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'complemento' =>
				['display_column' => 'Compl.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'situacao' =>
				['display_column' => 'Situação', 
				 
				 'select' => ["a" => "Ativo", "d" => "Desativado"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo' =>
				['display_column' => 'Tipo', 
				 
				 'select' => ["c" => "Cliente", "r" => "Revendedor", "s" => "Representante", "p" => "Parceiro"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'ganho_unitario' =>
				['display_column' => '% Ganho', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cpf_cnpj' =>
				['display_column' => 'CPF/CNPJ', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'hash' =>
				['display_column' => 'Hash', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'ativo' =>
				['display_column' => 'Ativo', 
				 
				 'select' => ["1" => "Frue", "0" => "False"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_cadastro' =>
				['display_column' => 'Dt. Cadastro', 
				 
				 'select' => [],
				 'input' => ['type' => 'datetime-local', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_cliente */


	/* begin_tbl_conta_corrente */
	public function conta_corrente(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_conta_corrente',
				 'chave_pk' => 'id_conta_corrente',
				 'display'  => 'Conta Corrente'],
			'columns' =>
				[
				  
			 'id_conta_corrente' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome_conta_corrente' =>
				['display_column' => 'Nome da Conta', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'interna' =>
				['display_column' => 'SN Interna', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'banco' =>
				['display_column' => 'Banco', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'agencia' =>
				['display_column' => 'Nr. Ag.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'digito_ag' =>
				['display_column' => 'Digito Ag.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'conta_corrente' =>
				['display_column' => 'Nr. Conta Corrente', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'digito_cc' =>
				['display_column' => 'Digito Cc', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'principal' =>
				['display_column' => 'Principal', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'ativo' =>
				['display_column' => 'Ativo', 
				 
				 'select' => ["a" => "Ativo", "d" => "Desativado"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_conta_corrente */


	/* begin_tbl_conta_gerencial */
	public function conta_gerencial(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_conta_gerencial',
				 'chave_pk' => 'id_conta_gerencial',
				 'display'  => 'Conta Gerencial'],
			'columns' =>
				[
				  
			 'id_conta_gerencial' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome_conta_gerencial' =>
				['display_column' => 'Nome da Conta Gerencial', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'tipo_conta' =>
				['display_column' => 'Tipo', 
				 
				 'select' => ["e" => "Entrada", "s" => "Saída"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_conta_dre' =>
				['display_column' => 'Id Conta DRE', 
				 
				 'select_relacional' => ['id_tipo','tbl_tipo', 'descricao', ['campo' =>'id_conta_dre']],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cc_debito' =>
				['display_column' => 'Conta Débito', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cc_credito' =>
				['display_column' => 'Conta Crédito', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'permite_compras' =>
				['display_column' => 'Permite Compras', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'ativo' =>
				['display_column' => 'Ativo', 
				 
				 'select' => ["a" => "Ativo", "d" => "Desativado"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'true'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_conta_gerencial */


	/* begin_tbl_contas_apagar */
	public function contas_apagar(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_contas_apagar',
				 'chave_pk' => 'id_contas_apagar',
				 'display'  => 'Contas a Pagar'],
			'columns' =>
				[
				  
			 'id_contas_apagar' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_cadastro' =>
				['display_column' => 'Dt. Cadastro', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_conta_gerencial' =>
				['display_column' => 'Conta Gerencial', 
				 
				 'select_relacional' => ['id_conta_gerencial','tbl_conta_gerencial', 'nome_conta_gerencial', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_fornecedor' =>
				['display_column' => 'Fornecedor', 
				 
				 'select_relacional' => ['id_fornecedor','tbl_fornecedor', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_documento' =>
				['display_column' => 'Documentos', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_venc' =>
				['display_column' => 'Dt. Vencimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'valor_apagar' =>
				['display_column' => 'Valor Pago', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'dt_pago' =>
				['display_column' => 'Dt. Pago', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_conta_corrente' =>
				['display_column' => 'Conta Corrente', 
				 
				 'select_relacional' => ['id_conta_corrente','tbl_conta_corrente', 'nome_conta_corrente', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_pgto' =>
				['display_column' => 'Valor Pago', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_desconto' =>
				['display_column' => 'Valor Desnconto', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_juros' =>
				['display_column' => 'Valor de Juros', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'obs' =>
				['display_column' => 'Observação', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'conta_fixa' =>
				['display_column' => 'Conta Fixa', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'situacao' =>
				['display_column' => 'Situação', 
				 
				 'select' => ["a" => "Aberto", "p" => "Pago"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_pagamento' =>
				['display_column' => 'Tipo Pgto', 
				 
				 'select_relacional' => ["id_tipo","tbl_tipo", "descricao", ["campo" => "tipo_pagamento"]],
				 'input' => ['type' => 'text', 'required' => ''],

				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nr_vezes' =>
				['display_column' => 'Nr. Vezes', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_contas_apagar */


	/* begin_tbl_contas_areceber */
	public function contas_areceber(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_contas_areceber',
				 'chave_pk' => 'id_contas_areceber',
				 'display'  => 'Contas a Receber'],
			'columns' =>
				[
				  
			 'id_contas_areceber' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_cadastro' =>
				['display_column' => 'Dt. Cadastro', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_conta_gerencial' =>
				['display_column' => 'Conta Gerencial', 
				 
				 'select_relacional' => ['id_conta_gerencial','tbl_conta_gerencial', 'nome_conta_gerencial', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_fornecedor' =>
				['display_column' => 'Fornecedor', 
				 
				 'select_relacional' => ['id_fornecedor','tbl_fornecedor', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_documento' =>
				['display_column' => 'Documento', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_venc' =>
				['display_column' => 'Dt. Vencimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'valor_areceber' =>
				['display_column' => 'Valor a Receber', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'dt_recebido' =>
				['display_column' => 'Dt. Recebimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_conta_corrente' =>
				['display_column' => 'Conta Corrente', 
				 
				 'select_relacional' => ['id_conta_corrente','tbl_conta_corrente', 'nome_conta_corrente', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_recebido' =>
				['display_column' => 'Valor Recebimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_desconto' =>
				['display_column' => 'Valor Desconto', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_juros' =>
				['display_column' => 'Valor Juros', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'obs' =>
				['display_column' => 'Observação', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'conta_fixa' =>
				['display_column' => 'Conta Fixa', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'situacao' =>
				['display_column' => 'Situação', 
				 
				 'select' => ["a" => "Ativo", "d" => "Desativado"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_recebimento' =>
				['display_column' => 'Tipo Recebimento', 
				 
				 'select_relacional' => ["id_tipo","tbl_tipo", "descricao", ["campo" => "tipo_pagamento"]],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nr_vezes' =>
				['display_column' => 'Nr. Vezes', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_contas_areceber */


	/* begin_tbl_empresa */
	public function empresa(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_empresa',
				 'chave_pk' => 'id_empresa',
				 'display'  => 'Empresas'],
			'columns' =>
				[
				  
			 'id_empresa' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome' =>
				['display_column' => 'Nome da Empresa', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'razao_social' =>
				['display_column' => 'Razão Social', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'nome_fantasia' =>
				['display_column' => 'Nome Fantasia', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cnpj' =>
				['display_column' => 'CNPJ', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'nr_inscricao_muni' =>
				['display_column' => 'Nr. Insc. Municipal', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cnae' =>
				['display_column' => 'CNAE', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'data_nascimento' =>
				['display_column' => 'Dt. Nascimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'data_abertura' =>
				['display_column' => 'Dt. Abertura', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'endereco' =>
				['display_column' => 'Endereço', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'numero' =>
				['display_column' => 'Nr.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'complemento' =>
				['display_column' => 'Complemento', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'bairro' =>
				['display_column' => 'Bairro', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cep' =>
				['display_column' => 'CEP', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'municipio' =>
				['display_column' => 'Municipio', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'uf' =>
				['display_column' => 'UF', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_tipo' =>
				['display_column' => 'Tipo', 
				 
				 'select_relacional' => ['id_tipo','tbl_tipo', 'descricao', ['campo' =>'forma_pgto']],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'sn_filial' =>
				['display_column' => 'Filial', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_empresa */


	/* begin_tbl_endereco */
	public function endereco(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_endereco',
				 'chave_pk' => 'id_endereco',
				 'display'  => 'Endereço'],
			'columns' =>
				[
				  
			 'id_endereco' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'endereco' =>
				['display_column' => 'Endereço', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'numero' =>
				['display_column' => 'Nr.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'bairro' =>
				['display_column' => 'Bairro', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'complemento' =>
				['display_column' => 'Complemento', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cep' =>
				['display_column' => 'CEP', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'principal' =>
				['display_column' => 'Prinicipal', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_cliente' =>
				['display_column' => 'Cliente', 
				 
				 'select_relacional' => ['id_cliente','tbl_cliente', 'nome', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_cidade' =>
				['display_column' => 'Cidade', 
				 
				 'select_relacional' => ['id_cidade','tbl_cidade', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_endereco */


	/* begin_tbl_estoque */
	public function estoque(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_estoque',
				 'chave_pk' => 'id_estoque',
				 'display'  => 'Estoque'],
			'columns' =>
				[
				  
			 'id_estoque' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_loja' =>
				['display_column' => 'Loja', 
				 
				 'select_relacional' => ['id_loja','tbl_loja', 'nome_fantasia', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_produto' =>
				['display_column' => 'Produto', 
				 
				 'select_relacional' => ['id_produto','tbl_produto', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'qtde_total' =>
				['display_column' => 'Qtde Total', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'qtde_minima' =>
				['display_column' => 'Qtde Minima', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'ativo' =>
				['display_column' => 'Ativo', 
				 
				 'select' => ["s" => "Sim", "n" => "Não"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_estoque */


	/* begin_tbl_evento */
	public function evento(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_evento',
				 'chave_pk' => 'id_evento',
				 'display'  => 'Evento'],
			'columns' =>
				[
				  
			 'id_evento' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_cliente' =>
				['display_column' => 'Cliente', 
				 
				 'select_relacional' => ['id_cliente','tbl_cliente', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_pedido' =>
				['display_column' => 'Pedido', 
				 
				 'select_relacional' => ['id_pedido','tbl_pedido', 'id_pedido', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'data_evento' =>
				['display_column' => 'Dt. Evento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'end_evento' =>
				['display_column' => 'Endereço', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'hora_evento' =>
				['display_column' => 'Horário', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cel_evento' =>
				['display_column' => 'Celular', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_evento */


	/* begin_tbl_ficha_kardex */
	public function ficha_kardex(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_ficha_kardex',
				 'chave_pk' => 'id_ficha_kerdex',
				 'display'  => 'Ficha Kardex'],
			'columns' =>
				[
				  
			 'id_ficha_kerdex' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_loja' =>
				['display_column' => 'Loja', 
				 
				 'select_relacional' => ['id_loja','tbl_loja', 'nome_fantasia', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_produto' =>
				['display_column' => 'Produto', 
				 
				 'select_relacional' => ['id_produto','tbl_produto', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'tipo_movimentacao' =>
				['display_column' => 'Tipo Movimentação', 
				 
				 'select' => ["e" => "Entrada", "s" => "Saída", "a" => "Ajustes", "t" => "Transferências", "c" => "Cancelado"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'origem_movimentacao' =>
				['display_column' => 'Origem', 
				 
				 'select' => ["me" => "Movimentação Estoque", "nfs" => "Nota Fiscal Saída", "nfe" => "Nota Fiscal Entrada", "ps" => "Pedido Site"],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'data_movimentacao' =>
				['display_column' => 'Data', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'qtde_movimentacao' =>
				['display_column' => 'Qtde', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_ficha_kardex */


	/* begin_tbl_fluxo_caixa */
	public function fluxo_caixa(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_fluxo_caixa',
				 'chave_pk' => 'id_fluxo_caixa',
				 'display'  => 'Fluxo de Caixa'],
			'columns' =>
				[
				  
			 'id_fluxo_caixa' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_contas_areceber' =>
				['display_column' => 'Contas a Receber', 
				 
				 'select_relacional' => ['id_contas_areceber','tbl_contas_areceber', 'id_contas_areceber', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_contas_apagar' =>
				['display_column' => 'Contas a Pagar', 
				 
				 'select_relacional' => ['id_contas_apagar','tbl_contas_apagar', 'id_contas_apagar', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_cadastro' =>
				['display_column' => 'Dt. Cadastro', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_conta_gerencial' =>
				['display_column' => 'Conta Gerencial', 
				 
				 'select_relacional' => ['id_conta_gerencial','tbl_conta_gerencial', 'nome_conta_gerencial', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_fornecedor' =>
				['display_column' => 'Fornecedor', 
				 
				 'select_relacional' => ['id_fornecedor','tbl_fornecedor', 'nome', []],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'id_documento' =>
				['display_column' => 'Documento', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_venc' =>
				['display_column' => 'Dt. Vencimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'valor_areceber' =>
				['display_column' => 'Valor a Receber', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_apagar' =>
				['display_column' => 'Valor a Pagar', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'dt_pgto_receb' =>
				['display_column' => 'Dt. Pgto Recebimento', 
				 
				 'select' => [],
				 'input' => ['type' => 'date', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_conta_corrente' =>
				['display_column' => 'Conta Corrente', 
				 
				 'select_relacional' => ['id_conta_corrente','tbl_conta_corrente', 'nome_conta_corrente', []],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_recebido' =>
				['display_column' => 'Valor Recebido', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_pgto' =>
				['display_column' => 'Valor Pgto', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_desconto' =>
				['display_column' => 'Valor Desconto', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'valor_juros' =>
				['display_column' => 'Valor Juros', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'obs' =>
				['display_column' => 'Observação', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_recebimento' =>
				['display_column' => 'Tipo Recebimento', 
				 
				 'select_relacional' => ["id_tipo","tbl_tipo", "descricao", ["campo" => "tipo_pagamento"]],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tp_entrada_saida' =>
				['display_column' => 'Entrada/Saída', 
				 
				 'select' => ["e" => "Entrada", "s" => "Saída"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => '', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_fluxo_caixa */


	/* begin_tbl_fornecedor */
	public function fornecedor(){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_fornecedor',
				 'chave_pk' => 'id_fornecedor',
				 'display'  => 'Fornecedor'],
			'columns' =>
				[
				  
			 'id_fornecedor' =>
				['display_column' => 'Id', 
				 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome' =>
				['display_column' => 'Nome do Fornecedor', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'apelido' =>
				['display_column' => 'Razão Social', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'telefone' =>
				['display_column' => 'Telefone', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'celular' =>
				['display_column' => 'Celular', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'whatsapp' =>
				['display_column' => 'Whatsapp', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'email' =>
				['display_column' => 'E-mail', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'site' =>
				['display_column' => 'Site', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'observacao' =>
				['display_column' => 'Observação', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_pessoa' =>
				['display_column' => 'Tipo Pessoa', 
				 
				 'select' => ["f" => "Física", "j" => "Jurídica"],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cpf_cnpj' =>
				['display_column' => 'CPF/CNPJ', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'rg' =>
				['display_column' => 'RG', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'inscr_municipal' =>
				['display_column' => 'Inscrição Municipal', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'inscr_estadual' =>
				['display_column' => 'Inscrição Estadual', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_ie' =>
				['display_column' => 'Tipo IE', 
				 
				 'select_relacional' => ["tipo_ie","tbl_tipo","descricao", ["campo" => "tipo_ie"]],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cep' =>
				['display_column' => 'CEP', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'endereco' =>
				['display_column' => 'Endereço', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'numero' =>
				['display_column' => 'Nr.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'bairro' =>
				['display_column' => 'Bairro', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'complemento' =>
				['display_column' => 'Complemento', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'banco' =>
				['display_column' => 'Banco', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'agencia' =>
				['display_column' => 'Agência', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'digito_ag' =>
				['display_column' => 'Digito Ag.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'conta_corrente' =>
				['display_column' => 'Conta Corrente', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'digito_cc' =>
				['display_column' => 'Digito Cc.', 
				 
				 'select' => [],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 
				 'select_relacional' => ['id_usuario','tbl_usuario', 'nome', []],
					
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		$this->execute();
	}
	/* end_tbl_fornecedor */

}