<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MisterThor extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(TRUE);
	}

	/*
		Campo comentário pode existir configuração
		Configuração possiveis para tabela: nome:xxxxx
		Configuração possiveis para colunas: display_column:xxxxx:select: 'a' => 'Ativo', 'd' => 'Desativado'
	*/
	public function index(){
		$all_tables = $this->Mister->get_all_table();
		$tables = ["" => ""];
		foreach ($all_tables as $table) {
			$tables[$table['TABLE_NAME']] = $table['TABLE_NAME'];
		}
		$data['all_tables'] = $tables;
		$this->_output_view($data, 'thor/thor');
	}

	public function get_input_tabela_colunas(){
		$script_inputs = "";
		if ($_POST){
			$tabela = $this->Mister->get_all_table($this->input->post('tabela'));
			$table_comments = explode(":", $tabela[0]['TABLE_COMMENT']);
			$nome_var = isset($table_comments[0]) ? $table_comments[0] : "";
			$display_tabela = isset($table_comments[1]) ? $table_comments[1] : "";
			
			$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));

			foreach ($colunas as $key => $coluna) {
				$config_column = explode(":", $colunas[$key]['COLUMN_COMMENT']);
				$display_var = isset($config_column[0]) ? $config_column[0] : "";
				$display_column = isset($config_column[1]) ? $config_column[1] : "";
				$select_var = isset($config_column[2]) ? $config_column[2] : "";
				$select_values = isset($config_column[3]) ? $config_column[3] : "";

				$script_inputs .= 
				"
				<div class='form-row'>
					<div class='form-group col-md-3'>
						<label>Nome da Coluna</label>
						<input type='text' name='coluna[]' class='form-control' placeholder='Nome da Coluna' value='".$colunas[$key]['COLUMN_NAME']."'>
					</div>
					<input type='hidden' name='display_var[]' value='display_column'>
					<input type='hidden' name='column_type[]' value='".$colunas[$key]['COLUMN_TYPE']."'>
					<input type='hidden' name='is_nullable[]' value='".($colunas[$key]['IS_NULLABLE'] === 'NO' ? "NOT NULL":"NULL") ."'>
					<div class='form-group col-md-3'>
						<label>Display da Coluna</label>
						<input type='text' name='display_column[]' class='form-control' placeholder='Display da Coluna' value='".$display_column."'>
					</div>
					<input type='hidden' name='select_var[]' value='select'>
					<div class='form-group col-md-3'>
						<label>Possíveis valores</label>
						<input type='text' name='select_values[]' class='form-control' placeholder='Possíveis valores' value='".$select_values."'>
					</div>
				</div>
				";
			}
			

			$script_inputs = 
			"
				<form action='http://localhost/MisterAdmin/MisterThor/set_tabelas_colunas' class='form-inline' method='post' accept-charset='utf-8' id='enviar_tabela_coluna'>
					<input type='hidden' name='echo' value='true'>
					<div class='form-row'>
						<div class='form-group col-md-4'>
							<label>Nome da Tabela</label>
							<input type='text' name='tabela' class='form-control' placeholder='Nome da Tabela' value='".$tabela[0]['TABLE_NAME']."'>
							<input type='hidden' name='nome_var' value='nome'>
						</div>
						<div class='form-group col-md-4'>
							<label>Display da Tabela</label>
							<input type='text' name='display_tabela' class='form-control' placeholder='Display da Tabela' value='".$display_tabela."'>
						</div>
					</div>
					$script_inputs
					<button type='submit' class='btn btn-info'>Gerar e Salvar</button>
				</form>
			";

			echo $script_inputs;
		}
	}

	public function set_tabelas_colunas(){
		if ($_POST){
			$scripts[] = "/* begin_".$_POST['tabela']." */ \n";

			$scripts[] = "SET FOREIGN_KEY_CHECKS = 0; \n";

			if(array_search("id_usuario", $_POST['coluna']) === FALSE){
				$scripts[] = "ALTER TABLE `miste872_prod`.`".$_POST['tabela']."` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; \n";

				$scripts[] = " ALTER TABLE `miste872_prod`.`".$_POST['tabela']."` ADD CONSTRAINT `FK_".str_replace("tbl_", "", $_POST['tabela'])."_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); \n";
			}

			$scripts[] = "UPDATE ".$_POST['tabela']." SET id_usuario = ".$this->session->userdata('id_user')."; \n";

			$scripts[] = "ALTER TABLE `miste872_prod`.`".$_POST['tabela']."` COMMENT='".$_POST['nome_var'].":".$_POST['display_tabela']."'; \n";
			
			foreach ($_POST['coluna'] as $key => $value) {
				$scripts[] = "ALTER TABLE `miste872_prod`.`".$_POST['tabela']."` CHANGE `".$value."` `".$value."` ".$_POST['column_type'][$key]." ".$_POST['is_nullable'][$key]." COMMENT '".$_POST['display_var'][$key].":".$_POST['display_column'][$key].":".$_POST['select_var'][$key].":".$_POST['select_values'][$key]."'; \n";
			}

			$scripts[] = "SET FOREIGN_KEY_CHECKS = 1; \n";

			$scripts[] = "/* end_".$_POST['tabela']." */ \n";

			$this->Mister->ExecScript($scripts);

			$arquivo = FCPATH."script\script-configuracao.sql";
			$linhas = file($arquivo); // lê o arquivo na forma de array (cada linha é um elemento)
			$start = false;
			$stop = false;
			foreach ($linhas as $key => $linha) {
				if (strpos($linha, "begin_".$_POST['tabela']) !== false){
					$start = true;
				}
				
				if($start && !$stop)
				 unset($linhas[$key]);

				if (strpos($linha, "end_".$_POST['tabela']) !== false){
					$stop = true;					
				}
			}
			$numero_linha = count($linhas);
			$final_array = array_splice($linhas, $numero_linha-1); // corta array ($linhas fica com a primeira parte; array_splice retorna a parte cortada)
			$linhas = array_merge($linhas, $scripts); // junta com o novo
			$linhas = array_merge($linhas, $final_array); // junta novamente
			file_put_contents($arquivo, $linhas);

			print_r($scripts);
		}
	}

	public function get_script(){
		if ($_POST){
			$tabela = $this->Mister->get_all_table($this->input->post('tabela'));

			$nome_tabela = $tabela[0]['TABLE_NAME'];
			
			$table_comments = explode(":", $tabela[0]['TABLE_COMMENT']);
			$nome_var = isset($table_comments[0]) ? $table_comments[0] : "";
			$display_tabela = isset($table_comments[1]) ? $table_comments[1] : "";

			$columns = $this->Mister->get_show_columns($this->input->post('tabela'));
			//print_r($columns);
			$campo = "";
			$campos = "\n";
			foreach ($columns as $key => $value) {
				$config_column = explode(":", $columns[$key]['COLUMN_COMMENT']);
				$display_column = isset($config_column[1]) ? $config_column[1] : "";
				$select_values = isset($config_column[3]) ? $config_column[3] : "";
				$required = "";
				$rules = "";
				$display_grid = "";
				$default_value = "'{$columns[$key]['COLUMN_DEFAULT']}'";

				
					
				if(in_array($columns[$key]['DATA_TYPE'], ["date"])){
					$type = "date";
				} else if (in_array($columns[$key]['DATA_TYPE'], ["datetime"])){
					$type = "datetime-local";
				} else if (in_array($columns[$key]['DATA_TYPE'], ["decimal", "float", "int", "double"])) {
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

				if(in_array($columns[$key]['COLUMN_KEY'], ["MUL"])){
					$tabela_ref = $this->Mister->get_table_ref($nome_tabela, $columns[$key]['COLUMN_NAME']);
					$field = "
				 'select_relacional' => ['".$tabela_ref[0]['REFERENCED_COLUMN_NAME']."','".$tabela_ref[0]['REFERENCED_TABLE_NAME']."', 'nome', []],
					";
				} else {
					$field = "
				 'select' => [$select_values],
				 'input' => ['type' => '$type', 'required' => '$required'],
					";
				}
			$campos .= 
"			 '{$columns[$key]['COLUMN_NAME']}' =>
				['display_column' => '$display_column', 
				 $field
				 'rules' => '$rules',
				 'default_value' => $default_value, 
				 'costumer_value' => '',
				 'display_grid' => '$display_grid'],
";
			}
	
			$script = "
	/* begin_$nome_tabela */
	public function ".str_replace("tbl_", "", $nome_tabela)."(){
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

		\$this->execute();
	}
	/* end_$nome_tabela */
";

			if($this->input->post('echo') !== null && $this->input->post('echo') === 'true'){
				$arquivo = APPPATH."controllers\\Mister.php";
				$linhas = file($arquivo); // lê o arquivo na forma de array (cada linha é um elemento)
				$start = false;
				$stop = false;
				foreach ($linhas as $key => $linha) {
					if (strpos($linha, "begin_".$nome_tabela) !== false){
						unset($linhas[$key-1]);
						$start = true;
					}
					
					if($start && !$stop)
					 unset($linhas[$key]);

					if (strpos($linha, "end_".$nome_tabela) !== false){
						$stop = true;					
						unset($linhas[$key+1]);
					}
				}
				$numero_linha = count($linhas);
				$final_array = array_splice($linhas, $numero_linha-1); // corta array ($linhas fica com a primeira parte; array_splice retorna a parte cortada)
				$linhas[] = $script . "\n"; // adiciona após a posição cortada
				$linhas = array_merge($linhas, $final_array); // junta novamente
				file_put_contents($arquivo, $linhas);

				echo $script;
			} else {
				$this->_output_view($data, 'thor/thor');
				$data['script'] = $script;
			}
		}
	}
}