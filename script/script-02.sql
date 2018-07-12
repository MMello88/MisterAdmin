ALTER TABLE `miste872_prod`.`tbl_loja`   
  ADD COLUMN `nome_proprietario` VARCHAR(255) NOT NULL AFTER `id_loja`,
  ADD COLUMN `cpf` VARCHAR(11) NOT NULL AFTER `nome_proprietario`,
  CHANGE `nome` `razao_social` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NOT NULL,
  ADD COLUMN `nome_fantasia` VARCHAR(255) NOT NULL AFTER `razao_social`,
  ADD COLUMN `cnpj` VARCHAR(14) NOT NULL AFTER `nome_fantasia`,
  ADD COLUMN `nr_inscricao_muni` VARCHAR(20) NULL AFTER `cnpj`,
  ADD COLUMN `cnae` VARCHAR(250) NULL AFTER `nr_inscricao_muni`,
  ADD COLUMN `data_nascimento` DATE NOT NULL AFTER `cnae`,
  ADD COLUMN `data_abertura` DATE NOT NULL AFTER `data_nascimento`,
  ADD COLUMN `endereco` VARCHAR(200) NOT NULL AFTER `data_abertura`,
  ADD COLUMN `numero` VARCHAR(10) NOT NULL AFTER `endereco`,
  ADD COLUMN `complemento` VARCHAR(50) NULL AFTER `numero`,
  ADD COLUMN `bairro` VARCHAR(150) NOT NULL AFTER `complemento`,
  ADD COLUMN `cep` VARCHAR(10) NOT NULL AFTER `bairro`,
  ADD COLUMN `municipio` VARCHAR(100) NOT NULL AFTER `cep`,
  ADD COLUMN `uf` VARCHAR(10) NOT NULL AFTER `municipio`;

