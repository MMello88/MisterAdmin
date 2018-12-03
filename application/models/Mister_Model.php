<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister_Model extends MY_Model {

    public function  __construct() {
        parent::__construct();
    }
       
    protected function setConfigure(){}

    public function getMisterColunaInput($id_coluna_input = ''){
        $sql = "SELECT ci.id_coluna_input, tc.tipo, ti.display, ti.type
                  FROM mister_coluna_input ci
                 INNER JOIN mister_tipo_coluna tc ON (tc.id_tipo_coluna = ci.id_tipo_coluna)
                 INNER JOIN mister_tipo_input ti ON (ti.id_tipo_input = ci.id_tipo_input)
                 WHERE tc.id_banco = 3 ";
        if (!empty($id_coluna_input))
            $sql .= " AND ci.id_coluna_input = $id_coluna_input";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
}

