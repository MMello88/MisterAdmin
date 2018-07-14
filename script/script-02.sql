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

ALTER TABLE `miste872_prod`.`tbl_estoque`   
  DROP COLUMN `qtde_movimento`;

ALTER TABLE `miste872_prod`.`tbl_movimentacao_estoque`   
  ADD COLUMN `id_categoria_produto` INT(11) NOT NULL AFTER `data_movimentacao`,
  ADD CONSTRAINT `FK_MOV_ESTQ_CATG` FOREIGN KEY (`id_categoria_produto`) REFERENCES `miste872_prod`.`tbl_categoria_produto`(`id_categoria_produto`);

ALTER TABLE `miste872_prod`.`tbl_produto`   
  ADD COLUMN `controla_estoque` CHAR(1) NOT NULL  COMMENT 's - sim / n - não' AFTER `imagem`;

ALTER TABLE `miste872_prod`.`tbl_categoria_produto`   
  ADD COLUMN `controla_estoque` CHAR(1) NOT NULL  COMMENT 's - sim / n - não' AFTER `cssClass`;


CREATE TABLE `miste872_prod`.`tbl_produto_categoria`(  
  `id_produto_categoria` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `id_categoria_produto` INT NOT NULL,
  `imagem` VARCHAR(255),
  PRIMARY KEY (`id_produto_categoria`),
  CONSTRAINT `fk_pro_cat_prod` FOREIGN KEY (`id_produto`) REFERENCES `miste872_prod`.`tbl_produto`(`id_produto`),
  CONSTRAINT `fk_pro_cat_cat` FOREIGN KEY (`id_categoria_produto`) REFERENCES `miste872_prod`.`tbl_categoria_produto`(`id_categoria_produto`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO tbl_produto_categoria 
VALUES 
(NULL,1,1,'frito_croquete.png'),
(NULL,1,2,'congelado_croquete.png'),
(NULL,13,3,'mini_cro.png'),
(NULL,13,4,'mini_cro_sem.png'),

(NULL,2,1,'frito_bolinho_carne.png'),
(NULL,2,2,'congelado_bolinho_carne.png'),
(NULL,14,3,'frito_mini_bolinho_carne.jpg'),
(NULL,14,4,'congelado_mini_bolinho_carne.jpg'),

(NULL,3,1,'frito_coxinha.png'),
(NULL,3,2,'congelado_coxinha.png'),
(NULL,15,3,'frito_mini_coxinha.jpg'),
(NULL,15,4,'congelado_mini_coxinha.jpg'),

(NULL,4,1,'frito_enroladinho.png'),
(NULL,4,2,'congelado_enroladinho.png'),
(NULL,16,3,'frito_mini_enroladinho.jpg'),
(NULL,16,4,'congelado_mini_enroladinho.jpg'),

(NULL,5,1,'frito_salsicha.png'),
(NULL,5,2,'congelado_salsicha.png'),
(NULL,17,3,'frito_mini_salsicha.jpg'),
(NULL,17,4,'congelado_mini_salsicha.jpg'),

(NULL,6,1,'frito_kibe.png'),
(NULL,6,2,'congelado_kibe.png'),
(NULL,18,3,'frito_mini_kibe.jpg'),
(NULL,18,4,'congelado_mini_kibe.jpg'),

(NULL,39,3,'frito_mini_bolinha_queijo.jpg'),
(NULL,39,4,'congelado_mini_bolinha_queijo.jpg');

DELETE FROM tbl_item_pedido WHERE id_produto IN (SELECT id_produto FROM tbl_produto WHERE id_produto NOT IN (SELECT id_produto FROM tbl_produto_categoria));

DELETE FROM tbl_valor_produto WHERE id_produto IN (SELECT id_produto FROM tbl_produto WHERE id_produto NOT IN (SELECT id_produto FROM tbl_produto_categoria));

DELETE FROM tbl_produto WHERE id_produto NOT IN (SELECT id_produto FROM tbl_produto_categoria);

ALTER TABLE `miste872_prod`.`tbl_produto`   
  DROP COLUMN `imagem`;

ALTER TABLE `miste872_prod`.`tbl_produto`   
  DROP COLUMN `id_categoria_produto`, 
  DROP INDEX `id_categoria_produto`,
  DROP FOREIGN KEY `tbl_produto_ibfk_1`;

/*
SELECT CONCAT('TRUNCATE TABLE ',table_schema, '.', TABLE_NAME, ';') 
    FROM INFORMATION_SCHEMA.TABLES WHERE table_schema IN ('miste872_prod');
*/

ALTER TABLE `miste872_prod`.`tbl_cart`   
  ADD COLUMN `id_categoria_produto` INT NOT NULL AFTER `id_session`,
  ADD CONSTRAINT `tbl_cart_ibfk_3` FOREIGN KEY (`id_categoria_produto`) REFERENCES `miste872_prod`.`tbl_categoria_produto`(`id_categoria_produto`);

ALTER TABLE `miste872_prod`.`tbl_valor_produto`   
  ADD COLUMN `id_categoria_produto` INT(11) NOT NULL AFTER `tipo_cliente`,
  ADD CONSTRAINT `tbl_valor_produto_ibfk_2` FOREIGN KEY (`id_categoria_produto`) REFERENCES `miste872_prod`.`tbl_categoria_produto`(`id_categoria_produto`);

INSERT INTO tbl_valor_produto 
VALUES
/* fritos */ 
(NULL, 1, '2018-01-01', 3.00, 'c', 1),
(NULL, 1, '2018-01-01', 3.00, 's', 1),
(NULL, 1, '2018-01-01', 2.20, 'r', 1),

(NULL, 2, '2018-01-01', 3.00, 'c', 1),
(NULL, 2, '2018-01-01', 3.00, 's', 1),
(NULL, 2, '2018-01-01', 2.20, 'r', 1),

(NULL, 3, '2018-01-01', 3.00, 'c', 1),
(NULL, 3, '2018-01-01', 3.00, 's', 1),
(NULL, 3, '2018-01-01', 2.20, 'r', 1),

(NULL, 4, '2018-01-01', 3.00, 'c', 1),
(NULL, 4, '2018-01-01', 3.00, 's', 1),
(NULL, 4, '2018-01-01', 2.20, 'r', 1),

(NULL, 5, '2018-01-01', 3.00, 'c', 1),
(NULL, 5, '2018-01-01', 3.00, 's', 1),
(NULL, 5, '2018-01-01', 2.20, 'r', 1),

(NULL, 6, '2018-01-01', 3.00, 'c', 1),
(NULL, 6, '2018-01-01', 3.00, 's', 1),
(NULL, 6, '2018-01-01', 2.20, 'r', 1),

/*congelados*/

(NULL, 1, '2018-01-01', 2.25, 'c', 2),
(NULL, 1, '2018-01-01', 2.50, 's', 2),
(NULL, 1, '2018-01-01', 1.90, 'r', 2),

(NULL, 2, '2018-01-01', 2.25, 'c', 2),
(NULL, 2, '2018-01-01', 2.50, 's', 2),
(NULL, 2, '2018-01-01', 1.90, 'r', 2),

(NULL, 3, '2018-01-01', 2.25, 'c', 2),
(NULL, 3, '2018-01-01', 2.50, 's', 2),
(NULL, 3, '2018-01-01', 1.90, 'r', 2),

(NULL, 4, '2018-01-01', 2.25, 'c', 2),
(NULL, 4, '2018-01-01', 2.50, 's', 2),
(NULL, 4, '2018-01-01', 1.90, 'r', 2),

(NULL, 5, '2018-01-01', 2.25, 'c', 2),
(NULL, 5, '2018-01-01', 2.50, 's', 2),
(NULL, 5, '2018-01-01', 1.90, 'r', 2),

(NULL, 6, '2018-01-01', 2.25, 'c', 2),
(NULL, 6, '2018-01-01', 2.50, 's', 2),
(NULL, 6, '2018-01-01', 1.90, 'r', 2),

/*mini fritos*/

(NULL, 13, '2018-01-01', 0.45, 'c', 3),
(NULL, 13, '2018-01-01', 0.45, 's', 3),
(NULL, 13, '2018-01-01', 0.36, 'r', 3),

(NULL, 14, '2018-01-01', 0.45, 'c', 3),
(NULL, 14, '2018-01-01', 0.45, 's', 3),
(NULL, 14, '2018-01-01', 0.36, 'r', 3),

(NULL, 15, '2018-01-01', 0.45, 'c', 3),
(NULL, 15, '2018-01-01', 0.45, 's', 3),
(NULL, 15, '2018-01-01', 0.36, 'r', 3),

(NULL, 16, '2018-01-01', 0.45, 'c', 3),
(NULL, 16, '2018-01-01', 0.45, 's', 3),
(NULL, 16, '2018-01-01', 0.36, 'r', 3),

(NULL, 17, '2018-01-01', 0.45, 'c', 3),
(NULL, 17, '2018-01-01', 0.45, 's', 3),
(NULL, 17, '2018-01-01', 0.36, 'r', 3),

(NULL, 18, '2018-01-01', 0.45, 'c', 3),
(NULL, 18, '2018-01-01', 0.45, 's', 3),
(NULL, 18, '2018-01-01', 0.36, 'r', 3),

(NULL, 39, '2018-01-01', 0.45, 'c', 3),
(NULL, 39, '2018-01-01', 0.45, 's', 3),
(NULL, 39, '2018-01-01', 0.36, 'r', 3),

/* MINI CONGELADOS */

(NULL, 13, '2018-01-01', 0.40, 'c', 4),
(NULL, 13, '2018-01-01', 0.40, 's', 4),
(NULL, 13, '2018-01-01', 0.35, 'r', 4),

(NULL, 14, '2018-01-01', 0.40, 'c', 4),
(NULL, 14, '2018-01-01', 0.40, 's', 4),
(NULL, 14, '2018-01-01', 0.35, 'r', 4),

(NULL, 15, '2018-01-01', 0.40, 'c', 4),
(NULL, 15, '2018-01-01', 0.40, 's', 4),
(NULL, 15, '2018-01-01', 0.35, 'r', 4),

(NULL, 16, '2018-01-01', 0.40, 'c', 4),
(NULL, 16, '2018-01-01', 0.40, 's', 4),
(NULL, 16, '2018-01-01', 0.35, 'r', 4),

(NULL, 17, '2018-01-01', 0.40, 'c', 4),
(NULL, 17, '2018-01-01', 0.40, 's', 4),
(NULL, 17, '2018-01-01', 0.35, 'r', 4),

(NULL, 18, '2018-01-01', 0.40, 'c', 4),
(NULL, 18, '2018-01-01', 0.40, 's', 4),
(NULL, 18, '2018-01-01', 0.35, 'r', 4),

(NULL, 39, '2018-01-01', 0.40, 'c', 4),
(NULL, 39, '2018-01-01', 0.40, 's', 4),
(NULL, 39, '2018-01-01', 0.35, 'r', 4);