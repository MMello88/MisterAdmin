<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MisterThor extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(FALSE);
	}

	public function index(){
		
		if ($_POST){
			$table = $this->input->post('tabela');
			$data['tabela'] = $table;
			$columns = $this->Mister->get_show_columns($table);
			$campo = "";
			$campos = "\n";
			foreach ($columns as $key => $value) {
				$required = "";
				$rules = "";
				$display_grid = "";
				$default_value = "'{$columns[$key]['Default']}'";

				if($columns[$key]['Key'] == "PRI"){
					$campo = $columns[$key]['Field'];
					$required = "readonly";
					$rules = "";
					$display_grid = "false";
				} else {
					if ($columns[$key]['Null'] == "NO") {
						$required = "required";
						$rules = "required";
						$display_grid = "true";
					} else {
						$display_grid = "false";
					}

					if($columns[$key]['Field'] == "id_usuario"){
						$required = "readonly";
						$default_value = "\$this->session->userdata(\"id_user\")";
					}
				}

			$campos .= 
"			 '{$columns[$key]['Field']}' =>
				['display_column' => '{$columns[$key]['Field']}', 
				 'input' => ['type' => 'text', 'required' => '$required'],
				 'rules' => '$rules',
				 'default_value' => $default_value, 
				 'costumer_value' => '',
				 'display_grid' => '$display_grid'],
";
			}
	
			$script = "
	public function ".str_replace("tbl_", "", $table)."(\$$campo = ''){
		\$this->set_config =
	    		[ 
			'table' =>
				['nome'     => '$table',
				 'chave_pk' => '$campo',
				 'display'  => 'nome_da_tela'],
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
		}
		$data['script'] = $script;
		$this->load->view('thor/thor', $data);
	}
}