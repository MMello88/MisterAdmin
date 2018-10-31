<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MisterThor extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(FALSE);
	}

	/*
		Campo comentário pode existir configuração
		Configuração possiveis para tabela: nome:xxxxx
		Configuração possiveis para colunas: display_column:xxxxx:select: 'a' => 'Ativo', 'd' => 'Desativado'
	*/
	public function index(){

		if ($_POST){
			$tabela = $this->Mister->get_all_table($this->input->post('tabela'));

			$nome_tabela = $tabela[0]['TABLE_NAME'];
			list($nome_var, $display_tabela) = explode(":", $tabela[0]['TABLE_COMMENT']);
			$columns = $this->Mister->get_show_columns($this->input->post('tabela'));
			//print_r($columns);
			$campo = "";
			$campos = "\n";
			foreach ($columns as $key => $value) {
				$config_column = explode(":", $columns[$key]['COLUMN_COMMENT']);
				$display_column = $config_column[1];
				$select_values = isset($config_column[3]) ? $config_column[3] : "";
				$required = "";
				$rules = "";
				$display_grid = "";
				$default_value = "'{$columns[$key]['COLUMN_DEFAULT']}'";

				if(in_array($columns[$key]['DATA_TYPE'], ["date"])){
					$type = "date";
				} else if (in_array($columns[$key]['DATA_TYPE'], ["datetime"])){
					$type = "datetime-local";
				} else if if (in_array($columns[$key]['DATA_TYPE'], ["decimal", "float", "int", "double"])){
					$type = "number";
				} else {
					$type = "text";
				}

				if($columns[$key]['COLUMN_KEY'] == "PRI"){
					$campo = $columns[$key]['COLUMN_NAME'];
					$required = "readonly";
					$rules = "";
					$display_grid = "false";
				} else {
					if ($columns[$key]['IS_NULLABLE'] == "NO") {
						$required = "required";
						$rules = "required";
						$display_grid = "true";
					} else {
						$display_grid = "false";
					}

					if($columns[$key]['COLUMN_NAME'] == "id_usuario"){
						$required = "readonly";
						$default_value = "\$this->session->userdata(\"id_user\")";
					}
				}

			$campos .= 
"			 '{$columns[$key]['COLUMN_NAME']}' =>
				['display_column' => '$display_column', 
				 'select' => [$select_values],
				 'input' => ['type' => '$type', 'required' => '$required'],
				 'rules' => '$rules',
				 'default_value' => $default_value, 
				 'costumer_value' => '',
				 'display_grid' => '$display_grid'],
";
			}
	
			$script = "
	public function ".str_replace("tbl_", "", $nome_tabela)."(\$$campo = ''){
		\$this->set_config =
	    		[ 
			'table' =>
				['nome'     => '$nome_tabela',
				 'chave_pk' => '$campo',
				 'display'  => '$display_tabela'],
			'columns' =>
				[
				  $campos
				],
			'where' => ['id_usuario' => \$this->session->userdata('id_user')],
			'dropdown' => [],
		];

		if (!empty(\$$campo)) {
			\$this->set_config['where'] = array_merge_recursive(\$this->set_config['where'], ['$campo' => \$$campo]);
		}
		\$this->execute();
	}
";

			if($this->input->post('echo') !== null && $this->input->post('echo') === 'true'){
				echo $script;
			} else {
				$this->_output_view($data, 'thor/thor');
				$data['script'] = $script;
			}
		} else {
			$all_tables = $this->Mister->get_all_table();
			$tables = ["" => ""];
			foreach ($all_tables as $table) {
				$tables[$table['TABLE_NAME']] = $table['TABLE_NAME'];
			}
			$data['all_tables'] = $tables;
			$this->_output_view($data, 'thor/thor');
		}
	}
}