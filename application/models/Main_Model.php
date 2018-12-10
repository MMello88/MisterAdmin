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
	 * @param	string	o Link
     * @param	string	o Link
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
}