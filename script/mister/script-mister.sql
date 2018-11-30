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
  `id_banco` INT NOT NULL,
  PRIMARY KEY (`id_tipo_coluna`),
  CONSTRAINT `FK_TIPO_COLUNA_BANCO` FOREIGN KEY (`id_banco`) REFERENCES `miste872_prod`.`mister_banco`(`id_banco`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `mister_tipo_input`;

CREATE TABLE `miste872_prod`.`mister_tipo_input`(  
  `id_tipo_input` INT(11) NOT NULL AUTO_INCREMENT,
  `display` VARCHAR(50) NOT NULL,
  `type` ENUM('type=\"checkbox\"','type=\"date\"','type=\"datetime-local\"','type=\"number\" step=0.01','type=\"number\" step=0.00001','type=\"number\" step=1','type=\"radio\"','type=\"number\"','type=\"textarea\"','type=\"text\"','type=\"email\"','type=\"password\"', 'type=\"textRich\"') NOT NULL,
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
	(1,'Verdadeiro ou False','type="checkbox"'),
	(2,'Data','type="date"'),
	(3,'Data e Hora','type="datetime-local"'),
	(4,'Valor Preço','type="number" step=0.01'),
	(5,'Valor Científico','type="number" step=0.00001'),
	(6,'Valor Inteiro','type="number" step=1'),
	(7,'Multipla Escolha','type="radio"'),
	(8,'Numeração','type="number"'),
	(9,'Texto Rico','type="textRich"'),
	(10,'Texto Longo','type="textarea"'),
	(11,'Texto','type="text"'),
	(12,'E-Mail','type="email"'),
	(13,'Password','type="password"');

INSERT INTO MISTER_COLUNA_INPUT VALUE (1,23,1),(2,24,2),(3,25,3),(4,26,4),(5,27,5),(6,28,6),(7,29,7),(8,30,8),
(9,31,9),(10,32,10),(11,33,11),(12,33,12),(13,33,13);

SELECT ci.id_coluna_input, tc.tipo, ti.display, ti.type
  FROM mister_coluna_input ci
 INNER JOIN mister_tipo_coluna tc ON (tc.id_tipo_coluna = ci.id_tipo_coluna)
 INNER JOIN mister_tipo_input ti ON (ti.id_tipo_input = ci.id_tipo_input)
 WHERE tc.id_banco = 3 /*Mysql*/