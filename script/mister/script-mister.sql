DROP TABLE IF EXISTS `mister_banco`;

CREATE TABLE `miste872_prod`.`mister_banco`(  
  `id_banco` INT(11) NOT NULL AUTO_INCREMENT,
  `banco` ENUM('Oracle','SQL Server','Mysql') NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_tipo_coluna`;

CREATE TABLE `miste872_prod`.`mister_tipo_coluna`(  
  `id_tipo_coluna` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('Char','Date','DateTime','Decimal','Float','Int','Enum','Numeric','LongText','Text','Varchar','Number','Varchar2','nVarchar','Blob') NOT NULL,
  `length` VARCHAR NULL,
  `id_banco` INT NOT NULL,
  PRIMARY KEY (`id_tipo_coluna`),
  CONSTRAINT `FK_TIPO_COLUNA_BANCO` FOREIGN KEY (`id_banco`) REFERENCES `miste872_prod`.`mister_banco`(`id_banco`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_tipo_input`;

CREATE TABLE `miste872_prod`.`mister_tipo_input`(  
  `id_tipo_input` INT(11) NOT NULL AUTO_INCREMENT,
  `display` VARCHAR(50) NOT NULL,
  `type` ENUM('checkbox','date','datetime-local','number step=0.01','number step=0.00001','number step=1','select','number','textArea','text','email','password', 'textRich') NOT NULL,
  PRIMARY KEY (`id_tipo_input`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_coluna_input`;

CREATE TABLE `miste872_prod`.`mister_coluna_input`(  
  `id_coluna_input` INT(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_coluna` INT(11) NOT NULL,
  `id_tipo_input` INT(11) NOT NULL,
  PRIMARY KEY (`id_coluna_input`),
  CONSTRAINT `FK_COLUNA_INPUT_1` FOREIGN KEY (`id_tipo_coluna`) REFERENCES `miste872_prod`.`mister_tipo_coluna`(`id_tipo_coluna`),
  CONSTRAINT `FK_COLUNA_INPUT_2` FOREIGN KEY (`id_tipo_input`) REFERENCES `miste872_prod`.`mister_tipo_input`(`id_tipo_input`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO MISTER_BANCO VALUES (1,'Oracle'),(2,'SQL Server'),(3,'Mysql');

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(1, 'Char',1), 
	(2, 'Date',1), 
	(3, 'Date',1), 
	(4, 'Number',1), 
	(5, 'Number',1), 
	(6, 'Number',1), 
	(7, 'Char',1), 
	(8, 'Number',1), 
	(9, 'Blob',1), 
	(10, 'Varchar2',1), 
	(11, 'Varchar2',1);

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(12, 'Char',2), 
	(13, 'Date',2), 
	(14, 'DateTime',2), 
	(15, 'Decimal',2), 
	(16, 'Float',2), 
	(17, 'Int',2), 
	(18, 'nVarchar',2), 
	(19, 'Numeric',2), 
	(20, 'Text',2), 
	(21, 'Varchar',2), 
	(22, 'Varchar',2);

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(23, 'Char',3), 
	(24, 'Date',3), 
	(25, 'DateTime',3), 
	(26, 'Decimal',3), 
	(27, 'Float',3), 
	(28, 'Int',3), 
	(29, 'Enum',3), 
	(30, 'Numeric',3), 
	(31, 'LongText',3), 
	(32, 'Text',3), 
	(33, 'Varchar',3);

INSERT INTO MISTER_TIPO_INPUT VALUES 
	(1,'Verdadeiro ou False','checkbox'),
	(2,'Data','date'),
	(3,'Data e Hora','datetime-local'),
	(4,'Valor Preço','number step=0.01'),
	(5,'Valor Científico','number step=0.00001'),
	(6,'Valor Inteiro','number step=1'),
	(7,'Opção Escolha','select'),
	(8,'Numeração','number'),
	(9,'Texto Rico','textRich'),
	(10,'Texto Longo','textArea'),
	(11,'Texto','text'),
	(12,'E-Mail','email'),
	(13,'Password','password');

INSERT INTO MISTER_COLUNA_INPUT VALUE (1,23,1),(2,24,2),(3,25,3),(4,26,4),(5,27,5),(6,28,6),(7,29,7),(8,30,8),
(9,31,9),(10,32,10),(11,33,11),(12,33,12),(13,33,13);

SELECT ci.id_coluna_input, tc.tipo, ti.display, ti.type
  FROM mister_coluna_input ci
 INNER JOIN mister_tipo_coluna tc ON (tc.id_tipo_coluna = ci.id_tipo_coluna)
 INNER JOIN mister_tipo_input ti ON (ti.id_tipo_input = ci.id_tipo_input)
 WHERE tc.id_banco = 3 /*Mysql*/

DROP TABLE IF EXISTS `mister_tabela`;

CREATE TABLE `miste872_prod`.`mister_tabela`(  
  `id_tabela` INT(11) NOT NULL AUTO_INCREMENT,
  `tabela` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_tabela`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_coluna`;

CREATE TABLE `miste872_prod`.`mister_coluna`(  
  `id_coluna` INT(11) NOT NULL AUTO_INCREMENT,
  `coluna` VARCHAR(100) NOT NULL,
  `id_tabela` INT(11) NOT NULL,
  `notnull` ENUM('Sim','Não') NOT NULL,
  `primarykey` ENUM('Sim','Não') NOT NULL,
  `id_coluna_input` INT(11) NOT NULL,
  `length` VARCHAR(255),
  PRIMARY KEY (`id_coluna`),
  CONSTRAINT `FK_COLUNA_INPUT_COLUNA` FOREIGN KEY (`id_coluna_input`) REFERENCES `miste872_prod`.`mister_coluna_input`(`id_coluna_input`),
  CONSTRAINT `FK_TABELA_COLUNA` FOREIGN KEY (`id_tabela`) REFERENCES `miste872_prod`.`mister_tabela`(`id_tabela`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_link`;

CREATE TABLE `miste872_prod`.`mister_link`(  
  `id_link` INT(11) NOT NULL,
  `link` VARCHAR(50) NOT NULL,
  `id_tabla` INT(11) NOT NULL,
  `ativo` ENUM('Sim','Não') DEFAULT 'Sim',
  PRIMARY KEY (`id_link`),
  UNIQUE INDEX `UK_LINK` (`link`),
  FOREIGN KEY (`id_tabla`) REFERENCES `miste872_prod`.`mister_tabela`(`id_tabela`)
);

DROP TABLE IF EXISTS `mister_coluna_regra`;

CREATE TABLE `miste872_prod`.`mister_coluna_regra`(  
  `id_coluna_regra` INT(11) NOT NULL AUTO_INCREMENT,
  `id_link` INT(11) NOT NULL,
  `id_coluna` INT(11) NOT NULL,
  `id_tabela` INT(11) NOT NULL,
  `display_column` VARCHAR(80) NOT NULL,
  `rules` VARCHAR(80),
  `default_value` VARCHAR(80),
  `costumer_value` VARCHAR(80),
  `display_grid` ENUM('TRUE','FALSE') NOT NULL,
  PRIMARY KEY (`id_coluna_regra`),
  CONSTRAINT `FK_REGRA_COLUNA` FOREIGN KEY (`id_coluna`) REFERENCES `miste872_prod`.`mister_coluna`(`id_coluna`),
  CONSTRAINT `FK_REGRA_TABELA` FOREIGN KEY (`id_tabela`) REFERENCES `miste872_prod`.`mister_tabela`(`id_tabela`),
  CONSTRAINT `FK_REGRA_LINK` FOREIGN KEY (`id_link`) REFERENCES `miste872_prod`.`mister_link`(`id_link`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;
