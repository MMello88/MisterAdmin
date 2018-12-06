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
  `length` VARCHAR(50) NULL,
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
	(1, 'Char','(1)',1), 
	(2, 'Date','',1), 
	(3, 'Date','',1), 
	(4, 'Number','(17,2)',1), 
	(5, 'Number','(17,7)',1), 
	(6, 'Number','(17)',1), 
	(7, 'Char','(50)',1), 
	(8, 'Number','(17)',1), 
	(9, 'Blob','',1), 
	(10, 'Varchar2','(150)',1), 
	(11, 'Varchar2','(150)',1);

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(12, 'Char','(1)',2), 
	(13, 'Date','',2), 
	(14, 'DateTime','',2), 
	(15, 'Decimal','(17,2)7',2), 
	(16, 'Float','(17,)',2), 
	(17, 'Int','(17)',2), 
	(18, 'nVarchar','(50)',2), 
	(19, 'Numeric','(17)',2), 
	(20, 'Text','',2), 
	(21, 'Varchar','(150)',2), 
	(22, 'Varchar','(150)',2);

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(23, 'Char','(1)',3), 
	(24, 'Date','',3), 
	(25, 'DateTime','',3), 
	(26, 'Decimal','(17,2)',3), 
	(27, 'Float','(17,7)',3), 
	(28, 'Int','(11)',3), 
	(29, 'Char','(50)',3), 
	(30, 'Numeric','(20)',3), 
	(31, 'LongText','',3), 
	(32, 'Text','',3), 
	(33, 'Varchar','(150)',3);

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

SELECT ci.id_coluna_input, CONCAT(tc.tipo,tc.length) tipo, ti.display, ti.type
  FROM mister_coluna_input ci
 INNER JOIN mister_tipo_coluna tc ON (tc.id_tipo_coluna = ci.id_tipo_coluna)
 INNER JOIN mister_tipo_input ti ON (ti.id_tipo_input = ci.id_tipo_input)
 WHERE tc.id_banco = 3; /*Mysql*/

DROP TABLE IF EXISTS `mister_tabela`;

CREATE TABLE `miste872_prod`.`mister_tabela`(  
  `id_tabela` INT(11) NOT NULL AUTO_INCREMENT,
  `tabela` VARCHAR(100) NOT NULL,
  UNIQUE INDEX `UK_TABELA` (`tabela`),
  PRIMARY KEY (`id_tabela`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_coluna`;

CREATE TABLE `miste872_prod`.`mister_coluna`(  
  `id_coluna` INT(11) NOT NULL AUTO_INCREMENT,
  `coluna` VARCHAR(100) NOT NULL,
  `id_tabela` INT(11) NOT NULL,
  `notnull` ENUM('Sim','Nao') NOT NULL,
  `colunachave` ENUM('Pri','Mul') NOT NULL,
  `tabela_ref` VARCHAR(100) NULL,
  `coluna_id_ref` VARCHAR(100) NULL,
  `coluna_ref` VARCHAR(100) NULL,
  `id_coluna_input` INT(11) NOT NULL,
  `length` VARCHAR(255) NULL,
  PRIMARY KEY (`id_coluna`),
  UNIQUE INDEX `UK_COLUNA` (`id_tabela`, `coluna`),
  CONSTRAINT `FK_COLUNA_INPUT_COLUNA` FOREIGN KEY (`id_coluna_input`) REFERENCES `miste872_prod`.`mister_coluna_input`(`id_coluna_input`),
  CONSTRAINT `FK_TABELA_COLUNA` FOREIGN KEY (`id_tabela`) REFERENCES `miste872_prod`.`mister_tabela`(`id_tabela`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_link`;

CREATE TABLE `miste872_prod`.`mister_link`(  
  `id_link` INT(11) NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(50) NOT NULL,
  `id_tabela` INT(11) NOT NULL,
  `ativo` ENUM('Sim','Nao') DEFAULT 'Sim',
  PRIMARY KEY (`id_link`),
  UNIQUE INDEX `UK_LINK` (`link`),
  FOREIGN KEY (`id_tabela`) REFERENCES `miste872_prod`.`mister_tabela`(`id_tabela`)
)ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

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

DROP TABLE IF EXISTS `mister_where`;

CREATE TABLE `miste872_prod`.`mister_where`(  
  `id_where` INT(11) NOT NULL AUTO_INCREMENT,
  `id_link` INT(11) NOT NULL,
  `id_coluna` INT(11) NOT NULL,
  `sinal` VARCHAR(50) NOT NULL,
  `valor` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_where`),
  UNIQUE INDEX `UK_WHERE` (`id_link`, `id_coluna`),
  CONSTRAINT `FK_WHERE_LINK` FOREIGN KEY (`id_link`) REFERENCES `miste872_prod`.`mister_link`(`id_link`),
  CONSTRAINT `FK_WHERE_COLUNA` FOREIGN KEY (`id_coluna`) REFERENCES `miste872_prod`.`mister_coluna`(`id_coluna`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;


/*----------------------------LISTA DE DELETE------------------------------*/
DROP TABLE IF EXISTS `mister_where`;
DROP TABLE IF EXISTS `mister_coluna_regra`;
DROP TABLE IF EXISTS `mister_coluna`;
DROP TABLE IF EXISTS `mister_coluna_input`;
DROP TABLE IF EXISTS `mister_tipo_input`;
DROP TABLE IF EXISTS `mister_tipo_coluna`;
DROP TABLE IF EXISTS `mister_banco`;
DROP TABLE IF EXISTS `mister_link`;
DROP TABLE IF EXISTS `mister_tabela`;
/*----------------------------LISTA DE DELETE------------------------------*/