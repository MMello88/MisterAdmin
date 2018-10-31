<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(TRUE);
	}

	public function Clientes($idCliente = ''){
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

	public function Empresa(){
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

	public function Cidades($idCidade = ''){
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

	public function categorias($idCategoria = ''){
		$this->set_config = 
			[
				'table' => 
					['nome'     => 'tbl_categoria', 
					 'chave_pk' => 'id_categoria',
					 'display'  => 'Categorias'],
				'columns' => 
					[
					  'id_fornecedor' => 
						['display_column' => 'Id', 
						 'input' => ['type' => 'text', 'required' => 'readonly'],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'nome' =>
					  	['display_column' => 'Fornecedore', 
						 'input' => ['type' => 'text', 'required' => 'required'],
						 'rules' => 'required',
						 'display_grid' => 'true'],
					  'apelido' =>
					  	['display_column' => 'Apelido', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'tipo_pessoa' =>
					  	['display_column' => 'Tipo Pessoa', 
						 'select' => ['f' => 'Fisíca', 'j' => 'Juridica'],
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
		if (!empty($idFornecedor)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['id_fornecedor' => $idFornecedor]);
		}
		$this->execute();
	}

	public function fornecedor($id_fornecedor = ''){
		$this->set_config =
	    		[ 
			'table' =>
				['nome'     => 'tbl_fornecedor',
				 'chave_pk' => 'id_fornecedor',
				 'display'  => 'nome_da_tela'],
			'columns' =>
				[
				  
			 'id_fornecedor' =>
				['display_column' => 'id_fornecedor', 
				 'input' => ['type' => 'text', 'required' => 'readonly'],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'nome' =>
				['display_column' => 'nome', 
				 'input' => ['type' => 'text', 'required' => 'required'],
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'apelido' =>
				['display_column' => 'apelido', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'telefone' =>
				['display_column' => 'telefone', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'celular' =>
				['display_column' => 'celular', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'whatsapp' =>
				['display_column' => 'whatsapp', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'email' =>
				['display_column' => 'email', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'site' =>
				['display_column' => 'site', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'observacao' =>
				['display_column' => 'observacao', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_pessoa' =>
				['display_column' => 'tipo_pessoa', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cpf_cnpj' =>
				['display_column' => 'cpf_cnpj', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'rg' =>
				['display_column' => 'rg', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'inscr_municipal' =>
				['display_column' => 'inscr_municipal', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'inscr_estadual' =>
				['display_column' => 'inscr_estadual', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'tipo_ie' =>
				['display_column' => 'tipo_ie', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'cep' =>
				['display_column' => 'cep', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'endereco' =>
				['display_column' => 'endereco', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'numero' =>
				['display_column' => 'numero', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'bairro' =>
				['display_column' => 'bairro', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'complemento' =>
				['display_column' => 'complemento', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'banco' =>
				['display_column' => 'banco', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'agencia' =>
				['display_column' => 'agencia', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'digito_ag' =>
				['display_column' => 'digito_ag', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'conta_corrente' =>
				['display_column' => 'conta_corrente', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'digito_cc' =>
				['display_column' => 'digito_cc', 
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'id_usuario', 
				 'input' => ['type' => 'text', 'required' => 'readonly'],
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		if (!empty($id_fornecedor)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['id_fornecedor' => $id_fornecedor]);
		}
		$this->execute();
	}

	/* Iniciando Aqui vindo do Thor */
	public function afazer($id_afazer = ''){
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
				 'select' => ['s' => 'Sim', 'n' => 'Não'],
				 'input' => ['type' => 'text', 'required' => ''],
				 'rules' => '',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'false'],
			 'id_usuario' =>
				['display_column' => 'Usuário', 
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		if (!empty($id_afazer)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['id_afazer' => $id_afazer]);
		}
		$this->execute();
	}

	public function arquivo_controller($arquivo_controller_id = ''){
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
				 'select' => [],
				 'input' => ['type' => 'number', 'required' => 'readonly'],
				 'rules' => '',
				 'default_value' => $this->session->userdata("id_user"), 
				 'costumer_value' => '',
				 'display_grid' => 'false'],

				],
			'where' => ['id_usuario' => $this->session->userdata('id_user')],
			'dropdown' => [],
		];

		if (!empty($arquivo_controller_id)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['arquivo_controller_id' => $arquivo_controller_id]);
		}
		$this->execute();
	}

	public function cart($id_cart = ''){
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
				 'input' => ['type' => 'number', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
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
				 
				 'select' => ['a' => 'Ativo', 'd' => 'Desativado'],
				 'input' => ['type' => 'text', 'required' => 'required'],
					
				 'rules' => 'required',
				 'default_value' => '', 
				 'costumer_value' => '',
				 'display_grid' => 'true'],
			 'cod_promo' =>
				['display_column' => 'SN Cod. Promo', 
				 
				 'select' => ['1' => 'True', '0' => 'False'],
				 'input' => ['type' => 'text', 'required' => ''],
					
				 'rules' => '',
				 'default_value' => '0', 
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

		if (!empty($id_cart)) {
			$this->set_config['where'] = array_merge_recursive($this->set_config['where'], ['id_cart' => $id_cart]);
		}
		$this->execute();
	}

}

