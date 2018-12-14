<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MisterMut extends MY_Controller {
	
	public function __construct()
	{
        parent::__construct(TRUE);
        //$this->output->enable_profiler(TRUE);
    }

    public function Tabela(){
        $this->set_config = 
            [
                'table' => [
                    'nome' => 'mister_tabela',
                    'chave_pk' => 'id_tabela',
                    'display' => 'Mister Tabela'
                ],
                'columns' => [
                    'id_tabela' => [
                        'display_column' => 'Id',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'readonly'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'tabela' => [
                        'display_column' => 'Nome da Tabela',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'required'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'filha' => [
                        'display_column' => 'Filha',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        //'input' => '',
                        'select' => ['1' => 'Não', '2' => 'Sim']
                        //'select_relacional' => ''
                    ],
                    'tabela_filha' => [
                        'display_column' => 'Tabela Filha',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        //'input' => '',
                        //'select' => '',
                        'select_relacional' => ['id_tabela', 'mister_tabela', 'tabela', []]
                    ]
                    
                ],
                'where' => [],
                'dropdown' => [['function' => 'Link', 'param' => 'id_tabela', 'display' => 'Links da Tabela']]
            ];

        $this->execute();
    }

    public function Colunas($id_tabela, $id_coluna = ''){
        $this->set_config = 
            [
                'table' => [
                    'nome' => 'mister_coluna',
                    'chave_pk' => 'id_coluna',
                    'display' => 'Mister Coluna'
                ],
                'columns' => [
                    'id_coluna' => [
                        'display_column' => 'Id',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'readonly'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'coluna' => [
                        'display_column' => 'Nome da Coluna',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'required'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'id_tabela' => [
                        'display_column' => 'Nome da Tabela',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => $id_tabela,
                        'display_grid' => 'FALSE',
                        //'input' => ['type' => 'hidden', 'required' => 'required'],
                        //'select' => ''
                        'select_relacional' => ['id_tabela', 'mister_tabela', 'tabela', ['id_tabela' => $id_tabela]]
                    ],
                    'notnull' => [
                        'display_column' => 'Não Nulo',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => '',
                        'select' => ['Sim' => 'Sim', 'Nao' => 'Não']
                        //'select_relacional' => ''
                    ],
                    'colunachave' => [
                        'display_column' => 'Campo Chave',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => '',
                        'select' => ['' => '', 'Pri' => 'Chave Principal', 'Mul' => 'Chave Relacional']
                        //'select_relacional' => ''
                    ],
                ],
                'where' => [],
                'dropdown' => [['function' => 'Link', 'param' => 'id_tabela', 'display' => 'Links da Tabela']]
            ];
        
        if(!is_numeric($id_tabela)){
            $id_tabela = '';
        }
        if(!empty($id_tabela)){
            $this->set_config['where']['id_tabela'] = $id_tabela;
        }

        if(!empty($id_coluna)){
            $this->set_config['where']['id_coluna'] = $id_coluna;
        }

        $this->execute();
    }

    public function Link($id_tabela){
        $this->set_config = 
            [
                'table' => [
                    'nome' => 'mister_link',
                    'chave_pk' => 'id_link',
                    'chave_pai' => 'id_tabela',
                    'display' => 'Mister Links'
                ],
                'columns' => [
                    'id_link' => [
                        'display_column' => 'Id',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'readonly'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'link' => [
                        'display_column' => 'Link',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'required'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'display' => [
                        'display_column' => 'Display',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'required'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'id_tabela' => [
                        'display_column' => 'Nome da Tabela',
                        'rules' => 'required',
                        'default_value' => $id_tabela,
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        //'input' => ['type' => 'hidden', 'required' => 'readonly'],
                        //'select' => '',
                        'select_relacional' => ['id_tabela', 'mister_tabela', 'tabela', ['id_tabela' => $id_tabela], 'disabled']
                    ],
                    'ativo' => [
                        'display_column' => 'Ativo',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        //'input' => '',
                        'select' => ['Sim' => 'Sim', 'Nao' => 'Não']
                        //'select_relacional' => ''
                    ]
                ],
                'where' => ['id_tabela' => $id_tabela],
                'dropdown' => [
                    ['function' => 'RegraColuna', 'param' => 'id_link', 'display' => 'Regras da Coluna'],
                    ['function' => 'Where', 'param' => 'id_link', 'display' => 'Condições']
                ]
            ];

        $this->execute();
    }

    public function RegraColuna($id_link){
        $this->set_config = 
            [
                'table' => [
                    'nome' => 'mister_coluna_regra',
                    'chave_pk' => 'id_coluna_regra',
                    'chave_pai' => 'id_link',
                    'display' => 'Mister Regras da Coluna'
                ],
                'columns' => [
                    'id_coluna_regra' => [
                        'display_column' => 'Id',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'readonly'],
                        'select' => ''
                        //'select_relacional' => ''
                    ],
                    'id_link' => [
                        'display_column' => 'Nome do Link',
                        'rules' => 'required',
                        'default_value' => $id_link,
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        //'input' => ['type' => 'hidden', 'required' => 'readonly'],
                        //'select' => '',
                        'select_relacional' => ['id_link', 'mister_link', 'link', ['id_link' => $id_link], 'disabled']
                    ],
                    'id_tabela' => [
                        'display_column' => 'Nome da Tabela',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        //'input' => ['type' => 'Text', 'required' => 'required'],
                        //'select' => ''
                        'select_relacional' => ['id_tabela', 'mister_tabela', 'tabela', [], 'disabled']
                    ],
                    'id_coluna' => [
                        'display_column' => 'Nome da Coluna',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        //'input' => ['type' => 'Text', 'required' => 'required'],
                        //'select' => ''
                        'select_relacional' => ['id_coluna', 'mister_coluna', 'coluna', [], 'disabled']
                    ],
                    'display_column' => [
                        'display_column' => 'Display da Coluna',
                        'rules' => 'required',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'TRUE',
                        'input' => ['type' => 'Text', 'required' => 'required'],
                        //'select' => ''
                        //'select_relacional' => ''
                    ],
                    'rules' => [
                        'display_column' => 'Regras',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        //'input' => ['type' => 'text', 'required' => '']
                        //'select_relacional' => '',
                        'select' => ['required' => 'Campo Obrigatório', 'valid_email' => 'Validar Email', 'trim' => 'Retira Espaços', 'alpha_numeric' => 'Valor Alfanumerico', 'numeric' => 'Valor Numérico', 'decimal' => 'Valor Decimal', 'integer' => 'Valor Inteiro']
                    ],
                    'select' => [
                        'display_column' => 'Selecionar',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => ['type' => 'text', 'required' => '']
                        //'select' => ['Sim' => 'Sim', 'Nao' => 'Não']
                        //'select_relacional' => ''
                    ],
                    'default_value' => [
                        'display_column' => 'Valor Default',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => ['type' => 'text', 'required' => '']
                        //'select' => ['Sim' => 'Sim', 'Nao' => 'Não']
                        //'select_relacional' => ''
                    ],
                    'costumer_value' => [
                        'display_column' => 'Valor Default',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => ['type' => 'text', 'required' => ''],
                        'select' => ['md5' => 'Criptografia MD5']
                        //'select_relacional' => ''
                    ],
                    'display_grid' => [
                        'display_column' => 'Mostrar na Grid',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        //'input' => ['type' => 'text', 'required' => '']
                        'select' => ['TRUE' => 'Sim', 'FALSE' => 'Não']
                        //'select_relacional' => ''
                    ],
                    'coluna_ref' => [
                        'display_column' => 'Coluna Referêncial',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => ['type' => 'text', 'required' => '']
                        //'select' => ['TRUE' => 'Sim', 'FALSE' => 'Não']
                        //'select_relacional' => ''
                    ],
                    'ordem' => [
                        'display_column' => 'Ordem',
                        'rules' => '',
                        'default_value' => '',
                        'costumer_value' => '',
                        'display_grid' => 'FALSE',
                        'input' => ['type' => 'number', 'required' => '']
                        //'select' => ['TRUE' => 'Sim', 'FALSE' => 'Não']
                        //'select_relacional' => ''
                    ]
                ],
                'where' => ['id_link' => $id_link],
                'dropdown' => [
                    ['function' => 'Colunas', 'param' => ['id_tabela', 'id_coluna'], 'display' => 'Coluna'],
                ]
            ];

        $this->execute();
    }

    public function Where(){

    }
}