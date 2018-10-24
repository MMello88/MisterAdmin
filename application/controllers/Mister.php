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

	public function Fornecedores($idFornecedor = ''){
		$this->set_config = 
			[
				'table' => 
					['nome'     => 'tbl_fornecedor', 
					 'chave_pk' => 'id_fornecedor',
					 'display'  => 'Fornecedores'],
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
					  'email' =>
					  	['display_column' => 'E-mail', 
						 'input' => ['type' => 'email', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'true'],
					  'site' =>
					  	['display_column' => 'Web Site', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'whatsapp' =>
					  	['display_column' => 'Whatsapp', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'true'],
					  'celular' =>
					  	['display_column' => 'Celular', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'telefone' =>
					  	['display_column' => 'Telefone', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'observacao' =>
					  	['display_column' => 'Observação', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
					  'tipo_pessoa' =>
					  	['display_column' => 'Tipo Pessoa', 
						 'select' => ['f' => 'Fisíca', 'j' => 'Juridica'],
						 'rules' => '',
						 'display_grid' => 'true'],
					  'cpf_cnpj' =>
					  	['display_column' => 'CPF ou CNPJ', 
						 'input' => ['type' => 'text', 'required' => ''],
						 'rules' => '',
						 'display_grid' => 'false'],
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
}