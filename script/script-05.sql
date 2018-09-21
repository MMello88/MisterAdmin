CREATE TABLE `miste872_prod`.`tbl_usuario`(  
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `email` VARCHAR(250) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  `hash` VARCHAR(255) NULL,
  `ativo` CHAR(1) NOT NULL COMMENT 'a - ativo / d - desativado',
  `dt_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `miste872_prod`.`tbl_usuario`   
  ADD COLUMN `telefone` VARCHAR(30) NULL AFTER `dt_cadastro`,
  ADD COLUMN `end_completo` VARCHAR(150) NULL AFTER `telefone`;

CREATE TABLE `miste872_prod`.`tbl_empresa`(  
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `razao_social` VARCHAR(250) NOT NULL,
  `nome_fantasia` VARCHAR(250) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `nr_inscricao_muni` VARCHAR(20),
  `cnae` VARCHAR(250),
  `data_nascimento` DATE,
  `data_abertura` DATE,
  `endereco` VARCHAR(200) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `complemento` VARCHAR(50),
  `bairro` VARCHAR(150) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `municipio` VARCHAR(100) NOT NULL,
  `uf` VARCHAR(10) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`)
);
