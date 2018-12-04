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
			<!-- Formulário da Tabela -->
			<div class='row'>
				<div class='col-lg-12'>
					<div class='card'>
						<div class='card-title'>
							<h4>Tabela</h4>
						</div>
						<div class='card-body'>
							<!-- basic-elements -->
							<div class='basic-elements'>
								<form action='http://localhost/MisterAdmin/MisterAmon/SalvarTabelaColuna' class='form-inline' method='post' accept-charset='utf-8' id='enviar_tabela_coluna'>
									<input type='hidden' name='echo' value='true'>
									
									<!-- Campos da Tabela -->
									<div class='row'>
										$html_input_tabela
									</div>
									<!-- // Campos da Tabela -->

									<!-- Formulário dos Campos -->
									<div class='col-lg-12'>
										<div class='card'>
											<div class='card-title'>
												<h4>Colunas</h4>
											</div>
											<div class='card-body'>
												<!-- basic-elements -->
												<div class='basic-elements'>
													<!-- Campos do Campos -->
													$html_input_coluna
													<!-- // Campos do Campos -->
												</div>
												<!-- // basic-elements -->
											</div>
										</div>
									</div>
									<!-- // Formulário dos Campos -->
									<button type='submit' class='btn btn-info'>Salvar</button>
								</form>
							</div>
							<!-- // basic-elements -->
						</div>
					</div>
				</div>
			</div>
			<!-- // Formulário da Tabela -->			
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

	public function getComboboxTabelaRef(){
		$tables = $this->getAllTablesToCombox();
		if(isset($_POST['echo']) && $_POST['echo'] === "true"){
			$variavel = $_POST['div_id'];
			echo "
			<div class='col-lg-3' id='tab_ref'>
				<div class='form-group'>
					<label>Tabela Ref: </label>
					" . form_dropdown("id_tabela_ref[]", $tables, "", "id='id_tabela_ref' class='form-control' style='width:100%;' onchange='addCampoRelacional(this.value,$variavel)'") . "					
				</div>
			</div>
				  ";
		}
	}

	public function getComboboxCampoRef(){
		if(isset($_POST['echo']) && $_POST['echo'] === "true"){
			$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));
			$cols = ["" => ""];
			foreach ($colunas as $coluna) {
				$cols[$coluna['COLUMN_NAME']] = $coluna['COLUMN_NAME'];
			}
			echo "
				<div class='col-lg-3' id='col_ref'>
					<div class='form-group'>
						<label>Coluna Id Ref: </label>
						" . form_dropdown("coluna_id_ref[]", $cols, "", "id='coluna_id_ref' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3' id='col_ref_1'>
					<div class='form-group'>
						<label>Coluna Ref: </label>
						" . form_dropdown("coluna_ref[]", $cols, "", "id='coluna_ref' class='form-control' style='width:100%;'") . "
					</div>
				</div>";
		}
	}

	private function getColunaInputToCombox(){
		$ColunaInputs = $this->Mister->getMisterColunaInput();
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
			<div class='row'>
				<div class='col-md-3'>
					<div class='form-group'>
						<label>Nome: </label>
						" . form_input('tabela', $tabela[0]['TABLE_NAME'], "class='form-control' placeholder='Nome da Tabela'") . "
					</div>
				</div>
				<div class='col-md-3'>
					<div class='form-group'>
						<label>Display: </label>
						" . form_input('display_tabela', "", "class='form-control' placeholder='Display'") . "
					</div>
				</div>
				<div class='col-md-3'>
					<div class='form-group checkbox'>
						<label>	
						" . form_checkbox('eh_filha', 'N', FALSE, "id='eh_filha' class='form-check-input'") . "
							É Tabela Filha? </label>
					</div>
				</div>
				<div class='col-md-3'>
					<div class='form-group'>
						<label> Nome Tabela Filha: </label>
						" . form_input('tabela_filha', "", "id='tabela_filha' class='form-control' placeholder='Nome Tabela Filha' readonly") . "
					</div>
				</div>

				<div class='col-md-3'>
					<div class='form-group'>
						<label>Link Web: </label>
						" . form_input('link', "", "class='form-control' placeholder='Link Web'") . "
					</div>
				</div>
			</div>
		";
	}

	private function getHtmlInputColuna(){
		$cbxInputs = $this->getColunaInputToCombox();
		$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));
		$html = "";
		foreach ($colunas as $key => $coluna) {
			$html .= 
			"
			<div class='row border-bottom py-3' id='campo$key'>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Nome: </label>
						" . form_input('column[]', $colunas[$key]['COLUMN_NAME'], "class='form-control' placeholder='Nome da Coluna' readonly") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Display: </label>
						" . form_input('display_column[]', "", "class='form-control' placeholder='Display da Coluna'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Tipo: </label>
						" . form_dropdown('type[]', $cbxInputs, "", "id='cbxInput' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group checkbox'>
						<label>
						" . form_checkbox('notnull[]', $colunas[$key]['IS_NULLABLE'] == 'NO' ? 'Sim' : 'Não', $colunas[$key]['IS_NULLABLE'] == 'NO' ? TRUE : FALSE, "class='form-check-input'") . "
						 Campo Obrigatório</label>
					</div>
				</div>
				<div class='col-lg-3'>	
					<div class='form-group checkbox'>
						<label>Campo Chave: </label>
						" . form_dropdown('colunachave[]', ["" => "", "PRI" => "Chave Primaria", "MUL" => "Chave Relacional"], $colunas[$key]['COLUMN_KEY'], "id='colunachave' class='form-control' style='width:100%;' onChange='addTabelaRelacional(this.value, $key)'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Regras: </label>
						" . form_multiselect('rules[]', ["" => "", "required" => "Campo Obrigatório", "valid_email" => "Validar Email", 
						  "trim" => "Retira Espaços", "alpha_numeric" => "Valor Alfanumerico", "numeric" => "Valor Numérico", 
						  "decimal" => "Valor Decimal", "integer" => "Valor Inteiro"], "", "id='rules' class='form-control'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Valor Default: </label>
						" . form_input('display_column[]', "", "class='form-control' placeholder='Valor Default'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Valor Customizado: </label>
						" . form_dropdown('costumer_value[]', ["" => "", "md5" => "Criptografia MD5"], "", "id='costumer_value' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group checkbox'>
						<label>
						" . form_checkbox('display_grid[]', 'Sim', TRUE, "class='form-check-input'") . "
						 Mostrar da Grade</label>
					</div>
				</div>
			</div>
			";			
		}
		$html .= "</div>";
		return $html;		
	}
}

