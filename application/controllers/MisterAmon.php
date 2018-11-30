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
		$data['all_tables'] = $this->getAllTablesToCombox();
		$this->_output_view($data, 'amon/amon');
    }
    
	public function get_input_tabela_colunas(){
		$script_inputs = "";
		if ($_POST){
			
			$html_input_tabela = $this->getHtmlInputTabela();
			$html_input_coluna = $this->getHtmlInputColuna();

			echo
			"
				<form action='http://localhost/MisterAdmin/MisterAmon/SalvarTabelaColuna' class='form-inline' method='post' accept-charset='utf-8' id='enviar_tabela_coluna'>
					<input type='hidden' name='echo' value='true'>
					$html_input_tabela
					$html_input_coluna
					<button type='submit' class='btn btn-info'>Salvar</button>
				</form>
			";
		}
	}

	public function SalvarTabelaColuna(){
		if ($_POST){
			print_r($_POST);
			die();
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

	private function getColunaInputToCombox(){
		$ColunaInputs = $this->Mister->getColunaInput();
		$cbxInputs = ["" => ""];
		foreach ($ColunaInputs as $ColunaInput) {
			$cbxInputs[$ColunaInput['id_coluna_input']] = $ColunaInput['display'];
		}

		return $cbxInputs;
	}

	private function getAllTablesToCombox(){
		$all_tables = $this->Mister->get_all_table();
		$tables = ["" => ""];
		foreach ($all_tables as $table) {
			$tables[$table['TABLE_NAME']] = $table['TABLE_NAME'];
		}
		
		return $tables;
	}

	private function getHtmlInputTabela(){
		$tabela = $this->Mister->get_all_table($this->input->post('tabela'));

		return "
			<div class='form-row'>
				<div class='form-group col-md-4'>
					<label>Nome da Tabela</label>
					<input type='text' name='tabela' class='form-control input-sm' placeholder='Nome da Tabela' value='".$tabela[0]['TABLE_NAME']."'>
					<input type='hidden' name='nome_var' value='nome'>
				</div>
				<div class='form-group col-md-4'>
					<label>Display da Tabela</label>
					<input type='text' name='display_tabela' class='form-control input-sm' placeholder='Display da Tabela' value=''>
				</div>
			</div>
		";
	}

	private function getHtmlInputColuna(){
		$cbxInputs = $this->getColunaInputToCombox();
		$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));
		$html = "";
		foreach ($colunas as $key => $coluna) {
			$config_column = explode(":", $colunas[$key]['COLUMN_COMMENT']);
			$display_var = isset($config_column[0]) ? $config_column[0] : "";
			$display_column = isset($config_column[1]) ? $config_column[1] : "";
			$select_var = isset($config_column[2]) ? $config_column[2] : "";
			$select_values = isset($config_column[3]) ? $config_column[3] : "";

			$html .= 
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

					<div class='form-group col-md-3'>
						<label>Tipo de Campo</label>
						" . form_dropdown('type[]', $cbxInputs, "", "id='cbxInput' class='form-control input-sm'") . "
					</div>
				</div>
			";			
		}

		return $html;		
	}
}