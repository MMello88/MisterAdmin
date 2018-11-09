ALTER TABLE `miste872_prod`.`tbl_arquivo_controller`   
  CHANGE `arquivo_controller_id` `arquivo_controller_id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT 'display_column:Id',
  CHANGE `nome_controller` `nome_controller` VARCHAR(80) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Nome da Controler',
  CHANGE `diretorio` `diretorio` VARCHAR(80) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'display_column:Diretório',
COMMENT='nome:Arquivo de Controler';

ALTER TABLE `miste872_prod`.`tbl_arquivo_controller`   
  ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário' AFTER `diretorio`,
  ADD CONSTRAINT `FK_ARQ_CTRL_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`);

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `id_cart` `id_cart` INT(11) NOT NULL AUTO_INCREMENT  COMMENT 'display_column:Id',
  CHANGE `id_session` `id_session` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Id Session',
  CHANGE `id_categoria_produto` `id_categoria_produto` INT(11) NOT NULL  COMMENT 'display_column:Id Categ. Produto',
  CHANGE `id_produto` `id_produto` INT(11) NOT NULL  COMMENT 'display_column:Id Produto',
  CHANGE `id_cidade` `id_cidade` INT(11) NULL  COMMENT 'display_column:Id Cidade',
  CHANGE `qtde` `qtde` DECIMAL(6,0) NOT NULL  COMMENT 'display_column:Qtde',
  CHANGE `valor_unitario` `valor_unitario` DECIMAL(6,2) NOT NULL  COMMENT 'display_column:Valor Unitário',
  CHANGE `situacao` `situacao` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Situação:select:\'a\' => \'Aberto\', \'f\' => \'Fechado\'',
  CHANGE `cod_promo` `cod_promo` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '0'   NULL  COMMENT 'display_column:SN Cod. Promo:select:\'1\' => \'True\', \'0\' => \'False\'',
  ADD COLUMN `id_usuario` INT(11) NULL AFTER `cod_promo`,
  ADD CONSTRAINT `FK_CART_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`),
COMMENT='nome:Carrinho';

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `id_usuario` `id_usuario` INT(11) NULL  COMMENT 'display_column:Id Usuário';

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `situacao` `situacao` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Situação:select:\'a\' => \'Ativo\', \'d\' => \'Desativado\'';

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `id_categoria_produto` `id_categoria_produto` INT(11) NOT NULL  COMMENT 'display_column:Categ. Produto',
  CHANGE `id_produto` `id_produto` INT(11) NOT NULL  COMMENT 'display_column:Produto',
  CHANGE `id_cidade` `id_cidade` INT(11) NULL  COMMENT 'display_column:Cidade',
  CHANGE `id_usuario` `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário';

