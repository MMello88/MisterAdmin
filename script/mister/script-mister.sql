CREATE TABLE `miste872_prod`.`mister_banco`(  
  `id_banco` INT(11) NOT NULL AUTO_INCREMENT,
  `banco` ENUM('Oracle','SQL Server','Mysql') NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `miste872_prod`.`mister_tipo_coluna`(  
  `id_tipo_coluna` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('Char','Date','DateTime','Decimal','Float','Int','Enum','Numeric','LongText','Text','Varchar','Number','Varchar2','nVarchar','Blob') NOT NULL,
  `id_banco` INT NOT NULL,
  PRIMARY KEY (`id_tipo_coluna`),
  CONSTRAINT `FK_TIPO_COLUNA_BANCO` FOREIGN KEY (`id_banco`) REFERENCES `miste872_prod`.`mister_banco`(`id_banco`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `miste872_prod`.`mister_tipo_input`(  
  `id_tipo_input` INT(11) NOT NULL AUTO_INCREMENT,
  `display` VARCHAR(50) NOT NULL,
  `type` ENUM('type=\"checkbox\"','type=\"date\"','type=\"datetime-local\"','type=\"number\" step=0.01','type=\"number\" step=0.00001','type=\"number\" step=1','type=\"radio\"','type=\"number\"','type=\"textarea\"','type=\"text\"','type=\"email\"','type=\"password\"', 'type=\"textRich\"') NOT NULL,
  PRIMARY KEY (`id_tipo_input`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `miste872_prod`.`mister_coluna_input`(  
  `id_coluna_input` INT(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_coluna` INT(11) NOT NULL,
  `id_tipo_input` INT(11) NOT NULL,
  PRIMARY KEY (`id_coluna_input`),
  CONSTRAINT `FK_COLUNA_INPUT_1` FOREIGN KEY (`id_tipo_coluna`) REFERENCES `miste872_prod`.`mister_tipo_coluna`(`id_tipo_coluna`),
  CONSTRAINT `FK_COLUNA_INPUT_2` FOREIGN KEY (`id_tipo_input`) REFERENCES `miste872_prod`.`mister_tipo_input`(`id_tipo_input`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO MISTER_BANCO VALUES (NULL,'Oracle'),(NULL,'SQL Server'),(NULL,'Mysql');

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(NULL, 'Char',1), 
	(NULL, 'Date',1), 
	(NULL, 'Date',1), 
	(NULL, 'Number',1), 
	(NULL, 'Number',1), 
	(NULL, 'Number',1), 
	(NULL, 'Char',1), 
	(NULL, 'Number',1), 
	(NULL, 'Blob',1), 
	(NULL, 'Varchar2',1), 
	(NULL, 'Varchar2',1);

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(NULL, 'Char',2), 
	(NULL, 'Date',2), 
	(NULL, 'DateTime',2), 
	(NULL, 'Decimal',2), 
	(NULL, 'Float',2), 
	(NULL, 'Int',2), 
	(NULL, 'nVarchar',2), 
	(NULL, 'Numeric',2), 
	(NULL, 'Text',2), 
	(NULL, 'Varchar',2), 
	(NULL, 'Varchar',2);

INSERT INTO MISTER_TIPO_COLUNA VALUES 
	(NULL, 'Char',3), 
	(NULL, 'Date',3), 
	(NULL, 'DateTime',3), 
	(NULL, 'Decimal',3), 
	(NULL, 'Float',3), 
	(NULL, 'Int',3), 
	(NULL, 'Enum',3), 
	(NULL, 'Numeric',3), 
	(NULL, 'LongText',3), 
	(NULL, 'Text',3), 
	(NULL, 'Varchar',3);

INSERT INTO MISTER_TIPO_INPUT VALUES 
	(NULL,'Verdadeiro ou False','type="checkbox"'),
	(NULL,'Data','type="date"'),
	(NULL,'Data e Hora','type="datetime-local"'),
	(NULL,'Valor Preço','type="number" step=0.01'),
	(NULL,'Valor Científico','type="number" step=0.00001'),
	(NULL,'Valor Inteiro','type="number" step=1'),
	(NULL,'Multipla Escolha','type="radio"'),
	(NULL,'Numeração','type="number"'),
	(NULL,'Texto Rico','type="textRich"'),
	(NULL,'Texto Longo','type="textarea"'),
	(NULL,'Texto','type="text"'),
	(NULL,'E-Mail','type="email"'),
	(NULL,'Password','type="password"');

INSERT INTO MISTER_COLUNA_INPUT VALUE (NULL,56,1),(NULL,57,2),(NULL,58,3),(NULL,59,4),(NULL,60,5),(NULL,61,6),(NULL,62,7),(NULL,63,8),
(NULL,64,9),(NULL,65,10),(NULL,66,11),(NULL,66,12),(NULL,66,13);

SELECT ci.id_coluna_input, tc.tipo, ti.display, ti.type
  FROM mister_coluna_input ci
 INNER JOIN mister_tipo_coluna tc ON (tc.id_tipo_coluna = ci.id_tipo_coluna)
 INNER JOIN mister_tipo_input ti ON (ti.id_tipo_input = ci.id_tipo_input)
 WHERE tc.id_banco = 3 /*Mysql*/