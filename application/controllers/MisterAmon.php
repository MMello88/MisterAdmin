<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MisterAmon extends MY_Controller {
	
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
		$this->_output_view($data, 'amon/amon');
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
						<input type='text' name='coluna[]' class='form-control input-sm' placeholder='Nome da Coluna' value='".$colunas[$key]['COLUMN_NAME']."'>
					</div>
					
					<div class='form-group col-md-3'>
						<label>Display da Coluna</label>
						<input type='text' name='display_column[]' class='form-control input-sm' placeholder='Display da Coluna' value='".$display_column."'>
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
							<input type='text' name='tabela' class='form-control input-sm' placeholder='Nome da Tabela' value='".$tabela[0]['TABLE_NAME']."'>
							<input type='hidden' name='nome_var' value='nome'>
						</div>
						<div class='form-group col-md-4'>
							<label>Display da Tabela</label>
							<input type='text' name='display_tabela' class='form-control input-sm' placeholder='Display da Tabela' value='".$display_tabela."'>
						</div>
					</div>
					$script_inputs
					<button type='submit' class='btn btn-info'>Gerar e Salvar</button>
				</form>
			";

			echo $script_inputs;
		}
	}
}