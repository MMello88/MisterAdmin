<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mister_Model extends MY_Model {

    public function  __construct() {
        parent::__construct();
    }

    protected function setConfigure(){}
    
    public function getAllMisterTabela(){
        $result = $this->db->get_where('mister_tabela');
        return $result->result_array();
    }

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

    public function get_show_columns($table_name, $column_name = '')
    {
        $sql = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'miste872_prod' AND TABLE_NAME = '$table_name'";
        if (!empty($column_name))
            $sql .= " AND COLUMN_NAME = '$column_name'";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
  
    public function get_all_table($tabela = ''){
      $sql = "SELECT TABLE_NAME, TABLE_COMMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'miste872_prod' AND TABLE_NAME NOT LIKE 'mister%'";
      if (!empty($tabela))
        $sql .= "AND TABLE_NAME = '$tabela'";
      $query = $this->db->query($sql);
      return $query->result_array();
    }
  
    public function get_table_ref($tabela, $coluna){
      $sql = "SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS  RC
              INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
                  ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
                  AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
                  AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
              WHERE RC.CONSTRAINT_SCHEMA = 'miste872_prod' AND RC.TABLE_NAME = '$tabela' AND KCU1.COLUMN_NAME = '$coluna';";
      $query = $this->db->query($sql);
      return $query->result_array();
    }    
}

