<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Pedidos_model extends CI_Model {

    public function  __construct() {
    }
	
	public function getQtdAbertoFechado() {
        $sql = "SELECT 
                  SUM(a.fechado) fechado,
                  SUM(a.aberto) aberto 
                FROM
                  (SELECT 
                    COUNT(1) fechado,
                    0 aberto 
                  FROM
                    tbl_pedido 
                  WHERE situacao = 'e' 
                  UNION
                  ALL 
                  SELECT 
                    0 fechado,
                    COUNT(1) aberto 
                  FROM
                    tbl_pedido 
                  WHERE situacao NOT IN ('c','e')) a " ;
        $query = $this->db->query($sql);
        return $query->result_object()[0];
    }
}
