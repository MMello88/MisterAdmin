<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Empresa_model extends MY_Model {

    
    public function  __construct() {
        parent::__construct();
    }
       
    protected function setConfigure(){
        $this->Values = array();
        $this->Fields = array('id_empresa', 'nome', 'razao_social', 'nome_fantasia', 'cnpj', 'nr_inscricao_muni', 'cnae', 'data_nascimento', 
                              'data_abertura', 'endereco', 'numero', 'complemento', 'bairro', 'cep', 'municipio');
        $this->FieldId = 'id_empresa';
        $this->Table   = 'tbl_empresa';
    }
}

