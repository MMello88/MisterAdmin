<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main_Model extends CI_Model {

    public function  __construct() {
        parent::__construct();
    }

    /**
	 * Get
	 *
	 * Busca na tabela Mister Link pelo Link carregado no click
	 * e retorna um ou todos links
	 *
	 * @param	string	o Link
	 * @return	array[]
	 */
    public function getMisterLink($aLink = ''){
        if(empty($aLink))
            $query = $this->db->get('mister_link');
        else 
            $query = $this->db->get_where('mister_link', ['link' => $aLink]);

        return $query->result_array();
    }

    /**
	 * Get
	 *
	 * Busca na tabela Mister Tabela atravé do id ou nome da tabela
	 * e retorna um ou todas Tabelas
	 *
	 * @param	string	o Iid da Tabela
     * @param	string	o Nome da Tabelas
	 * @return	array[]
	 */
    public function getMisterTabela($id_tabela = '', $tabela = ''){
        if(empty($id_tabela) && empty($tabela))
            $query = $this->db->get('mister_tabela');
        else {
            if(!empty($id_tabela))
                $query = $this->db->get_where('mister_tabela', ['id_tabela' => $id_tabela]);
            else if(!empty($tabela))
                $query = $this->db->get_where('mister_tabela', ['tabela' => $tabela]);
        }

        return $query->result_array();
    }

    public function getMisterColuna($id_tabela, $id_coluna = '', $coluna = ''){
        if(empty($id_tabela))
            $query = $this->db->get('mister_coluna');
        else 
            $query = $this->db->get_where('mister_coluna', ['id_tabela' => $id_tabela]);

        return $query->result_array();
    }

    public function getMisterColunaRegra($id_link, $id_tabela, $id_coluna = ''){
        $data = ['id_link' => $id_link, 'id_tabela' => $id_tabela];
        if(!empty($id_coluna)){
            $data['id_coluna'] = $id_coluna;
        }
        $query = $this->db->get_where('mister_coluna_regra', $data);
        return $query->result_array();
    }

    public function getMisterWhere($id_link, $id_coluna = ''){
        $this->db->select('*');
        $this->db->from('mister_where');
        $this->db->join('mister_coluna', 'mister_coluna.id_coluna = mister_where.id_coluna');
        if(empty($id_coluna))
            $this->db->where(['id_link' => $id_link]);
        else
        $this->db->where(['id_link' => $id_link, 'id_coluna' => $id_coluna]);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getMisterColunaInput($id_coluna_input){
        /** id_banco = 3 (MYSQL) */
        $sql = "SELECT ci.id_coluna_input, CONCAT(tc.tipo,tc.length) tipo, ti.display, ti.type
                  FROM mister_coluna_input ci
                 INNER JOIN mister_tipo_coluna tc ON (tc.id_tipo_coluna = ci.id_tipo_coluna)
                 INNER JOIN mister_tipo_input ti ON (ti.id_tipo_input = ci.id_tipo_input)
                 WHERE tc.id_banco = 3
                   AND ci.id_coluna_input = $id_coluna_input";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function compile($aLink){
        $link = current($this->getMisterLink($aLink));
        $tabela = current($this->getMisterTabela($link['id_tabela']));
        $colunas = $this->getMisterColuna($tabela['id_tabela']);
        $keyColunaPri = '';
        $arrColumns = '';
        foreach($colunas as $keyColuna => $coluna){
            $colunaRegra = current($this->getMisterColunaRegra($link['id_link'], $tabela['id_tabela'], $coluna['id_coluna']));
            if($coluna['colunachave'] === 'Pri')
                $keyColunaPri = $keyColuna;
            $arrColumns[$coluna['coluna']] = [
                'display_column' => $colunaRegra['display_column'], 
                'rules' => $colunaRegra['rules'],
                'default_value' => $colunaRegra['default_value'], 
                'costumer_value' => $colunaRegra['costumer_value'], 
                'display_grid' => $colunaRegra['display_grid']];

                if($coluna['colunachave'] === 'Mul'){
                    $arrColumns[$coluna['coluna']]['select_relacional'] = [$coluna['coluna_id_ref'],$coluna['tabela_ref'], $coluna['coluna_ref'], []];
                } else if($coluna['colunachave'] === 'Pri') {
                    $input = current($this->getMisterColunaInput($coluna['id_coluna_input']));
                    $arrColumns[$coluna['coluna']]['input'] = ['type' => $input['type'], 'required' => 'readonly'];
                } else if($coluna['colunachave'] === '') {
                    $input = current($this->getMisterColunaInput($coluna['id_coluna_input']));
                    if($input['type'] == 'checkbox'){
                        $arrColumns[$coluna['coluna']]['select'] = ['1' => 'Sim', '0' => 'Não'];
                    } else if($input['type'] == 'select'){
                        $arrColumns[$coluna['coluna']]['select'] = $colunaRegra['select'];
                    } else {
                        $arrColumns[$coluna['coluna']]['input'] = ['type' => $input['type'], 'required' => $coluna['notnull'] === 'Sim' ? "required" : ""];
                    }
                }
        }
        $wheres = $this->getMisterWhere($link['id_link']);
        $arrWheres['id_usuario'] = $this->session->userdata('id_user');
        foreach ($wheres as $key => $where) {
            $campo = $where['coluna'] + ' ' + $where['sinal'];
            $arrWheres[$campo] = $where['valor'];
        }
        
        $set_config = [
            'table' => [
                'nome' => $tabela['tabela'],
                'chave_pk' => $colunas[$keyColunaPri]['coluna'],
                'display' => $link['display']
            ],
            'columns' => $arrColumns,
            'where' => $arrWheres,
            'dropdown' => []
        ];

        return $set_config;
    }
}