CREATE TABLE `miste872_prod`.`tbl_fornecedor`(  
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(250) NOT NULL,
  `ramo` VARCHAR(255),
  `descricao` TEXT NOT NULL,
  `telefone` VARCHAR(25),
  `celular` VARCHAR(25),
  `whatsapp` VARCHAR(25),
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_menu` (
  `menu_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_menu` VARCHAR(80) NOT NULL,
  `menu_titulo` VARCHAR(80) DEFAULT NULL,
  `tag_i` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_submenu` (
  `submenu_id` INT(11) NOT NULL AUTO_INCREMENT,
  `menu_id` INT(11) NOT NULL ,
  `nome_submenu` VARCHAR(100) NOT NULL,
  `nome_controller` VARCHAR(100) NOT NULL,
  `nome_function` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`submenu_id`),
  KEY `FK_submenu_menu_id` (`menu_id`),
  CONSTRAINT `FK_submenu_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `tbl_menu` (`menu_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_arquivo_controller` (
  `arquivo_controller_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `diretorio` VARCHAR(80) DEFAULT NULL,
  PRIMARY KEY (`arquivo_controller_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_function_controller` (
  `function_controller_id` INT(11) NOT NULL AUTO_INCREMENT,
  `arquivo_controller_id` INT(11) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `funcao` TEXT DEFAULT NULL,
  PRIMARY KEY (`function_controller_id`),
  KEY `FK_function_controller_id` (`arquivo_controller_id`),
  CONSTRAINT `FK_function_controller_id` FOREIGN KEY (`arquivo_controller_id`) REFERENCES `tbl_arquivo_controller` (`arquivo_controller_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

ALTER TABLE `miste872_prod`.`tbl_menu`   
  ADD COLUMN `order` INT(10) NULL AFTER `tag_i`;

ALTER TABLE `miste872_prod`.`tbl_submenu`   
  ADD COLUMN `order` INT(10) NULL AFTER `nome_function`;

ALTER TABLE `miste872_prod`.`tbl_submenu`   
  CHANGE `nome_controller` `arquivo_controller_id` INT(11) NOT NULL,
  CHANGE `nome_function` `function_controller_id` INT(11) NOT NULL;

ALTER TABLE `miste872_prod`.`tbl_submenu`  
  ADD CONSTRAINT `FK_submenu_arq_ctrl` FOREIGN KEY (`arquivo_controller_id`) REFERENCES `miste872_prod`.`tbl_arquivo_controller`(`arquivo_controller_id`),
  ADD CONSTRAINT `FK_submenu_fun_ctrl` FOREIGN KEY (`function_controller_id`) REFERENCES `miste872_prod`.`tbl_function_controller`(`function_controller_id`),
AUTO_INCREMENT=1;

ALTER TABLE `miste872_prod`.`tbl_menu`   
  ADD COLUMN `ativo` CHAR(1) NULL AFTER `order`;

ALTER TABLE `miste872_prod`.`tbl_submenu`   
  ADD COLUMN `ativo` CHAR(1) NULL AFTER `order`;

ALTER TABLE `miste872_prod`.`tbl_arquivo_controller`   
  CHANGE `nome` `nome_controller` VARCHAR(80) CHARSET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `miste872_prod`.`tbl_function_controller`   
  CHANGE `nome` `nome_function` VARCHAR(80) CHARSET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `miste872_prod`.`tbl_estoque`   
  CHANGE `qtde_total` `qtde_total` DECIMAL(6,0) NOT NULL  COMMENT 'qnt total disponivel',
  ADD COLUMN `qnte_minima` DECIMAL(6,0) NULL  COMMENT 'estoque minimo' AFTER `qtde_total`,
  ADD COLUMN `origem_movimentacao` CHAR(3) NULL  COMMENT 'e - movimentacao estoque / nfs - nota fiscal sainda / nfe nota fiscal entrada / ps - pedido site' AFTER `qnte_minima`,
  ADD COLUMN `movimentacao` CHAR(2) NULL  COMMENT 'e - entrada / s - sainda / t - transferencia' AFTER `origem_movimentacao`;

ALTER TABLE `miste872_prod`.`tbl_estoque`   
  DROP COLUMN `origem_movimentacao`, 
  CHANGE `qnte_minima` `qtde_minima` DECIMAL(6,0) NULL  COMMENT 'estoque minimo';

ALTER TABLE `miste872_prod`.`tbl_ficha_kerdex`   
  ADD COLUMN `origem_movimento` CHAR(3) NOT NULL  COMMENT 'e - movimentacao estoque / nfs - nota fiscal sainda / nfe nota fiscal entrada / ps - pedido site' AFTER `movimento`,
  CHANGE `data_movimento` `data_movimento` DATE NOT NULL  AFTER `origem_movimento`,
  CHANGE `qtde` `qtde_movimento` DECIMAL(6,0) NOT NULL  AFTER `data_movimento`;

ALTER TABLE `miste872_prod`.`tbl_estoque`   
  CHANGE `movimentacao` `movimentacao` CHAR(2) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'e - entrada / s - sainda';

ALTER TABLE `miste872_prod`.`tbl_estoque`   
  CHANGE `movimentacao` `movimentacao` CHAR(2) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'e - entrada / s - sainda'  AFTER `id_produto`,
  CHANGE `qtde_total` `qtde_total` DECIMAL(6,0) NOT NULL  COMMENT 'qnt total disponivel'  AFTER `movimentacao`,
  ADD COLUMN `qtde_movimento` DECIMAL(6,0) NULL  COMMENT 'qnt do movimento' AFTER `qtde_minima`;

  CREATE TABLE `miste872_prod`.`tbl_movimentacao_estoque`(  
  `id_movimentacao_estoque` INT NOT NULL AUTO_INCREMENT,
  `id_loja` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `tipo_movimentacao` CHAR(2) COMMENT 'e - entrada / s - sainda',
  `qtde_movimentacao` NUMERIC(6),
  PRIMARY KEY (`id_movimentacao_estoque`),
  CONSTRAINT `FK_MOV_ESTQ_LOJA` FOREIGN KEY (`id_loja`) REFERENCES `miste872_prod`.`tbl_loja`(`id_loja`),
  CONSTRAINT `FK_MOV_ESTQ_PROD` FOREIGN KEY (`id_produto`) REFERENCES `miste872_prod`.`tbl_produto`(`id_produto`)
);


ALTER TABLE `miste872_prod`.`tbl_estoque`   
  DROP COLUMN `movimentacao`;

ALTER TABLE `miste872_prod`.`tbl_ficha_kerdex`   
  CHANGE `movimento` `movimento` CHAR(2) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'e-entrada / s-saida / a - ajuste',
  CHANGE `origem_movimento` `origem_movimento` CHAR(3) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'me - movimentacao estoque / nfs - nota fiscal sainda / nfe nota fiscal entrada / ps - pedido site';

ALTER TABLE `miste872_prod`.`tbl_movimentacao_estoque`   
  CHANGE `tipo_movimentacao` `tipo_movimentacao` CHAR(2) CHARSET utf8 COLLATE utf8_unicode_ci NULL  COMMENT 'e - entrada / s - sainda / a - ajuste';

ALTER TABLE `miste872_prod`.`tbl_movimentacao_estoque`   
  ADD COLUMN `data_movimentacao` DATETIME NULL AFTER `qtde_movimentacao`;

ALTER TABLE `miste872_prod`.`tbl_estoque`   
  ADD  UNIQUE INDEX `UK_LP` (`id_loja`, `id_produto`);