/* begin_tbl_afazer */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_afazer SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_afazer` COMMENT='nome:A Fazeres'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `id_afazer` `id_afazer` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `afazer` `afazer` varchar(255) NOT NULL COMMENT 'display_column:Descrição a Fazer:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `dt_inicio` `dt_inicio` date NOT NULL COMMENT 'display_column:Dt. Inicio:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `dt_fim` `dt_fim` date NULL COMMENT 'display_column:Dt. Fim:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `realizado` `realizado` char(1) NOT NULL COMMENT 'display_column:Realizado:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_afazer */ 
/* begin_tbl_arquivo_controller */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_arquivo_controller SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` COMMENT='nome:Arquivo de Controler'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `arquivo_controller_id` `arquivo_controller_id` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `nome_controller` `nome_controller` varchar(80) NOT NULL COMMENT 'display_column:Nome da Controler:select:'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `diretorio` `diretorio` varchar(80) NULL COMMENT 'display_column:Diretório:select:'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_arquivo_controller */ 
/* begin_tbl_cart */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cart SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cart` COMMENT='nome:Carrinho'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_cart` `id_cart` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_session` `id_session` varchar(255) NOT NULL COMMENT 'display_column:Id Session:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_categoria_produto` `id_categoria_produto` int(11) NULL COMMENT 'display_column:Categ. Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_produto` `id_produto` int(11) NULL COMMENT 'display_column:Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_cidade` `id_cidade` int(11) NULL COMMENT 'display_column:Cidade:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `qtde` `qtde` decimal(6,0) NULL COMMENT 'display_column:Qtde:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `valor_unitario` `valor_unitario` decimal(6,2) NOT NULL COMMENT 'display_column:Valor Unitário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `situacao` `situacao` char(1) NOT NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `cod_promo` `cod_promo` char(1) NULL COMMENT 'display_column:SN Cod. Promo:select:"1" => "True", "0" => "False"'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cart */ 
/* begin_tbl_categoria */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_categoria` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` ADD CONSTRAINT `FK_categoria_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_categoria SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_categoria` COMMENT='nome:Categoria'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `id_categoria` `id_categoria` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `nome` `nome` varchar(250) NOT NULL COMMENT 'display_column:Categoria:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `situacao` `situacao` char(1) NOT NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `cssClass` `cssClass` varchar(150) NOT NULL COMMENT 'display_column:Css:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `controla_estoque` `controla_estoque` char(1) NOT NULL COMMENT 'display_column:SN Controla Estoque:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column::select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_categoria */ 
/* begin_tbl_cidade */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cidade SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cidade` COMMENT='nome:Cidades'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `id_cidade` `id_cidade` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `nome` `nome` varchar(150) NOT NULL COMMENT 'display_column:Cidade:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `uf` `uf` varchar(2) NOT NULL COMMENT 'display_column:UF:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `link` `link` varchar(100) NOT NULL COMMENT 'display_column:Link:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cidade */ 
/* begin_tbl_cidade_categoria */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` ADD CONSTRAINT `FK_cidade_categoria_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_cidade_categoria SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` COMMENT='nome:Cidade por Categoria'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_cidade_categoria` `id_cidade_categoria` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_cidade` `id_cidade` int(11) NOT NULL COMMENT 'display_column:Cidade:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_categoria` `id_categoria` int(11) NOT NULL COMMENT 'display_column:Categoria:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cidade_categoria */ 
/* begin_tbl_cliente */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cliente SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cliente` COMMENT='nome:Cliente'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `id_cliente` `id_cliente` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `nome` `nome` varchar(150) NOT NULL COMMENT 'display_column:Nome:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `email` `email` varchar(250) NOT NULL COMMENT 'display_column:E-mail:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `senha` `senha` varchar(64) NOT NULL COMMENT 'display_column:Senha:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `telefone` `telefone` varchar(30) NULL COMMENT 'display_column:Telefone:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `endereco` `endereco` varchar(250) NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `numero` `numero` varchar(10) NULL COMMENT 'display_column:Nr.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `bairro` `bairro` varchar(150) NULL COMMENT 'display_column:Bairro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `complemento` `complemento` varchar(100) NULL COMMENT 'display_column:Compl.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `situacao` `situacao` char(1) NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `tipo` `tipo` char(1) NULL COMMENT 'display_column:Tipo:select:"c" => "Cliente", "r" => "Revendedor", "s" => "Representante", "p" => "Parceiro"'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `ganho_unitario` `ganho_unitario` decimal(2,2) NULL COMMENT 'display_column:% Ganho:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `cpf_cnpj` `cpf_cnpj` varchar(14) NULL COMMENT 'display_column:CPF/CNPJ:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `hash` `hash` varchar(255) NULL COMMENT 'display_column:Hash:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `ativo` `ativo` char(1) NULL COMMENT 'display_column:Ativo:select:"1" => "Frue", "0" => "False"'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `dt_cadastro` `dt_cadastro` datetime NULL COMMENT 'display_column:Dt. Cadastro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cliente */ 
/* begin_tbl_conta_corrente */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` ADD CONSTRAINT `FK_conta_corrente_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_conta_corrente SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` COMMENT='nome:Conta Corrente'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `id_conta_corrente` `id_conta_corrente` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `nome_conta_corrente` `nome_conta_corrente` varchar(150) NOT NULL COMMENT 'display_column:Nome da Conta:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `interna` `interna` char(1) NOT NULL COMMENT 'display_column:SN Interna:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `banco` `banco` varchar(10) NULL COMMENT 'display_column:Banco:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `agencia` `agencia` varchar(10) NULL COMMENT 'display_column:Nr. Ag.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `digito_ag` `digito_ag` varchar(5) NULL COMMENT 'display_column:Digito Ag.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `conta_corrente` `conta_corrente` varchar(15) NULL COMMENT 'display_column:Nr. Conta Corrente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `digito_cc` `digito_cc` varchar(5) NULL COMMENT 'display_column:Digito Cc:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `principal` `principal` char(1) NULL COMMENT 'display_column:Principal:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `ativo` `ativo` char(1) NULL COMMENT 'display_column:Ativo:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_conta_corrente` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column::select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_conta_corrente */ 
/* begin_tbl_conta_gerencial */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` ADD CONSTRAINT `FK_conta_corrente_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_conta_gerencial SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` COMMENT='nome:Conta Gerencial'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `id_conta_gerencial` `id_conta_gerencial` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `nome_conta_gerencial` `nome_conta_gerencial` varchar(150) NOT NULL COMMENT 'display_column:Nome da Conta Gerencial:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `tipo_conta` `tipo_conta` char(1) NOT NULL COMMENT 'display_column:Tipo:select:"e" => "Entrada", "s" => "Saída"'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `id_conta_dre` `id_conta_dre` char(10) NULL COMMENT 'display_column:Id Conta DRE:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `cc_debito` `cc_debito` varchar(15) NULL COMMENT 'display_column:Conta Débito:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `cc_credito` `cc_credito` varchar(15) NULL COMMENT 'display_column:Conta Crédito:select:'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `permite_compras` `permite_compras` char(1) NULL COMMENT 'display_column:Permite Compras:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `ativo` `ativo` char(1) NULL COMMENT 'display_column:Ativo:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_conta_gerencial` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column::select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_conta_gerencial */ 
/* begin_tbl_contas_apagar */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_contas_apagar` ADD CONSTRAINT `FK_contas_apagar_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_contas_apagar SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` COMMENT='nome:Contas a Pagar'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `id_contas_apagar` `id_contas_apagar` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `dt_cadastro` `dt_cadastro` date NOT NULL COMMENT 'display_column:Dt. Cadastro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `id_conta_gerencial` `id_conta_gerencial` int(11) NOT NULL COMMENT 'display_column:Conta Gerencial:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `id_fornecedor` `id_fornecedor` int(11) NOT NULL COMMENT 'display_column:Fornecedor:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `id_documento` `id_documento` int(11) NULL COMMENT 'display_column:Documentos:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `dt_venc` `dt_venc` date NOT NULL COMMENT 'display_column:Dt. Vencimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `valor_apagar` `valor_apagar` decimal(7,2) NOT NULL COMMENT 'display_column:Valor Pago:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `dt_pago` `dt_pago` date NULL COMMENT 'display_column:Dt. Pago:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `id_conta_corrente` `id_conta_corrente` int(11) NULL COMMENT 'display_column:Conta Corrente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `valor_pgto` `valor_pgto` decimal(7,2) NULL COMMENT 'display_column:Valor Pago:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `valor_desconto` `valor_desconto` decimal(7,2) NULL COMMENT 'display_column:Valor Desnconto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `valor_juros` `valor_juros` decimal(7,2) NULL COMMENT 'display_column:Valor de Juros:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `obs` `obs` varchar(255) NULL COMMENT 'display_column:Observação:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `conta_fixa` `conta_fixa` char(1) NULL COMMENT 'display_column:Conta Fixa:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `situacao` `situacao` char(1) NULL COMMENT 'display_column:Situação:select:"a" => "Aberto", "p" => "Pago"'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `tipo_pagamento` `tipo_pagamento` varchar(11) NULL COMMENT 'display_column:Tipo Pgto:select:"id_tipo","tbl_tipo", "descricao", ["campo" => "tipo_pagamento"]'; 
ALTER TABLE `miste872_prod`.`tbl_contas_apagar` CHANGE `nr_vezes` `nr_vezes` char(4) NULL COMMENT 'display_column:Nr. Vezes:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_contas_apagar */ 
/* begin_tbl_contas_areceber */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_contas_areceber` ADD CONSTRAINT `FK_contas_areceber_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_contas_areceber SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` COMMENT='nome:Contas a Receber'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `id_contas_areceber` `id_contas_areceber` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `dt_cadastro` `dt_cadastro` date NOT NULL COMMENT 'display_column:Dt. Cadastro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `id_conta_gerencial` `id_conta_gerencial` int(11) NOT NULL COMMENT 'display_column:Conta Gerencial:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `id_fornecedor` `id_fornecedor` int(11) NOT NULL COMMENT 'display_column:Fornecedor:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `id_documento` `id_documento` int(11) NULL COMMENT 'display_column:Documento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `dt_venc` `dt_venc` date NOT NULL COMMENT 'display_column:Dt. Vencimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `valor_areceber` `valor_areceber` decimal(7,2) NOT NULL COMMENT 'display_column:Valor a Receber:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `dt_recebido` `dt_recebido` date NULL COMMENT 'display_column:Dt. Recebimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `id_conta_corrente` `id_conta_corrente` int(11) NULL COMMENT 'display_column:Conta Corrente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `valor_recebido` `valor_recebido` decimal(7,2) NULL COMMENT 'display_column:Valor Recebimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `valor_desconto` `valor_desconto` decimal(7,2) NULL COMMENT 'display_column:Valor Desconto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `valor_juros` `valor_juros` decimal(7,2) NULL COMMENT 'display_column:Valor Juros:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `obs` `obs` varchar(255) NULL COMMENT 'display_column:Observação:select:'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `conta_fixa` `conta_fixa` char(1) NULL COMMENT 'display_column:Conta Fixa:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `situacao` `situacao` char(1) NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `tipo_recebimento` `tipo_recebimento` varchar(11) NULL COMMENT 'display_column:Tipo Recebimento:select:"id_tipo","tbl_tipo", "descricao", ["campo" => "tipo_pagamento"]'; 
ALTER TABLE `miste872_prod`.`tbl_contas_areceber` CHANGE `nr_vezes` `nr_vezes` char(4) NULL COMMENT 'display_column:Nr. Vezes:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_contas_areceber */ 
/* begin_tbl_empresa */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_empresa SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_empresa` COMMENT='nome:Empresas'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `id_empresa` `id_empresa` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `nome` `nome` varchar(150) NOT NULL COMMENT 'display_column:Nome da Empresa:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `razao_social` `razao_social` varchar(250) NOT NULL COMMENT 'display_column:Razão Social:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `nome_fantasia` `nome_fantasia` varchar(250) NOT NULL COMMENT 'display_column:Nome Fantasia:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `cnpj` `cnpj` varchar(14) NOT NULL COMMENT 'display_column:CNPJ:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `nr_inscricao_muni` `nr_inscricao_muni` varchar(20) NULL COMMENT 'display_column:Nr. Insc. Municipal:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `cnae` `cnae` varchar(250) NULL COMMENT 'display_column:CNAE:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `data_nascimento` `data_nascimento` date NULL COMMENT 'display_column:Dt. Nascimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `data_abertura` `data_abertura` date NULL COMMENT 'display_column:Dt. Abertura:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `endereco` `endereco` varchar(200) NOT NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `numero` `numero` varchar(10) NOT NULL COMMENT 'display_column:Nr.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `complemento` `complemento` varchar(50) NULL COMMENT 'display_column:Complemento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `bairro` `bairro` varchar(150) NOT NULL COMMENT 'display_column:Bairro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `cep` `cep` varchar(10) NOT NULL COMMENT 'display_column:CEP:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `municipio` `municipio` varchar(100) NOT NULL COMMENT 'display_column:Municipio:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `uf` `uf` varchar(10) NOT NULL COMMENT 'display_column:UF:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `id_usuario` `id_usuario` int(11) NOT NULL COMMENT 'display_column:Usuário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `id_tipo` `id_tipo` int(11) NULL COMMENT 'display_column:Tipo:select:"id_tipo","tbl_tipo", "descricao", ["campo" =>"forma_pgto"]'; 
ALTER TABLE `miste872_prod`.`tbl_empresa` CHANGE `sn_filial` `sn_filial` char(1) NULL COMMENT 'display_column:Filial:select:"s" => "Sim", "n" => "Não"'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_empresa */ 
/* begin_tbl_endereco */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_endereco` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_endereco` ADD CONSTRAINT `FK_endereco_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_endereco SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_endereco` COMMENT='nome:Endereço'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `id_endereco` `id_endereco` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `endereco` `endereco` varchar(250) NOT NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `numero` `numero` varchar(10) NOT NULL COMMENT 'display_column:Nr.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `bairro` `bairro` varchar(150) NOT NULL COMMENT 'display_column:Bairro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `complemento` `complemento` varchar(100) NULL COMMENT 'display_column:Complemento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `cep` `cep` varchar(10) NULL COMMENT 'display_column:CEP:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `principal` `principal` char(1) NOT NULL COMMENT 'display_column:Prinicipal:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `id_cliente` `id_cliente` int(11) NULL COMMENT 'display_column:Cliente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_endereco` CHANGE `id_cidade` `id_cidade` int(11) NOT NULL COMMENT 'display_column:Cidade:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_endereco */ 
/* begin_tbl_estoque */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_estoque` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_estoque` ADD CONSTRAINT `FK_estoque_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_estoque SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_estoque` COMMENT='nome:Estoque'; 
ALTER TABLE `miste872_prod`.`tbl_estoque` CHANGE `id_estoque` `id_estoque` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_estoque` CHANGE `id_loja` `id_loja` int(11) NOT NULL COMMENT 'display_column:Loja:select:'; 
ALTER TABLE `miste872_prod`.`tbl_estoque` CHANGE `id_produto` `id_produto` int(11) NOT NULL COMMENT 'display_column:Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_estoque` CHANGE `qtde_total` `qtde_total` decimal(6,0) NOT NULL COMMENT 'display_column:Qtde Total:select:'; 
ALTER TABLE `miste872_prod`.`tbl_estoque` CHANGE `qtde_minima` `qtde_minima` decimal(6,0) NULL COMMENT 'display_column:Qtde Minima:select:'; 
ALTER TABLE `miste872_prod`.`tbl_estoque` CHANGE `ativo` `ativo` char(1) NULL COMMENT 'display_column:Ativo:select:"s" => "Sim", "n" => "Não"'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_estoque */ 
/* begin_tbl_evento */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_evento` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_evento` ADD CONSTRAINT `FK_evento_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_evento SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_evento` COMMENT='nome:Evento'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `id_evento` `id_evento` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `id_cliente` `id_cliente` int(11) NOT NULL COMMENT 'display_column:Cliente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `id_pedido` `id_pedido` int(11) NOT NULL COMMENT 'display_column:Pedido:select:'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `data_evento` `data_evento` date NOT NULL COMMENT 'display_column:Dt. Evento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `end_evento` `end_evento` varchar(250) NOT NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `hora_evento` `hora_evento` varchar(15) NOT NULL COMMENT 'display_column:Horário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_evento` CHANGE `cel_evento` `cel_evento` varchar(30) NOT NULL COMMENT 'display_column:Celular:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_evento */ 
/* begin_tbl_ficha_kardex */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` ADD CONSTRAINT `FK_ficha_kardex_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_ficha_kardex SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` COMMENT='nome:Ficha Kardex'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `id_ficha_kerdex` `id_ficha_kerdex` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `id_loja` `id_loja` int(11) NOT NULL COMMENT 'display_column:Loja:select:'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `id_produto` `id_produto` int(11) NOT NULL COMMENT 'display_column:Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `tipo_movimentacao` `tipo_movimentacao` char(2) NOT NULL COMMENT 'display_column:Tipo Movimentação:select:"e" => "Entrada", "s" => "Saída", "a" => "Ajustes", "t" => "Transferências", "c" => "Cancelado"'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `origem_movimentacao` `origem_movimentacao` char(3) NOT NULL COMMENT 'display_column:Origem:select:"me" => "Movimentação Estoque", "nfs" => "Nota Fiscal Saída", "nfe" => "Nota Fiscal Entrada", "ps" => "Pedido Site"'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `data_movimentacao` `data_movimentacao` date NOT NULL COMMENT 'display_column:Data:select:'; 
ALTER TABLE `miste872_prod`.`tbl_ficha_kardex` CHANGE `qtde_movimentacao` `qtde_movimentacao` decimal(6,0) NOT NULL COMMENT 'display_column:Qtde:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_ficha_kardex */ 
/* begin_tbl_fluxo_caixa */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` ADD CONSTRAINT `FK_fluxo_caixa_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_fluxo_caixa SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` COMMENT='nome:Fluxo de Caixa'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_fluxo_caixa` `id_fluxo_caixa` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_contas_areceber` `id_contas_areceber` int(11) NULL COMMENT 'display_column:Contas a Receber:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_contas_apagar` `id_contas_apagar` int(11) NULL COMMENT 'display_column:Contas a Pagar:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `dt_cadastro` `dt_cadastro` date NOT NULL COMMENT 'display_column:Dt. Cadastro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_conta_gerencial` `id_conta_gerencial` int(11) NOT NULL COMMENT 'display_column:Conta Gerencial:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_fornecedor` `id_fornecedor` int(11) NOT NULL COMMENT 'display_column:Fornecedor:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_documento` `id_documento` int(11) NULL COMMENT 'display_column:Documento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `dt_venc` `dt_venc` date NOT NULL COMMENT 'display_column:Dt. Vencimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `valor_areceber` `valor_areceber` decimal(7,2) NULL COMMENT 'display_column:Valor a Receber:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `valor_apagar` `valor_apagar` decimal(7,2) NULL COMMENT 'display_column:Valor a Pagar:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `dt_pgto_receb` `dt_pgto_receb` date NULL COMMENT 'display_column:Dt. Pgto Recebimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `id_conta_corrente` `id_conta_corrente` int(11) NULL COMMENT 'display_column:Conta Corrente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `valor_recebido` `valor_recebido` decimal(7,2) NULL COMMENT 'display_column:Valor Recebido:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `valor_pgto` `valor_pgto` decimal(7,2) NULL COMMENT 'display_column:Valor Pgto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `valor_desconto` `valor_desconto` decimal(7,2) NULL COMMENT 'display_column:Valor Desconto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `valor_juros` `valor_juros` decimal(7,2) NULL COMMENT 'display_column:Valor Juros:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `obs` `obs` varchar(255) NULL COMMENT 'display_column:Observação:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `tipo_recebimento` `tipo_recebimento` varchar(11) NULL COMMENT 'display_column:Tipo Recebimento:select:"id_tipo","tbl_tipo", "descricao", ["campo" => "tipo_pagamento"]'; 
ALTER TABLE `miste872_prod`.`tbl_fluxo_caixa` CHANGE `tp_entrada_saida` `tp_entrada_saida` char(1) NULL COMMENT 'display_column:Entrada/Saída:select:"e" => "Entrada", "s" => "Saída"'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_fluxo_caixa */ 
/* begin_tbl_fornecedor */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_fornecedor SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` COMMENT='nome:Fornecedor'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `id_fornecedor` `id_fornecedor` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `nome` `nome` varchar(250) NOT NULL COMMENT 'display_column:Nome do Fornecedor:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `apelido` `apelido` varchar(255) NULL COMMENT 'display_column:Razão Social:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `telefone` `telefone` varchar(25) NULL COMMENT 'display_column:Telefone:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `celular` `celular` varchar(25) NULL COMMENT 'display_column:Celular:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `whatsapp` `whatsapp` varchar(25) NULL COMMENT 'display_column:Whatsapp:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `email` `email` varchar(200) NULL COMMENT 'display_column:E-mail:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `site` `site` varchar(50) NULL COMMENT 'display_column:Site:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `observacao` `observacao` text NULL COMMENT 'display_column:Observação:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `tipo_pessoa` `tipo_pessoa` char(1) NULL COMMENT 'display_column:Tipo Pessoa:select:"f" => "Física", "j" => "Jurídica"'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `cpf_cnpj` `cpf_cnpj` varchar(14) NULL COMMENT 'display_column:CPF/CNPJ:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `rg` `rg` varchar(14) NULL COMMENT 'display_column:RG:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `inscr_municipal` `inscr_municipal` varchar(20) NULL COMMENT 'display_column:Inscrição Municipal:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `inscr_estadual` `inscr_estadual` varchar(25) NULL COMMENT 'display_column:Inscrição Estadual:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `tipo_ie` `tipo_ie` char(11) NULL COMMENT 'display_column:Tipo IE:select:"tipo_ie","tbl_tipo","descricao", ["campo" => "tipo_ie"]'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `cep` `cep` varchar(10) NULL COMMENT 'display_column:CEP:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `endereco` `endereco` varchar(150) NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `numero` `numero` varchar(10) NULL COMMENT 'display_column:Nr.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `bairro` `bairro` varchar(150) NULL COMMENT 'display_column:Bairro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `complemento` `complemento` varchar(100) NULL COMMENT 'display_column:Complemento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `banco` `banco` varchar(250) NULL COMMENT 'display_column:Banco:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `agencia` `agencia` varchar(10) NULL COMMENT 'display_column:Agência:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `digito_ag` `digito_ag` varchar(5) NULL COMMENT 'display_column:Digito Ag.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `conta_corrente` `conta_corrente` varchar(15) NULL COMMENT 'display_column:Conta Corrente:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `digito_cc` `digito_cc` varchar(5) NULL COMMENT 'display_column:Digito Cc.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_fornecedor` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_fornecedor */ 
/* begin_tbl_function_controller */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_function_controller` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_function_controller` ADD CONSTRAINT `FK_function_controller_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_function_controller SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_function_controller` COMMENT='nome:Classe Controller'; 
ALTER TABLE `miste872_prod`.`tbl_function_controller` CHANGE `function_controller_id` `function_controller_id` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_function_controller` CHANGE `arquivo_controller_id` `arquivo_controller_id` int(11) NOT NULL COMMENT 'display_column:Arquivo Controller:select:'; 
ALTER TABLE `miste872_prod`.`tbl_function_controller` CHANGE `nome_function` `nome_function` varchar(80) NOT NULL COMMENT 'display_column:Nome da Função:select:'; 
ALTER TABLE `miste872_prod`.`tbl_function_controller` CHANGE `funcao` `funcao` text NULL COMMENT 'display_column:Script da Função:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_function_controller */ 
/* begin_tbl_item_pedido */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_item_pedido` ADD CONSTRAINT `FK_item_pedido_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_item_pedido SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` COMMENT='nome:Item do Pedido'; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` CHANGE `id_item_pedido` `id_item_pedido` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` CHANGE `id_pedido` `id_pedido` int(11) NOT NULL COMMENT 'display_column:Pedido:select:'; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` CHANGE `id_produto` `id_produto` int(11) NOT NULL COMMENT 'display_column:Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` CHANGE `id_categoria` `id_categoria` int(11) NOT NULL COMMENT 'display_column:Categoria:select:'; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` CHANGE `qtde` `qtde` decimal(6,0) NOT NULL COMMENT 'display_column:Qtde:select:'; 
ALTER TABLE `miste872_prod`.`tbl_item_pedido` CHANGE `valor_unitario` `valor_unitario` decimal(6,2) NOT NULL COMMENT 'display_column:Valor Unitário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_item_pedido */ 
/* begin_tbl_loja */ 
SET FOREIGN_KEY_CHECKS = 0; 
ALTER TABLE `miste872_prod`.`tbl_loja` ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'Usuário'; 
 ALTER TABLE `miste872_prod`.`tbl_loja` ADD CONSTRAINT `FK_loja_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`); 
UPDATE tbl_loja SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_loja` COMMENT='nome:Loja'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `id_loja` `id_loja` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `nome_proprietario` `nome_proprietario` varchar(255) NOT NULL COMMENT 'display_column:Nome do Proprietário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `cpf` `cpf` varchar(11) NOT NULL COMMENT 'display_column:CPF:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `razao_social` `razao_social` varchar(255) NOT NULL COMMENT 'display_column:Razão Social:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `nome_fantasia` `nome_fantasia` varchar(255) NOT NULL COMMENT 'display_column:Nome Fantasia:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `cnpj` `cnpj` varchar(14) NOT NULL COMMENT 'display_column:CNPJ:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `nr_inscricao_muni` `nr_inscricao_muni` varchar(20) NULL COMMENT 'display_column:Nr. Insc. Municipal:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `cnae` `cnae` varchar(250) NULL COMMENT 'display_column:CNAE:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `data_nascimento` `data_nascimento` date NOT NULL COMMENT 'display_column:Dt. Nascimento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `data_abertura` `data_abertura` date NOT NULL COMMENT 'display_column:Dt. Abertura:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `endereco` `endereco` varchar(200) NOT NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `numero` `numero` varchar(10) NOT NULL COMMENT 'display_column:Nr.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `complemento` `complemento` varchar(50) NULL COMMENT 'display_column:Complemento:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `bairro` `bairro` varchar(150) NOT NULL COMMENT 'display_column:Bairro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `cep` `cep` varchar(10) NOT NULL COMMENT 'display_column:CEP:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `municipio` `municipio` varchar(100) NOT NULL COMMENT 'display_column:Municipio:select:'; 
ALTER TABLE `miste872_prod`.`tbl_loja` CHANGE `uf` `uf` varchar(10) NOT NULL COMMENT 'display_column:UF:select:"AC" => "Acre", "AL" => "Alagoas", "AP" => "Amapá", 							  "AM" => "Amazonas", "BA" => "Bahia", "CE" => "Ceará", 							  "DF" => "Distrito Federal", "ES" => "Espírito Santo", 							  "GO" => "Goiás", "MA" => "Maranhão", "MT" => "Mato Grosso", 							  "MS" => "Mato Grosso do Sul", "MG" => "Minas Gerais", 							  "PA" => "Pará", "PB" => "Paraíba", "PR" => "Paraná", 							  "PE" => "Pernambuco", "PI" => "Piauí", "RJ" => "Rio de Janeiro", 							  "RN" => "Rio Grande do Norte", "RS" => "Rio Grande do Sul", 							  "RO" => "Rondônia", "RR" => "Roraima", "SC" => "Santa Catarina", 							  "SP" => "São Paulo", "SE" => "Sergipe", "TO" => "Tocantins"'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_loja */ 

