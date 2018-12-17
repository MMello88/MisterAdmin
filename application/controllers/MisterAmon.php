<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MisterAmon extends MY_Controller {
	
	public function __construct()
	{
		parent::__construct(TRUE);
	}

	public function index(){
		$data['all_tables'] = $this->getAllTablesToCombox();
		$this->_output_view($data, 'amon/amon');
    }
	
	/**Post Via Formulário para Salvar */
	public function SalvarTabelaColuna(){
		if ($_POST){
			/* Adicionando a Tabela */
			$data = ['tabela' => $this->input->post('tabela'), 'filha' => '0', 'tabela_filha' => ''];
			if($this->input->post('filha') !== null){
				$data['filha'] = '1';
				$data['tabela_filha'] = $this->input->post('tabela_filha');
			}
			$rows = $this->Mister->db->get_where('mister_tabela', ['tabela' => $this->input->post('tabela')]);
			$tabelas = $rows->result_object();
			if (empty($tabelas)){
				$this->Mister->db->insert('mister_tabela', $data);
				$id_tabela = $this->db->insert_id();
			} else {
				$id_tabela = $tabelas[0]->id_tabela;
				$this->Mister->db->where('id_tabela', $id_tabela);
				$this->Mister->db->update('mister_tabela', $data);
			}
			

			/* Adicionando o link para a Tabela */
			$data = ['link' => $this->input->post('link'), 'id_tabela' => $id_tabela, 'ativo' => 'Sim', 'display' => $this->input->post('display_tabela')];
			$rows = $this->Mister->db->get_where('mister_link', ['link' => $this->input->post('link')]);
			$links = $rows->result_object();
			if(empty($links)){
				$this->Mister->db->insert('mister_link', $data);
				$id_link = $this->db->insert_id();
			} else {
				$id_link = $links[0]->id_link;
			}
			
			//print_r($_POST);

			/* Adicionando as Colunas da Tabela */
			foreach($this->input->post('coluna') as $coluna_key => $coluna){
				$data = ['coluna' => $this->input->post('coluna')[$coluna_key][0], 
						 'id_tabela' => $id_tabela, 
						 'notnull' => $this->input->post('notnull')[$coluna_key][0], 
						 'colunachave' => $this->input->post('colunachave')[$coluna_key][0], 
						 'tabela_ref' => $this->input->post('tabela_ref')[$coluna_key][0], 
						 'coluna_id_ref' => $this->input->post('coluna_id_ref')[$coluna_key][0], 
						 'id_coluna_input' => $this->input->post('id_coluna_input')[$coluna_key][0]
						];

				$rows = $this->Mister->db->get_where('mister_coluna', ['coluna' => $this->input->post('coluna')[$coluna_key][0], 'id_tabela' => $id_tabela]);
				$colunas = $rows->result_object();
				if(empty($colunas)){
					$this->Mister->db->insert('mister_coluna', $data);
					$id_coluna = $this->db->insert_id();
				} else {
					$id_coluna = $colunas[0]->id_coluna;
					$this->Mister->db->where('id_coluna', $id_coluna);
					$this->Mister->db->update('mister_coluna', $data);
				}

				$data = ['id_link' => $id_link,
						 'id_coluna' => $id_coluna,  
						 'id_tabela' => $id_tabela,
						 'coluna_ref' => $this->input->post('coluna_ref')[$coluna_key][0], 
						 'display_column' => $this->input->post('display_column')[$coluna_key][0],
						 'rules' => implode("|", $this->input->post('rules')[$coluna_key]), 
						 'select' => $this->input->post('select')[$coluna_key][0], 
						 'default_value' => $this->input->post('default_value')[$coluna_key][0], 
						 'costumer_value' => $this->input->post('costumer_value')[$coluna_key][0], 
						 'display_grid' => $this->input->post('display_grid')[$coluna_key][0],
						 'ordem' => $this->input->post('ordem')[$coluna_key][0]
						];
				
				
				$rows = $this->Mister->db->get_where('mister_coluna_regra', ['id_link' => $id_link, 'id_coluna' => $id_coluna, 'id_tabela' => $id_tabela]);
				$colunas = $rows->result_object();
				if(empty($colunas)){
					$this->Mister->db->insert('mister_coluna_regra', $data);
					$id_coluna_regra = $this->db->insert_id();
				} else {
					$id_coluna_regra = $colunas[0]->id_coluna_regra;
					$this->Mister->db->where('id_coluna_regra', $id_coluna_regra);
					$this->Mister->db->update('mister_coluna_regra', $data);
				}

			}

			if($this->input->post('id_coluna_where') !== null){
				foreach ($this->input->post('id_coluna_where') as $coluna_key => $coluna) {
					$rows = $this->Mister->db->get_where('mister_coluna', ['id_tabela' => $id_tabela, 'coluna' => $this->input->post('id_coluna_where')[$coluna_key]]);
					$colunas = $rows->result_object();
					if(!empty($colunas)){
						$id_coluna = $colunas[0]->id_coluna;
						$data = ['id_link' => $id_link,
								'id_coluna' => $id_coluna,
								'sinal' => $this->input->post('sinal')[$coluna_key],
								'valor' => $this->input->post('valor')[$coluna_key]
								];
						$this->Mister->db->insert('mister_where', $data);
						$id_where = $this->db->insert_id();
					}
				}
			}

			$this->session->set_flashdata('msg_flash', 'Configurações salvo com sucesso!');
		} else {
			$this->session->set_flashdata('msg_erro_flash', 'Dados não foi submetido!');
		}

		redirect("MisterAmon");
	}

	/** Post Via Ajax para Carregar o Formulário */
	public function get_input_tabela_colunas(){
		$script_inputs = "";
		if ($_POST){
			$tabela = $this->input->post('tabela');
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
									<!-- Formulário dos Wheres -->
									<div class='col-lg-12'>
										<div class='card'>
											<div class='card-title'>
												<h4>Condições</h4>
											</div>
											<div class='card-body'>
												<!-- basic-elements -->
												<div class='basic-elements' id='campos_where'>
													
													<button type='button' class='btn btn-link btn-outline btn-rounded btn-flat btn-addon m-b-10 m-l-5' onclick='AddCampoWhere(\"$tabela\")'><i class='ti-plus'></i>Add Condição</button>
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
	
	/** Post Via Ajax para Carregar os Campos de Referência */
	public function getComboboxCampoRef(){
		if(isset($_POST['echo']) && $_POST['echo'] === "true"){
			$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));
			$key = $this->input->post('key');
			$colunaKey = $this->input->post('colunaKey');
			$cols = ["" => ""];
			foreach ($colunas as $coluna) {
				$cols[$coluna['COLUMN_NAME']] = $coluna['COLUMN_NAME'];
			}
			echo "
				<div class='col-lg-3' id='col_id_ref_$key'>
					<div class='form-group'>
						<label>Coluna Id Ref: </label>
						" . form_dropdown("coluna_id_ref[$colunaKey][]", $cols, "", "id='coluna_id_ref' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3' id='col_desc_ref_$key'>
					<div class='form-group'>
						<label>Coluna Ref: </label>
						" . form_dropdown("coluna_ref[$colunaKey][]", $cols, "", "id='coluna_ref' class='form-control' style='width:100%;'") . "
					</div>
				</div>";
		}
	}

	/** Post Via Ajax para Carregar os Campos Where */
	public function getInputsCampoWhere(){
		$this->getHtmlInputWhere();
	}

	/** Values do Combobox em formato de array para a função form_dropdown */
	private function getColunaInputToCombox(){
		$ColunaInputs = $this->Mister->getMisterColunaInput();
		$cbxInputs = ["" => ""];
		foreach ($ColunaInputs as $ColunaInput) {
			$cbxInputs[$ColunaInput['id_coluna_input']] = $ColunaInput['display'];
		}

		return $cbxInputs;
	}

	private function getAllMisterTabelaToCombobox(){
		$tabelas = $this->Mister->getAllMisterTabela();
		$tabs = ["" => ""];
		foreach ($tabelas as $key => $tabela) {
			$tabs[$tabela['id_tabela']] = $tabela['tabela'];
		}
		return $tabs;
	}

	private function getAllTablesToCombox(){
		$all_tables = $this->Mister->get_all_table();
		$tables = ["" => ""];
		foreach ($all_tables as $table) {
			$tables[$table['TABLE_NAME']] = $table['TABLE_NAME'];
		}
		return $tables;
	}

	/** Montagem do Html da Tabela / Coluna / Where */
	private function getHtmlInputTabela(){
		$tabela = $this->Mister->get_all_table($this->input->post('tabela'));
		$all_tabelas = $this->getAllMisterTabelaToCombobox();

		return "
			<div class='row'>
				<div class='col-md-3'>
					<div class='form-group'>
						<label>Nome: </label>
						" . form_input('tabela', $tabela[0]['TABLE_NAME'], "class='form-control' placeholder='Nome da Tabela' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-md-3'>
					<div class='form-group'>
						<label>Display: </label>
						" . form_input('display_tabela', "", "class='form-control' placeholder='Display' style='width:100%;' required") . "
					</div>
				</div>
				<div class='col-md-3'>
					<div class='form-group checkbox'>
						<label>	
						" . form_checkbox('filha', 'N', FALSE, "id='eh_filha' class='form-check-input' onclick='habilitaComboboxTabelaFilha(this)'") . "
							É Tabela Filha? </label>
					</div>
				</div>
				<div class='col-md-3'>
					<div class='form-group'>
						<label> Nome Tabela Filha: </label>
						" . form_dropdown("tabela_filha", $all_tabelas, "", "id='tabela_filha' class='form-control' placeholder='Nome Tabela Filha' style='width:100%;' disabled") . "
					</div>
				</div>

				<div class='col-md-3'>
					<div class='form-group'>
						<label>Link Web: </label>
						" . form_input('link', "", "class='form-control' placeholder='Link Web' style='width:100%;' required") . "
					</div>
				</div>
			</div>
		";
	}

	private function getHtmlInputColuna(){
		$tables = $this->getAllTablesToCombox();
		$cbxInputs = $this->getColunaInputToCombox();
		$ColunaTypes = $this->Mister->getMisterColunaInput();

		$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));
		$html = "";
		foreach ($colunas as $key => $colunaDB) {
			$ordem = $key + 1;
			$coluna = $colunaDB['COLUMN_NAME'];
			$id_coluna_input = "";
			foreach ($ColunaTypes as $type) {
				if(strtolower($type['tipo']) == $colunas[$key]['DATA_TYPE']){
					$id_coluna_input = $type['id_coluna_input'];
					break;
				}
			}
			$html .= 
			"
			<div class='row border-bottom py-3' id='campo$key'>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Nome: </label>
						" . form_input("coluna[$coluna][]", $colunas[$key]['COLUMN_NAME'], "class='form-control' placeholder='Nome da Coluna' style='width:100%;' readonly") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Display: </label>
						" . form_input("display_column[$coluna][]", "", "class='form-control' placeholder='Display da Coluna' style='width:100%;' required") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Tipo: </label>
						" . form_dropdown("id_coluna_input[$coluna][]", $cbxInputs, $id_coluna_input, "id='cbxInput' class='form-control' onChange='changeColunaInpu(this, $key, \"$coluna\")' style='width:100%;' required") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group checkbox'>
						<label>Campo Obrigatório</label>
						 " . form_dropdown("notnull[$coluna][]", ["Sim" => "Sim", "Nao" => "Não"], $colunas[$key]['IS_NULLABLE'] == 'NO' ? 'Sim' : 'Nao', "class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3'>	
					<div class='form-group checkbox'>
						<label>Campo Chave: </label>
						" . form_dropdown("colunachave[$coluna][]", ["" => "", "PRI" => "Chave Primaria", "MUL" => "Chave Relacional"], $colunas[$key]['COLUMN_KEY'], "id='colunachave' class='form-control' style='width:100%;' onChange='addTabelaRelacional(this.value, $key)'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Regras: </label>
						" . form_multiselect("rules[$coluna][]", ["" => "", "required" => "Campo Obrigatório", "valid_email" => "Validar Email", 
						  "trim" => "Retira Espaços", "alpha_numeric" => "Valor Alfanumerico", "numeric" => "Valor Numérico", 
						  "decimal" => "Valor Decimal", "integer" => "Valor Inteiro"], "", "id='rules' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Valor Default: </label>
						" . form_input("default_value[$coluna][]", "", "class='form-control' placeholder='Valor Default' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group'>
						<label>Valor Customizado: </label>
						" . form_dropdown("costumer_value[$coluna][]", ["" => "", "md5" => "Criptografia MD5"], "", "id='costumer_value' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3'>
					<div class='form-group checkbox'>
						<label>Mostrar da Grade</label>
						" . form_dropdown("display_grid[$coluna][]", ["TRUE" => "Sim", "FALSE" => "Não"], "", "class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3 d-none' id='tab_ref_$key'>
					<div class='form-group'>
						<label>Tabela Ref: </label>
						" . form_dropdown("tabela_ref[$coluna][]", $tables, "", "id='tabela_ref' class='form-control' style='width:100%;' onchange='addCampoRelacional(this.value, $key, \"$coluna\")'") . "
					</div>
				</div>
				<div class='col-lg-3 d-none' id='col_id_ref_$key'>
					<div class='form-group'>
						<label>Coluna Id Ref: </label>
						" . form_dropdown("coluna_id_ref[$coluna][]", ["" => ""], "", "id='coluna_id_ref_$key' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3 d-none' id='col_desc_ref_$key'>
					<div class='form-group'>
						<label>Coluna Ref: </label>
						" . form_dropdown("coluna_ref[$coluna][]", ["" => ""], "", "id='coluna_ref_$key' class='form-control' style='width:100%;'") . "
					</div>
				</div>
				<div class='col-lg-3 d-none' id='select_$key'>
					<div class='form-group'>
						<label>Lista de Valores: </label>
						" . form_input("select[$coluna][]", "", "class='form-control' placeholder='Exemplo: a => Ativo, d => Desativado ' style='width:100%;' ") . "
					</div>
				</div>
				<div class='col-lg-3' id='select_$key'>
					<div class='form-group'>
						<label>Ordem: </label>
						" . form_input(['type'  => 'number', 'name'  => "ordem[$coluna][]", 'id' => 'ordem', 'value' => $ordem,'class' => 'form-control', 'placeholder' => 'Numero da Ordem', 'style' => 'width:100%']) . "
					</div>
				</div>
			</div>
			";
		}
		return $html;		
	}

	private function getHtmlInputWhere(){
		$colunas = $this->Mister->get_show_columns($this->input->post('tabela'));
		foreach($colunas as $coluna)
			$cols[$coluna['COLUMN_NAME']] = $coluna['COLUMN_NAME'];
		$html = "
		<div class='row' id='RowInputsWhere'>
			<div class='col-md-3'>
				<div class='form-group'>
					<label>Nome: </label>
					" . form_dropdown('id_coluna_where[]', $cols, "" , "class='form-control' style='width:100%;' required") . "
				</div>
			</div>
			<div class='col-md-3'>
				<div class='form-group'>
					<label>Nome: </label>
					" . form_dropdown('sinal[]', ["=" => "Igual", "<>" => "Diferente", "<" => "Menor", ">" => "Maior", "=>" => "Maior e Igual",
					"=<" => "Menor e Igual", "NOT IN" => "Não Esta Em", "IN" => "Esta Em"], "" , "class='form-control' style='width:100%;' required") . "
				</div>
			</div>
			<div class='col-md-3'>
				<div class='form-group'>
					<label>Nome: </label>
					" . form_input('valor[]', "", "class='form-control'  placeholder='Valor' style='width:100%;' required") . "
				</div>
			</div>
			<div class='col-md-3 mt-auto'>
				<div class='form-group'>
					<button type='button' id='btnInputCampoWhere' class='btn btn-link btn-outline btn-rounded btn-flat btn-addon m-b-10 m-l-5' onclick='RemoverCampoWhere(this)'><i class='ti-minus'></i>Remover</button>
				</div>
			</div>
		</div>";
		if(isset($_POST['echo']) && $_POST['echo'] === "true")
			echo $html;
		else 
		   return $html;
	}
}