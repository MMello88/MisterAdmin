<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuario_model extends MY_Model {

    

    public function  __construct() {
        parent::__construct();
    }

    /*
    public function insert(){
        $this->Values['id_usuario' ] = '';
        $this->Values['ativo'      ] = 'd';
        $this->Values['dt_cadastro'] = date("Y-m-d H:i:s");
        $this->Values['senha'      ] = md5($this->Values['senha']);
        $this->Values['hash'       ] = md5($this->Values['email']);
        if ($this->db->insert('tbl_usuario', $this->Values)){
            $this->Values['id_usuario'] = $this->db->insert_id();           
            return $this->Values['id_usuario'];
        }
        else
            return $this->db->error()['message'];
    }
    */

    protected function setConfigure(){
        $this->Values = array();
        $this->Fields = array('id_usuario', 'nome', 'email', 'senha', 'hash', 'ativo', 'dt_cadastro', 'telefone', 'end_completo');
        $this->FieldId = 'id_usuario';
        $this->Table = 'tbl_usuario';
        $this->ValuesDefault = array('ativo' => 'd', 'dt_cadastro' => date("Y-m-d H:i:s"));
        $this->ValuesConfig = array('senha' => 'md5', 'hash' => 'md5[email]');    
    }

    public function ativarUsuario($id_usuario){      
        return $this->setHashUsuario($id_usuario, null, TRUE);
    }

    public function gerarNovoHash($id_usuario, $hash){
        return $this->setHashUsuario($id_usuario, $hash);
    }

    /*public function update(){
        if (isset($this->Values['senha'])) {
            $this->Values['senha'] = do_hash($this->Values['senha'], 'md5');
        }
        $this->db->update('tbl_usuario', $this->Values, array('id_usuario' => $this->Values['id_usuario']));
        if ($this->db->error()['code'] > 0)
          return $this->db->error()['message'];
        return 'Dados Atualizado com Sucesso';
    }*/

    public function alterarSenha($id_usuario, $senha){
        return $this->setNovaSenha($id_usuario, $senha);
    }

    private function setHashUsuario($id_usuario, $hash, $ativo = FALSE){
        $this->db->set('hash', $hash);
        if ($ativo === TRUE) $this->db->set('ativo', 'a');
        $this->db->where('id_usuario', $id_usuario);
        return $this->db->update('tbl_usuario') === FALSE ? FALSE : TRUE;
    }

    private function setNovaSenha($id_usuario, $senha){
        $senha = md5($senha);
        $this->db->set('senha', $senha);        
        $this->db->where('id_usuario', $id_usuario);
        return $this->db->update('tbl_usuario') === FALSE ? FALSE : TRUE;
    }

    public function getByHash($hash) {
        $query = $this->db->get_where('tbl_usuario', array('hash' => $hash));
        $result = $query->result_object();
        return empty($result) ? "" : $result[0];
    }

    public function getByEmail($email) {
        $query = $this->db->get_where('tbl_usuario', array('email' => $email));
        $result = $query->result_object();
        return empty($result) ? "" : $result[0];
    }
}

