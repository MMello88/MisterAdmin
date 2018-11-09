/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.6.41-84.1 : Database - miste872_prod
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`miste872_prod` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `miste872_prod`;

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ci_sessions` */

LOCK TABLES `ci_sessions` WRITE;

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('dd17ff9efcd47c729bdabbeb63defb417feefdff','189.5.226.39',1540836718,'__ci_last_regenerate|i:1540836436;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('2da817f1e7fdccba34f95843f94482a4813eeb86','189.5.226.39',1540841457,'__ci_last_regenerate|i:1540841456;');

UNLOCK TABLES;

/*Table structure for table `tbl_afazer` */

DROP TABLE IF EXISTS `tbl_afazer`;

CREATE TABLE `tbl_afazer` (
  `id_afazer` int(11) NOT NULL AUTO_INCREMENT,
  `afazer` varchar(255) NOT NULL,
  `dt_inicio` date NOT NULL,
  `dt_fim` date DEFAULT NULL,
  `realizado` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_afazer`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_afazer` */

LOCK TABLES `tbl_afazer` WRITE;

insert  into `tbl_afazer`(`id_afazer`,`afazer`,`dt_inicio`,`dt_fim`,`realizado`) values (3,'Conquistar Novos Clientes','2018-07-16',NULL,'n'),(4,'Bolsa Termina','2018-07-16','2018-07-18','s'),(5,'Ligar para o Peixe Urbano / Grupon / Ifood','2018-07-23','2018-07-24','s'),(6,'Iniciar a Panfletagem para o comercio local','2018-07-23',NULL,'n'),(7,'Melhoria do Site... Dar desconto de 15% na primeira compra realizada através do site','2018-07-23','2018-07-27','n'),(8,'Coxinha, B. Queijo, Enroladinho e Kibe. 150 de cada. Sabádo entregar as 16h. Cliente Cristina. Endereço Florinda Bordizan Sampaio, 300. Bairro José Sampaio. Telefone de Contato 016 9922553180','2018-08-11','2018-08-11','s'),(9,'Buffet Infantil Pintando o 7 - Av Santa Luzia 763. Horário 16h Quarta Feira - ','2018-08-14','2018-08-15','s'),(10,'In festa Buffet - Rua Altino arantes 959 Telefone 3021-7139','2018-08-14','2018-08-15','s'),(11,'Cipó Carimbó - Visc. De Abaté 701 Telefone 3637-1092 Quinta feira a tarde. E-mail contato@cipocarimbo.com.br','2018-08-14','2018-08-15','s'),(12,'Pedido da Adriana para hoje, 75 coxinha, 75 enroladinho, 50 b. queijo / Entregar na  R. Leonardo Gonçalves, 350, Jd. Interlagos. Bloco B1 ap 202. Telefone de contato 992356648. horário de entrega as 19h. cod 8605 peixe urbano','2018-08-29','2018-08-29','s'),(13,'Sábado 400 salgadinhos peixe urbano / As 17h Matheus 016 981881003 / 100-B.Queijo;100-Coxiinha;100-Enroladinho;100-Salsicha','2018-09-07','2018-09-07','n');

UNLOCK TABLES;

/*Table structure for table `tbl_arquivo_controller` */

DROP TABLE IF EXISTS `tbl_arquivo_controller`;

CREATE TABLE `tbl_arquivo_controller` (
  `arquivo_controller_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_controller` varchar(80) NOT NULL,
  `diretorio` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`arquivo_controller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_arquivo_controller` */

LOCK TABLES `tbl_arquivo_controller` WRITE;

insert  into `tbl_arquivo_controller`(`arquivo_controller_id`,`nome_controller`,`diretorio`) values (1,'MyDashboard',NULL);

UNLOCK TABLES;

/*Table structure for table `tbl_cart` */

DROP TABLE IF EXISTS `tbl_cart`;

CREATE TABLE `tbl_cart` (
  `id_cart` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Carts',
  `id_session` varchar(255) NOT NULL,
  `id_categoria_produto` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `id_cidade` int(11) DEFAULT NULL COMMENT 'Cidades',
  `qtde` decimal(6,0) NOT NULL,
  `valor_unitario` decimal(6,2) NOT NULL,
  `situacao` char(1) NOT NULL COMMENT 'a - aberto / f - fechado',
  `cod_promo` char(1) DEFAULT '0' COMMENT 'usou cod promo 1 - true / 0 - false',
  PRIMARY KEY (`id_cart`),
  KEY `id_produto` (`id_produto`),
  KEY `id_cidade` (`id_cidade`),
  KEY `tbl_cart_ibfk_3` (`id_categoria_produto`),
  CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`),
  CONSTRAINT `tbl_cart_ibfk_2` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`),
  CONSTRAINT `tbl_cart_ibfk_3` FOREIGN KEY (`id_categoria_produto`) REFERENCES `tbl_categoria_produto` (`id_categoria_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_cart` */

LOCK TABLES `tbl_cart` WRITE;

insert  into `tbl_cart`(`id_cart`,`id_session`,`id_categoria_produto`,`id_produto`,`id_cidade`,`qtde`,`valor_unitario`,`situacao`,`cod_promo`) values (224,'0172ba6e93a7b45bb2d18d04faa6a2bc',3,14,1,10,0.45,'d','0'),(225,'0172ba6e93a7b45bb2d18d04faa6a2bc',3,15,1,10,0.45,'d','0'),(226,'0172ba6e93a7b45bb2d18d04faa6a2bc',4,17,1,10,0.40,'d','0'),(227,'0172ba6e93a7b45bb2d18d04faa6a2bc',4,18,1,10,0.40,'d','0'),(228,'9e07964293ba71e79db068232579bccd',3,14,1,20,0.45,'d','0'),(229,'9e07964293ba71e79db068232579bccd',3,15,1,10,0.45,'d','0'),(231,'9e07964293ba71e79db068232579bccd',4,17,1,20,0.40,'d','0'),(232,'e03a97c630727cb5951bfbad82b3c725',3,14,1,10,0.45,'a','0'),(233,'e03a97c630727cb5951bfbad82b3c725',4,14,1,10,0.40,'a','0'),(234,'e03a97c630727cb5951bfbad82b3c725',3,15,1,10,0.45,'a','0'),(235,'6f5ca806c331eb6d3fdb40f67fab7fe9',3,15,1,50,0.45,'d','0'),(236,'6f5ca806c331eb6d3fdb40f67fab7fe9',3,39,1,50,0.45,'d','0'),(237,'0fb0c49b89b23abb3827c28219daa862',3,14,1,10,0.45,'a','0'),(238,'284c6f157d9425026444a02de8b6d795',3,14,1,10,0.45,'d','0'),(239,'284c6f157d9425026444a02de8b6d795',3,16,1,10,0.45,'d','0'),(240,'3b36c670ac768f05878c4c1ce07dd0ed',3,14,1,30,0.45,'a','0'),(241,'a6226dd98570fa72b9f105967e94c9ea',3,14,1,20,0.45,'d','0'),(242,'4503752926e21359aa216e6aa7bb1384',3,14,1,20,0.45,'d','0'),(243,'8aaf31c0582bc3b88cb3eca532bb9b0f',4,16,1,20,0.40,'a','0'),(244,'8aaf31c0582bc3b88cb3eca532bb9b0f',4,14,1,10,0.40,'a','0'),(245,'8aaf31c0582bc3b88cb3eca532bb9b0f',4,39,1,10,0.40,'a','0'),(246,'8aaf31c0582bc3b88cb3eca532bb9b0f',4,17,1,10,0.40,'a','0'),(247,'8aaf31c0582bc3b88cb3eca532bb9b0f',4,15,1,10,0.40,'a','0'),(248,'af1767cdf1aeb3da12a0f1e0861d565e',3,17,1,40,0.45,'a','0'),(251,'ce7db34f66f6ceb61d9ca3a4704260b2',3,14,1,10,0.45,'a','0'),(252,'ce7db34f66f6ceb61d9ca3a4704260b2',3,18,1,10,0.45,'a','0'),(253,'ce7db34f66f6ceb61d9ca3a4704260b2',3,15,1,10,0.45,'a','0'),(254,'72ce5a08d414d0a9ad7f8c9b68a56532',3,16,1,10,0.45,'a','0'),(255,'72ce5a08d414d0a9ad7f8c9b68a56532',3,18,1,10,0.45,'a','0'),(256,'72ce5a08d414d0a9ad7f8c9b68a56532',3,15,1,10,0.45,'a','0'),(257,'72ce5a08d414d0a9ad7f8c9b68a56532',3,17,1,10,0.45,'a','0'),(258,'72ce5a08d414d0a9ad7f8c9b68a56532',3,39,1,10,0.45,'a','0'),(259,'044ebaf7d511bad661116a3182a3355a',4,15,1,10,0.40,'a','0'),(260,'044ebaf7d511bad661116a3182a3355a',4,17,1,10,0.40,'a','0'),(261,'044ebaf7d511bad661116a3182a3355a',4,39,1,10,0.40,'a','0'),(262,'044ebaf7d511bad661116a3182a3355a',4,16,1,10,0.40,'a','0'),(263,'f0e71d54d18b5be0ae367f83c7fdc95f',3,16,1,20,0.45,'a','0'),(264,'f0e71d54d18b5be0ae367f83c7fdc95f',3,17,1,10,0.45,'a','0'),(265,'f0e71d54d18b5be0ae367f83c7fdc95f',4,14,1,100,0.40,'a','0'),(268,'172332d88b1d5b9b1d2c55237326ce67',3,15,1,40,0.45,'a','0'),(269,'172332d88b1d5b9b1d2c55237326ce67',3,39,1,40,0.45,'a','0'),(270,'1bba306b10cc61e1c006cb832750350e',3,16,1,10,0.45,'a','0');

UNLOCK TABLES;

/*Table structure for table `tbl_categoria_produto` */

DROP TABLE IF EXISTS `tbl_categoria_produto`;

CREATE TABLE `tbl_categoria_produto` (
  `id_categoria_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CategoriasProduto',
  `nome` varchar(250) NOT NULL,
  `situacao` char(1) NOT NULL COMMENT 'a - ativo / d - desativado',
  `cssClass` varchar(150) NOT NULL,
  `controla_estoque` char(1) NOT NULL COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_categoria_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Categorias do Produto';

/*Data for the table `tbl_categoria_produto` */

LOCK TABLES `tbl_categoria_produto` WRITE;

insert  into `tbl_categoria_produto`(`id_categoria_produto`,`nome`,`situacao`,`cssClass`,`controla_estoque`) values (1,'Salgados','d','frito',''),(2,'Congelados','d','congelado',''),(3,'Mini Salgados','a','mini-frito',''),(4,'Mini Congelado','a','mini-congelado',''),(5,'Refrigerante','d','refrigerante',''),(6,'Sucos','d','suco',''),(7,'Doces','d','doce',''),(8,'Promoções','d','promocao',''),(9,'Festa','d','festa',''),(10,'Bandeja','d','bandeja','');

UNLOCK TABLES;

/*Table structure for table `tbl_cidade` */

DROP TABLE IF EXISTS `tbl_cidade`;

CREATE TABLE `tbl_cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cidades',
  `nome` varchar(150) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `link` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Cidades';

/*Data for the table `tbl_cidade` */

LOCK TABLES `tbl_cidade` WRITE;

insert  into `tbl_cidade`(`id_cidade`,`nome`,`uf`,`link`) values (1,'Ribeirão Preto','SP','ribeirao-preto'),(2,'Pontal','SP','pontal'),(3,'Vitrine','','');

UNLOCK TABLES;

/*Table structure for table `tbl_cidade_categoria` */

DROP TABLE IF EXISTS `tbl_cidade_categoria`;

CREATE TABLE `tbl_cidade_categoria` (
  `id_cidade_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` int(11) NOT NULL,
  `id_categoria_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_cidade_categoria`),
  UNIQUE KEY `UK_CIDADE_CTEG` (`id_cidade`,`id_categoria_produto`),
  KEY `FK_CIDADE_CATEG_CATEG` (`id_categoria_produto`),
  CONSTRAINT `FK_CIDADE_CATEG_CATEG` FOREIGN KEY (`id_categoria_produto`) REFERENCES `tbl_categoria_produto` (`id_categoria_produto`),
  CONSTRAINT `FK_CIDADE_CATEG_CIDADE` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cidade_categoria` */

LOCK TABLES `tbl_cidade_categoria` WRITE;

insert  into `tbl_cidade_categoria`(`id_cidade_categoria`,`id_cidade`,`id_categoria_produto`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,3),(6,2,4),(7,3,1),(8,3,2),(9,3,3),(10,3,4);

UNLOCK TABLES;

/*Table structure for table `tbl_cliente` */

DROP TABLE IF EXISTS `tbl_cliente`;

CREATE TABLE `tbl_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clientes',
  `nome` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(150) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `situacao` char(1) DEFAULT NULL COMMENT 'a - ativo / d - desativado',
  `tipo` char(1) DEFAULT NULL COMMENT 'c - cliente / r - revendedor / s - representante / p - parceiro',
  `ganho_unitario` decimal(2,2) DEFAULT NULL COMMENT 'Somente revendedor e representando vai ter este campo habilitado',
  `cpf_cnpj` varchar(14) DEFAULT NULL COMMENT 'cpf ou cnpj',
  `hash` varchar(255) DEFAULT NULL COMMENT 'id criptografado',
  `ativo` char(1) DEFAULT '0' COMMENT '1 - true / 0 false',
  `id_cidade` int(11) DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `FK_CIENTE_CIDADE` (`id_cidade`),
  CONSTRAINT `FK_CIENTE_CIDADE` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Cliente';

/*Data for the table `tbl_cliente` */

LOCK TABLES `tbl_cliente` WRITE;

insert  into `tbl_cliente`(`id_cliente`,`nome`,`email`,`senha`,`telefone`,`endereco`,`numero`,`bairro`,`complemento`,`situacao`,`tipo`,`ganho_unitario`,`cpf_cnpj`,`hash`,`ativo`,`id_cidade`,`dt_cadastro`) values (10,'Fernanda Lujan Torolio gonzalez','ferlujangom@hotmail.com','','11988775176','Av do café 1149 bl B ap 103','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(11,'Juliana Roberta Verissimo','julianarverissimo@gmail.com','','16992155377','Rua Monte Santo, 324','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(12,'ANA CAROLINA TASCHETI','taschetty@hotmail.com','','16 99247-4154','macario da silva ribeiro 99','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(13,'Carol','carolynebrito3@gmail.com','','16 99161-2326','Rua Paraguaçu Paulista 137','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(14,'Alfredo souza','alfredosouza2012@bol.com.br','','16992839989','Rua Antônio Martinez, 222','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(15,'Jessica','jessicamylove47@hotmail.com','','16991676217','Macir ramazini 2462','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(22,'MATHEUS DE MELLO','matheus.gnu@gmail.com','e3bcdf1347b79080238afbe758cf103d','16991838523','Av. Plínio Castro Prado 431, Apto 33','1000','centro',NULL,'a','c',0.00,NULL,NULL,'1',NULL,NULL),(23,'valeria loppi simoes de abreu oliveira','valeria.loppi26@gmail.com','6464248e8460c1f803c4ea1d8867652b','199971156160','av presidente vargs','1617','JARDIM IRAJA','loja 02 -loja mais natural','a','c',0.00,NULL,NULL,'1',NULL,NULL),(24,'Leonardo Patricio','nosferaturaiu@gmail.com','dad96e9e0dfe82c0deda5673e539b96f','16993758806','Vicente Della Ricci','30','Geraldo de Carvalho','30','a','c',0.00,NULL,'1ff1de774005f8da13f42943881c655f',NULL,NULL,NULL),(25,'Micael Monteiro','Mica__pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo Horizonte',NULL,'a','c',0.00,NULL,'8e296a067a37563370ded05f5a3bf3ec',NULL,NULL,NULL),(26,'Micael monteiro','mica_pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo horizonte',NULL,'a','c',0.00,NULL,NULL,'1',NULL,NULL),(27,'Giovana Aparecida Prates Gomes','girubi@hotmail.com','55839f37aeb0094224f0ae502ee52314','016 99244-2083','Rua João Jainto Tavares','219','Planalto Verde',NULL,'a','c',0.00,NULL,'','1',NULL,NULL),(30,'rogerio machado','engrmachado@gmail.com','d2fd6344e886b3c5eff66ea99b4f1027','16991352685',NULL,NULL,NULL,NULL,'a','c',0.00,NULL,NULL,'1',NULL,'2018-07-24 18:18:07'),(31,'Agatha koga moreno machado','agatha.francis2@gmail.com','9af670ad8ce624ec0e9d10531622a2ff','16o93482200',NULL,NULL,NULL,NULL,'a','c',0.00,NULL,NULL,'1',NULL,'2018-07-27 09:36:28'),(32,'MAIARA LIMA JOAQUIM','maiaralima34@hotmail.com','ec3bff394cb4ff4db9b24fb02c8b5f36','16992769491',NULL,NULL,NULL,NULL,'a','c',0.00,NULL,NULL,'1',NULL,'2018-08-14 14:34:25'),(33,'Giovanni Cassemiro da cruz','giovani26dacruz@hotmail.com','55494950da5de3946da21a7e74d724a3','16988747599',NULL,NULL,NULL,NULL,'a','c',0.00,NULL,NULL,'1',NULL,'2018-09-02 15:04:04'),(34,'POSTO MONTE CARLO II','adm.postocurio@gmail.com','b9993ab25e0545634fe80c1a76a9c912','1692276995','Av. Presidente Vargas','1211','Jardim América','Posto','a','r',0.00,'05283897000121','e369853df766fa44e1ed0ff613f563bd','1',NULL,'2018-09-06 14:46:31'),(35,'Barossi Cafeteria LTDA','barrossi@gmail.com','08aeb5000690be8735be1254e97642f5','01639411117','Rua Olavo Bilac','900','Vila Seixas',NULL,'a','r',0.00,'05659176000173','1c383cd30b7c298ab50293adfecb7b18',NULL,NULL,'2018-09-13 12:35:37'),(36,'Daniela Fidelis da Silva','daniela_fidelis@gmail.com','79bd73b9ad5c2b98a2e8ee5078f7ce63','016981200867','Rua Américo Brasiliense','306','Centro',NULL,'a','r',0.00,'28514968000155','19ca14e7ea6328a42e0eb13d585e4c22',NULL,NULL,'2018-09-13 14:59:59'),(37,'Be & So Cafe','ju_cont@yahoo.com.br','720564f10ab6f4ca5b6e90e73a36b3a0','1639412532',' Visconde De Inhauma','463','Centro','Rogerio','a','r',0.00,'22665924000140','a5bfc9e07964f8dddeb95fc584cd965d',NULL,NULL,'2018-09-17 08:39:16'),(38,'Stefani Cristina Correia','stefani_cristinasilva@hotmail.com','4e6ffb14fe664c7eb343c163ccd42430','16992180339',NULL,NULL,NULL,NULL,'a','c',0.00,NULL,'a5771bce93e200c36f7cd9dfd0e5deaa',NULL,NULL,'2018-10-14 18:22:01');

UNLOCK TABLES;

/*Table structure for table `tbl_conta_corrente` */

DROP TABLE IF EXISTS `tbl_conta_corrente`;

CREATE TABLE `tbl_conta_corrente` (
  `id_conta_corrente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_conta_corrente` varchar(150) NOT NULL,
  `interna` char(1) NOT NULL,
  `banco` varchar(10) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `digito_ag` varchar(5) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `digito_cc` varchar(5) DEFAULT NULL,
  `principal` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  `ativo` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_conta_corrente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_conta_corrente` */

LOCK TABLES `tbl_conta_corrente` WRITE;

insert  into `tbl_conta_corrente`(`id_conta_corrente`,`nome_conta_corrente`,`interna`,`banco`,`agencia`,`digito_ag`,`conta_corrente`,`digito_cc`,`principal`,`ativo`) values (1,'Itau 18080','S','49','8011',NULL,'18080','2','s','a');

UNLOCK TABLES;

/*Table structure for table `tbl_conta_gerencial` */

DROP TABLE IF EXISTS `tbl_conta_gerencial`;

CREATE TABLE `tbl_conta_gerencial` (
  `id_conta_gerencial` int(11) NOT NULL AUTO_INCREMENT,
  `nome_conta_gerencial` varchar(150) NOT NULL,
  `tipo_conta` char(1) NOT NULL COMMENT 'e - entrada / s - saída',
  `id_conta_dre` char(10) DEFAULT NULL,
  `cc_debito` varchar(15) DEFAULT NULL,
  `cc_credito` varchar(15) DEFAULT NULL,
  `permite_compras` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  `ativo` char(1) DEFAULT NULL COMMENT 'a - ativo / d - desativado',
  PRIMARY KEY (`id_conta_gerencial`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_conta_gerencial` */

LOCK TABLES `tbl_conta_gerencial` WRITE;

insert  into `tbl_conta_gerencial`(`id_conta_gerencial`,`nome_conta_gerencial`,`tipo_conta`,`id_conta_dre`,`cc_debito`,`cc_credito`,`permite_compras`,`ativo`) values (1,'Abatimentos','s','','','','n','a'),(2,'Água','s','190','','','n','a'),(3,'Aluguel','s','182','','','n','a'),(4,'Aluguel de Equipamentos','s','185','','','n','a'),(5,'Amortização de Empréstimos','s','184','','','n','a'),(6,'as e Equipamentos Próprios','s','185','','','n','a'),(7,'Benefícios Salariais','s','187','','','n','a'),(8,'Brindes','s','189','','','n','a'),(9,'Combustível e Pedágios','s','185','','','n','a'),(10,'Comissão de Vendas','s','187','','','n','a'),(11,'Condomínio','s','182','','','n','a'),(12,'Contabilidade','s','185','','','n','a'),(13,'Devoluções','s','186','','','n','a'),(14,'Embalagem','s','183','','','n','a'),(15,'Encargos Salariais','s','187','','','n','a'),(16,'Eventos','s','189','','','n','a'),(17,'Frete','s','185','','','n','a'),(18,'Honorários Advocatícios','s','185','','','n','a'),(19,'Impostos','s','186','','','n','a'),(20,'Internet','s','190','','','n','a'),(21,'IPTU','s','182','','','n','a'),(22,'Juros de Empréstimos','s','184','','','n','a'),(23,'Limpeza','s','185','','','n','a'),(24,'Luz','s','190','','','n','a'),(25,'Manutenção','s','185','','','n','a'),(26,'Material de Escritório','s','185','','','n','a'),(27,'Matéria-Prima','s','183','','','n','a'),(28,'Mercadoria para Revenda','s','183','','','n','a'),(29,'Outras Despesas','s','','','','n','a'),(30,'Outras Despesas','s','','','','n','a'),(31,'PAGAMENTO A FORNECEDOR','s','183','','','n','a'),(33,'Propaganda','s','189','','','n','a'),(34,'Salários','s','187','','','n','a'),(35,'SALGADERIA CASTRO','s','183','','','n','a'),(36,'Segurança','s','185','','','n','a'),(37,'Seguros em Geral','s','185','','','n','a'),(38,'Serviços de Entrega','s','185','','','n','a'),(39,'Tarifas Bancárias','s','184','','','n','a'),(40,'Telefone Celular','s','190','','','n','a'),(41,'Telefone Fixo','s','190','','','n','a'),(42,'Transferência','s','185','','','n','a'),(43,'TV a Cabo','s','190','','','n','a'),(44,'Viagem e Hospedagem','s','185','','','n','a'),(45,'Aportes ou Empréstimos','E','191','','','n','a'),(46,'Outras Receitas','E','','','','n','a'),(47,'Outras Receitas','E','','','','n','a'),(48,'Rendimentos de Aplicação Bancária','E','191','','','n','a'),(49,'Transferência','E','192','','','n','a'),(50,'Vendas via Loja Virtual','E','192','','','n','a'),(51,'Vendas via PDV','E','192','','','n','a'),(52,'Vendas via Pedido','E','192','','','n','a');

UNLOCK TABLES;

/*Table structure for table `tbl_contas_apagar` */

DROP TABLE IF EXISTS `tbl_contas_apagar`;

CREATE TABLE `tbl_contas_apagar` (
  `id_contas_apagar` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` date NOT NULL,
  `id_conta_gerencial` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_documento` int(11) DEFAULT NULL COMMENT 'deixar desativado',
  `dt_venc` date NOT NULL,
  `valor_apagar` decimal(7,2) NOT NULL,
  `dt_pago` date DEFAULT NULL,
  `id_conta_corrente` int(11) DEFAULT NULL,
  `valor_pgto` decimal(7,2) DEFAULT NULL,
  `valor_desconto` decimal(7,2) DEFAULT NULL,
  `valor_juros` decimal(7,2) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `conta_fixa` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  `situacao` char(1) DEFAULT NULL COMMENT 'a - aberto / p - pago',
  `tipo_pagamento` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_contas_apagar`),
  KEY `FK_CONTAS_APAGAR_FORNECEDOR` (`id_fornecedor`),
  KEY `FK_CONTAS_APAGAR_CONTA_GERENECIAL` (`id_conta_gerencial`),
  KEY `FK_CONTAS_APAGAR_CONTA_CORRENTE` (`id_conta_corrente`),
  CONSTRAINT `FK_CONTAS_APAGAR_CONTA_CORRENTE` FOREIGN KEY (`id_conta_corrente`) REFERENCES `tbl_conta_corrente` (`id_conta_corrente`),
  CONSTRAINT `FK_CONTAS_APAGAR_CONTA_GERENECIAL` FOREIGN KEY (`id_conta_gerencial`) REFERENCES `tbl_conta_gerencial` (`id_conta_gerencial`),
  CONSTRAINT `FK_CONTAS_APAGAR_FORNECEDOR` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_contas_apagar` */

LOCK TABLES `tbl_contas_apagar` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_contas_areceber` */

DROP TABLE IF EXISTS `tbl_contas_areceber`;

CREATE TABLE `tbl_contas_areceber` (
  `id_contas_areceber` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` date NOT NULL,
  `id_conta_gerencial` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_documento` int(11) DEFAULT NULL COMMENT 'deixar desativado',
  `dt_venc` date NOT NULL,
  `valor_areceber` decimal(7,2) NOT NULL,
  `dt_recebido` date DEFAULT NULL,
  `id_conta_corrente` int(11) DEFAULT NULL,
  `valor_recebido` decimal(7,2) DEFAULT NULL,
  `valor_desconto` decimal(7,2) DEFAULT NULL,
  `valor_juros` decimal(7,2) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `conta_fixa` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  `situacao` char(1) DEFAULT NULL COMMENT 'a - aberto / r - recebido',
  `tipo_recebimento` varchar(11) DEFAULT NULL,
  `nr_vezes` char(4) DEFAULT NULL COMMENT '1x/2x/3x/4x ...',
  PRIMARY KEY (`id_contas_areceber`),
  KEY `FK_CONTAS_ARECEBER_CONTA_CORRENTE` (`id_conta_corrente`),
  KEY `FK_CONTAS_ARECEBER_CONTA_GERENECIAL` (`id_conta_gerencial`),
  KEY `FK_CONTAS_ARECEBER_FORNECEDOR` (`id_fornecedor`),
  CONSTRAINT `FK_CONTAS_ARECEBER_CONTA_CORRENTE` FOREIGN KEY (`id_conta_corrente`) REFERENCES `tbl_conta_corrente` (`id_conta_corrente`),
  CONSTRAINT `FK_CONTAS_ARECEBER_CONTA_GERENECIAL` FOREIGN KEY (`id_conta_gerencial`) REFERENCES `tbl_conta_gerencial` (`id_conta_gerencial`),
  CONSTRAINT `FK_CONTAS_ARECEBER_FORNECEDOR` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_contas_areceber` */

LOCK TABLES `tbl_contas_areceber` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_endereco` */

DROP TABLE IF EXISTS `tbl_endereco`;

CREATE TABLE `tbl_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(250) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(150) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `principal` char(1) NOT NULL COMMENT 's - sim / n - não',
  `id_cliente` int(11) DEFAULT NULL,
  `id_cidade` int(11) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `FK_ENDERECO_CLIENTE` (`id_cliente`),
  KEY `FK_ENDERECO_CIDADE` (`id_cidade`),
  CONSTRAINT `FK_ENDERECO_CIDADE` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`),
  CONSTRAINT `FK_ENDERECO_CLIENTE` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_endereco` */

LOCK TABLES `tbl_endereco` WRITE;

insert  into `tbl_endereco`(`id_endereco`,`endereco`,`numero`,`bairro`,`complemento`,`cep`,`principal`,`id_cliente`,`id_cidade`) values (2,'prudente morais','532','centro','01','14015100','s',22,1),(3,'rua arnaldo victaliano ','130','jd palmas travassos ','apto 402','14091220','s',30,1),(4,'Rua Marechal Rondon','611','Jd Piratininga',NULL,'14020220','s',32,1);

UNLOCK TABLES;

/*Table structure for table `tbl_error_log_db` */

DROP TABLE IF EXISTS `tbl_error_log_db`;

CREATE TABLE `tbl_error_log_db` (
  `id_error_log_db` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Error_logs_db',
  `error` varchar(2000) NOT NULL,
  `QUERY` varchar(500) NOT NULL,
  `class` varchar(150) NOT NULL,
  `dt_erro` datetime NOT NULL,
  PRIMARY KEY (`id_error_log_db`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Tabela de log para erros na consulta da database';

/*Data for the table `tbl_error_log_db` */

LOCK TABLES `tbl_error_log_db` WRITE;

insert  into `tbl_error_log_db`(`id_error_log_db`,`error`,`QUERY`,`class`,`dt_erro`) values (1,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-14 06:19:44'),(2,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-14 10:04:15'),(3,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-14 21:26:24'),(4,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-14 23:00:05'),(5,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 02:51:05'),(6,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 05:30:13'),(7,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 08:44:00'),(8,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 12:15:24'),(9,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 14:44:24'),(10,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 17:55:46'),(11,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 20:29:44'),(12,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto`\nWHERE `id_produto` IS NULL','Cart','2018-06-15 23:38:15'),(13,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-07-22 06:13:14'),(14,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-07-22 06:13:30'),(15,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-07-22 21:52:11'),(16,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-07-22 21:53:31'),(17,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-07-23 06:08:43'),(18,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-07-23 06:09:15'),(19,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-02 13:54:31'),(20,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-02 13:55:12'),(21,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-07 01:05:01'),(22,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-07 01:05:34'),(23,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-08 02:50:30'),(24,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-08 02:50:45'),(25,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-10 03:18:18'),(26,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-10 03:20:41'),(27,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-15 08:58:37'),(28,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-15 09:29:55'),(29,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-28 13:20:18'),(30,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-28 13:20:28'),(31,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-31 05:34:27'),(32,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-08-31 07:11:44'),(33,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-09-04 23:36:06'),(34,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-09-05 04:39:15'),(35,'1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `id_cart` IS NULL\' at line 2','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-09-06 02:50:22'),(36,'1048 - Column \'id_session\' cannot be null','SELECT *\nFROM `tbl_produto_categoria`\nWHERE `id_produto` IS NULL\nAND `id_categoria_produto` IS NULL','Cart','2018-09-27 20:12:15');

UNLOCK TABLES;

/*Table structure for table `tbl_estoque` */

DROP TABLE IF EXISTS `tbl_estoque`;

CREATE TABLE `tbl_estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Estoques',
  `id_loja` int(11) NOT NULL COMMENT 'Lojas',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `qtde_total` decimal(6,0) NOT NULL COMMENT 'qnt total disponivel',
  `qtde_minima` decimal(6,0) DEFAULT NULL COMMENT 'estoque minimo',
  `ativo` char(1) DEFAULT NULL COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_estoque`),
  UNIQUE KEY `UK_LP` (`id_loja`,`id_produto`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `tbl_estoque_ibfk_1` FOREIGN KEY (`id_loja`) REFERENCES `tbl_loja` (`id_loja`),
  CONSTRAINT `tbl_estoque_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_estoque` */

LOCK TABLES `tbl_estoque` WRITE;

insert  into `tbl_estoque`(`id_estoque`,`id_loja`,`id_produto`,`qtde_total`,`qtde_minima`,`ativo`) values (8,1,14,467,25,'s'),(9,1,39,170,25,'s'),(10,1,15,214,25,'s'),(11,1,16,215,25,'s'),(12,1,17,0,25,'n'),(13,1,18,18,25,'s'),(14,1,13,0,25,'n'),(15,2,39,0,25,'s'),(16,2,16,0,25,'s'),(17,2,14,0,25,'s'),(18,2,15,0,25,'s'),(19,2,18,0,25,'s');

UNLOCK TABLES;

/*Table structure for table `tbl_evento` */

DROP TABLE IF EXISTS `tbl_evento`;

CREATE TABLE `tbl_evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Eventos',
  `id_cliente` int(11) NOT NULL COMMENT 'Clientes',
  `id_pedido` int(11) NOT NULL COMMENT 'Pedidos',
  `data_evento` date NOT NULL,
  `end_evento` varchar(250) NOT NULL,
  `hora_evento` varchar(15) NOT NULL,
  `cel_evento` varchar(30) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `tbl_evento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `tbl_evento_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Evento';

/*Data for the table `tbl_evento` */

LOCK TABLES `tbl_evento` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_ficha_kardex` */

DROP TABLE IF EXISTS `tbl_ficha_kardex`;

CREATE TABLE `tbl_ficha_kardex` (
  `id_ficha_kerdex` int(11) NOT NULL AUTO_INCREMENT COMMENT 'FichaKerdexs',
  `id_loja` int(11) NOT NULL COMMENT 'Lojas',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `tipo_movimentacao` char(2) NOT NULL COMMENT 'e - entrada / s - sainda / a - ajuste / t - transferencia / c - cancelado',
  `origem_movimentacao` char(3) NOT NULL COMMENT 'me - movimentacao estoque / nfs - nota fiscal sainda / nfe nota fiscal entrada / ps - pedido site',
  `data_movimentacao` date NOT NULL,
  `qtde_movimentacao` decimal(6,0) NOT NULL,
  PRIMARY KEY (`id_ficha_kerdex`),
  KEY `id_loja` (`id_loja`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `tbl_ficha_kardex_ibfk_1` FOREIGN KEY (`id_loja`) REFERENCES `tbl_loja` (`id_loja`),
  CONSTRAINT `tbl_ficha_kardex_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_ficha_kardex` */

LOCK TABLES `tbl_ficha_kardex` WRITE;

insert  into `tbl_ficha_kardex`(`id_ficha_kerdex`,`id_loja`,`id_produto`,`tipo_movimentacao`,`origem_movimentacao`,`data_movimentacao`,`qtde_movimentacao`) values (11,1,14,'e','me','2018-07-17',0),(12,1,39,'e','me','2018-07-17',0),(13,1,15,'e','me','2018-07-17',0),(14,1,16,'e','me','2018-07-17',0),(15,1,17,'e','me','2018-07-17',0),(16,1,18,'e','me','2018-07-17',0),(17,1,13,'e','me','2018-07-17',0),(18,1,14,'e','me','2018-07-19',186),(19,1,18,'e','me','2018-07-19',81),(20,1,39,'e','me','2018-07-19',78),(21,1,16,'e','me','2018-07-19',140),(22,1,15,'e','me','2018-07-19',102),(23,1,15,'s','ps','2018-07-23',50),(24,1,39,'s','ps','2018-07-23',50),(33,1,14,'s','me','2018-07-27',10),(34,1,15,'s','me','2018-07-27',8),(35,1,18,'s','me','2018-07-27',7),(36,1,15,'e','me','2018-07-27',100),(37,1,39,'e','me','2018-07-27',100),(38,2,39,'e','me','2018-07-27',46),(39,2,16,'e','me','2018-07-27',200),(40,2,14,'e','me','2018-07-27',470),(41,2,15,'e','me','2018-07-27',267),(42,2,39,'e','me','2018-07-27',50),(43,2,39,'s','me','2018-07-27',46),(44,2,15,'s','me','2018-07-31',15),(45,2,14,'s','me','2018-07-31',15),(46,1,39,'s','me','2018-07-31',50),(47,1,18,'s','me','2018-07-31',74),(48,2,15,'s','me','2018-07-31',100),(49,2,14,'s','me','2018-07-31',100),(50,2,39,'s','me','2018-07-31',50),(51,2,16,'s','me','2018-07-31',100),(52,1,14,'s','me','2018-07-31',25),(53,1,39,'s','me','2018-07-31',25),(54,1,15,'s','me','2018-07-31',25),(55,1,16,'s','me','2018-07-31',25),(56,1,15,'s','me','2018-08-04',50),(57,1,14,'s','me','2018-08-06',5),(58,1,39,'s','me','2018-08-06',5),(59,1,15,'s','me','2018-08-06',5),(60,1,16,'s','me','2018-08-06',5),(61,1,18,'s','me','2018-08-06',2),(62,1,15,'e','me','2018-08-06',45),(63,1,18,'e','me','2018-08-06',100),(64,1,16,'e','me','2018-08-06',44),(65,2,16,'s','me','2018-08-06',50),(66,2,14,'s','me','2018-08-06',50),(67,2,15,'s','me','2018-08-06',50),(68,2,18,'e','me','2018-08-06',50),(69,1,18,'e','me','2018-08-06',2),(70,1,39,'s','me','2018-08-06',12),(71,1,16,'s','me','2018-08-06',12),(72,2,15,'s','me','2018-08-06',62),(73,2,14,'s','me','2018-08-06',5),(74,1,14,'s','me','2018-08-07',5),(75,1,15,'s','me','2018-08-07',5),(76,1,16,'s','me','2018-08-07',5),(77,1,18,'s','me','2018-08-07',5),(78,1,39,'s','me','2018-08-08',10),(79,1,15,'s','me','2018-08-08',5),(80,1,16,'s','me','2018-08-08',5),(81,1,18,'s','me','2018-08-08',5),(82,1,39,'s','me','2018-08-08',10),(83,1,15,'s','me','2018-08-08',5),(84,1,16,'s','me','2018-08-08',5),(85,1,18,'s','me','2018-08-08',5),(86,1,14,'s','me','2018-08-08',30),(87,1,15,'s','me','2018-08-08',30),(88,1,16,'s','me','2018-08-08',20),(89,1,18,'s','me','2018-08-08',20),(90,1,16,'s','me','2018-08-08',107),(91,1,18,'s','me','2018-08-08',5),(92,1,14,'s','me','2018-08-08',5),(93,1,39,'s','me','2018-08-08',5),(94,1,14,'e','me','2018-08-08',44),(95,1,15,'e','me','2018-08-08',36),(96,1,39,'s','me','2018-08-08',11),(97,1,15,'e','me','2018-08-09',250),(98,1,14,'e','me','2018-08-09',268),(99,1,39,'e','me','2018-08-09',125),(100,1,16,'e','me','2018-08-09',235),(101,1,18,'e','me','2018-08-09',153),(102,1,39,'s','me','2018-08-09',10),(103,1,15,'s','me','2018-08-09',5),(104,1,16,'s','me','2018-08-09',5),(105,1,18,'s','me','2018-08-09',5),(106,1,39,'s','me','2018-08-09',10),(107,1,14,'s','me','2018-08-09',10),(108,1,15,'s','me','2018-08-09',10),(109,1,16,'s','me','2018-08-09',10),(110,1,39,'s','me','2018-08-09',5),(111,1,15,'s','me','2018-08-09',5),(112,1,16,'s','me','2018-08-09',5),(113,1,18,'s','me','2018-08-09',5),(114,1,14,'s','me','2018-08-10',5),(115,1,39,'s','me','2018-08-10',5),(116,1,15,'s','me','2018-08-10',5),(117,1,16,'s','me','2018-08-10',5),(118,1,18,'s','me','2018-08-10',5),(119,1,16,'s','me','2018-08-10',40),(120,1,15,'s','me','2018-08-10',30),(121,1,39,'s','me','2018-08-10',30),(122,1,14,'s','me','2018-08-10',10),(123,1,15,'s','me','2018-08-10',10),(124,1,18,'s','me','2018-08-10',5),(125,1,15,'s','me','2018-08-10',20),(126,1,14,'s','me','2018-08-10',10),(127,1,18,'s','me','2018-08-10',10),(128,1,14,'s','me','2018-08-11',10),(129,1,18,'s','me','2018-08-11',5),(130,1,14,'e','me','2018-08-13',244),(131,1,15,'s','me','2018-08-13',34),(132,1,18,'e','me','2018-08-13',140),(133,1,16,'e','me','2018-08-13',218),(134,1,39,'s','me','2018-08-13',5),(135,1,15,'s','me','2018-08-13',30),(136,1,16,'s','me','2018-08-13',10),(137,1,14,'s','me','2018-08-13',5),(138,1,39,'s','me','2018-08-13',5),(139,1,15,'s','me','2018-08-13',5),(140,1,16,'s','me','2018-08-13',5),(141,1,14,'s','me','2018-08-14',5),(142,1,39,'s','me','2018-08-14',5),(143,1,15,'s','me','2018-08-14',5),(144,1,16,'s','me','2018-08-14',5),(145,2,16,'s','me','2018-08-14',50),(146,2,14,'s','me','2018-08-14',300),(147,2,15,'s','me','2018-08-14',40),(148,2,18,'s','me','2018-08-14',50),(149,1,14,'s','me','2018-08-14',5),(150,1,39,'s','me','2018-08-14',5),(151,1,15,'s','me','2018-08-14',5),(152,1,16,'s','me','2018-08-14',5),(153,1,18,'s','me','2018-08-14',5),(154,1,14,'s','me','2018-08-14',20),(155,1,39,'s','me','2018-08-14',20),(156,1,15,'s','me','2018-08-14',20),(157,1,15,'s','me','2018-08-14',20),(158,1,16,'s','me','2018-08-14',20),(159,1,18,'s','me','2018-08-14',20),(160,1,39,'s','me','2018-08-14',5),(161,1,14,'s','me','2018-08-14',5),(162,1,15,'s','me','2018-08-14',5),(163,1,14,'e','me','2018-08-14',5),(164,1,16,'s','me','2018-08-14',5),(165,1,18,'s','me','2018-08-14',5),(166,1,15,'s','me','2018-08-14',5),(167,1,16,'s','me','2018-08-15',20),(168,1,14,'s','me','2018-08-15',10),(169,1,15,'s','me','2018-08-15',10),(170,1,18,'s','me','2018-08-15',10),(171,1,14,'s','me','2018-08-15',50),(172,1,15,'s','me','2018-08-15',50),(173,1,16,'s','me','2018-08-15',50),(174,1,18,'s','me','2018-08-15',50),(175,1,14,'s','me','2018-08-15',9),(176,1,39,'s','me','2018-08-15',5),(177,1,15,'s','me','2018-08-15',5),(178,1,16,'s','me','2018-08-15',5),(179,1,18,'s','me','2018-08-15',5),(180,1,14,'s','me','2018-08-15',10),(181,1,15,'s','me','2018-08-15',10),(182,1,16,'s','me','2018-08-15',10),(183,1,14,'s','me','2018-08-16',10),(184,1,14,'s','me','2018-08-16',1),(185,1,16,'s','me','2018-08-16',10),(186,1,18,'s','me','2018-08-16',10),(187,1,14,'s','me','2018-08-16',25),(188,1,16,'s','me','2018-08-16',25),(189,1,18,'s','me','2018-08-16',25),(190,1,16,'s','me','2018-08-16',168),(191,1,18,'s','me','2018-08-16',138),(192,1,15,'s','me','2018-08-18',61),(193,1,16,'s','me','2018-08-18',50),(194,1,18,'e','me','2018-08-18',200),(195,1,16,'e','me','2018-08-18',191),(196,1,39,'s','me','2018-08-18',15),(197,1,15,'e','me','2018-08-18',168),(198,1,39,'e','me','2018-08-18',168),(199,1,15,'s','me','2018-08-18',168),(200,1,14,'e','me','2018-08-18',377),(201,1,14,'s','me','2018-08-18',2),(202,1,39,'s','me','2018-08-18',10),(203,1,16,'s','me','2018-08-18',15),(204,1,14,'s','me','2018-08-18',25),(205,1,39,'s','me','2018-08-18',25),(206,1,16,'s','me','2018-08-18',25),(207,1,18,'s','me','2018-08-18',25),(208,1,16,'s','me','2018-08-18',10),(209,1,16,'s','me','2018-08-18',10),(210,1,18,'s','me','2018-08-18',5),(211,1,14,'s','me','2018-08-18',5),(212,1,39,'s','me','2018-08-18',50),(213,1,16,'s','me','2018-08-18',10),(214,1,39,'s','me','2018-08-18',5),(215,1,14,'s','me','2018-08-18',5),(216,1,39,'s','me','2018-08-18',10),(217,1,14,'s','me','2018-08-18',10),(218,1,16,'s','me','2018-08-18',25),(219,1,18,'s','me','2018-08-18',25),(220,1,39,'s','me','2018-08-22',10),(221,1,14,'s','me','2018-08-22',10),(222,1,16,'s','me','2018-08-22',10),(223,1,18,'s','me','2018-08-22',10),(224,1,14,'s','me','2018-08-22',10),(225,1,39,'s','me','2018-08-22',10),(226,1,16,'s','me','2018-08-22',20),(227,1,39,'s','me','2018-08-22',15),(228,1,16,'s','me','2018-08-22',15),(229,1,18,'s','me','2018-08-22',10),(230,1,14,'s','me','2018-08-22',10),(231,1,15,'e','me','2018-08-23',150),(232,1,39,'e','me','2018-08-23',150),(233,1,16,'e','me','2018-08-23',150),(234,1,14,'s','me','2018-08-23',10),(235,1,15,'s','me','2018-08-23',10),(236,1,39,'s','me','2018-08-23',20),(237,1,15,'s','me','2018-08-23',20),(238,1,16,'s','me','2018-08-23',20),(239,1,18,'s','me','2018-08-23',20),(240,1,14,'e','me','2018-08-23',1),(241,1,14,'s','me','2018-08-23',1),(242,1,39,'s','me','2018-08-23',20),(243,1,14,'s','me','2018-08-23',10),(244,1,15,'s','me','2018-08-23',10),(245,1,18,'s','me','2018-08-23',10),(246,1,14,'s','me','2018-08-23',10),(247,1,39,'s','me','2018-08-23',10),(248,1,15,'s','me','2018-08-23',10),(249,1,16,'s','me','2018-08-23',10),(250,1,14,'e','me','2018-08-24',1),(251,1,14,'s','me','2018-08-24',1),(252,1,14,'s','me','2018-08-24',20),(253,1,39,'s','me','2018-08-24',10),(254,1,15,'s','me','2018-08-24',20),(255,1,16,'s','me','2018-08-24',20),(256,1,18,'s','me','2018-08-24',10),(257,1,14,'s','me','2018-08-24',25),(258,1,18,'s','me','2018-08-24',13),(259,1,16,'s','me','2018-08-24',20),(260,1,39,'s','me','2018-08-24',19),(261,1,14,'s','me','2018-08-25',25),(262,1,14,'e','me','2018-08-25',25),(263,1,39,'s','me','2018-08-27',15),(264,1,14,'s','me','2018-08-27',5),(265,1,15,'s','me','2018-08-27',5),(266,1,15,'s','me','2018-08-27',25),(267,1,39,'s','me','2018-08-27',25),(268,1,39,'s','me','2018-08-27',54),(269,1,15,'s','me','2018-08-27',5),(270,1,39,'e','me','2018-08-29',65),(271,1,15,'e','me','2018-08-29',30),(272,1,16,'e','me','2018-08-29',40),(273,1,39,'s','me','2018-08-29',75),(274,1,15,'s','me','2018-08-29',75),(275,1,16,'s','me','2018-08-29',75),(276,1,39,'e','me','2018-08-29',25),(277,1,15,'e','me','2018-08-30',100),(278,1,39,'e','me','2018-08-30',100),(279,1,39,'s','me','2018-08-30',25),(280,1,15,'e','me','2018-08-30',25),(281,1,15,'s','me','2018-08-30',50),(282,1,18,'s','me','2018-08-30',25),(283,1,16,'s','me','2018-08-30',25),(284,1,14,'s','me','2018-08-30',25),(285,1,16,'s','me','2018-08-30',50),(286,1,14,'s','me','2018-08-30',40),(287,1,18,'s','me','2018-08-30',30),(288,1,18,'s','me','2018-08-30',11),(289,1,39,'e','me','2018-08-31',100),(290,1,16,'e','me','2018-08-31',114),(291,1,15,'e','me','2018-08-31',30),(292,1,18,'s','me','2018-08-31',26),(293,1,39,'s','me','2018-08-31',60),(294,1,14,'s','me','2018-08-31',10),(295,1,15,'s','me','2018-08-31',10),(296,1,18,'s','me','2018-08-31',10),(297,1,39,'s','me','2018-08-31',100),(298,1,15,'s','me','2018-08-31',95),(299,1,18,'s','me','2018-08-31',20),(300,1,39,'s','me','2018-08-31',10),(301,1,16,'s','me','2018-08-31',15),(302,1,14,'s','me','2018-08-31',10),(303,1,39,'s','me','2018-08-31',30),(304,1,16,'s','me','2018-08-31',25),(305,1,14,'s','me','2018-08-31',50),(306,1,14,'e','me','2018-09-01',50),(307,1,15,'e','me','2018-09-01',104),(308,1,18,'e','me','2018-09-01',100),(309,1,16,'s','me','2018-09-01',10),(310,1,15,'e','me','2018-09-03',25),(311,1,15,'s','me','2018-09-03',10),(312,1,18,'s','me','2018-09-03',10),(313,1,16,'s','me','2018-09-03',10),(314,1,14,'s','me','2018-09-03',10),(315,1,15,'s','me','2018-09-04',5),(316,1,16,'s','me','2018-09-04',5),(317,1,18,'s','me','2018-09-04',15),(318,1,14,'s','me','2018-09-05',10),(319,1,15,'s','me','2018-09-05',10),(320,1,16,'s','me','2018-09-05',10),(321,1,18,'s','me','2018-09-05',10),(322,1,15,'e','me','2018-09-05',150),(323,1,18,'s','me','2018-09-05',12),(324,1,39,'e','me','2018-09-05',150),(325,1,16,'e','me','2018-09-05',140),(326,1,18,'s','me','2018-09-06',10),(327,1,39,'s','me','2018-09-06',20),(328,1,16,'s','me','2018-09-06',5),(329,1,14,'s','me','2018-09-06',100),(330,1,15,'s','me','2018-09-06',100),(331,1,16,'s','me','2018-09-06',100),(332,1,39,'s','me','2018-09-06',50),(333,1,15,'s','me','2018-09-06',50),(334,1,39,'s','me','2018-09-06',10),(335,1,18,'s','me','2018-09-06',10),(336,1,16,'s','me','2018-09-06',10),(337,1,15,'s','me','2018-09-06',10),(338,1,39,'s','me','2018-09-11',5),(339,1,39,'s','me','2018-09-11',0),(340,1,15,'e','me','2018-09-11',5),(341,1,16,'s','me','2018-09-11',5),(342,1,18,'s','me','2018-09-11',5),(343,1,39,'s','me','2018-09-11',20),(344,1,18,'s','me','2018-09-11',10),(345,1,14,'s','me','2018-09-11',5),(346,1,15,'e','me','2018-09-11',150),(347,1,39,'e','me','2018-09-11',150),(348,1,16,'e','me','2018-09-11',150),(349,1,18,'e','me','2018-09-11',50),(350,1,39,'s','me','2018-09-11',20),(351,1,15,'s','me','2018-09-11',20),(352,1,18,'s','me','2018-09-11',20),(353,1,14,'s','me','2018-09-11',5),(354,1,39,'s','me','2018-09-11',5),(355,1,15,'s','me','2018-09-11',5),(356,1,16,'s','me','2018-09-11',5),(357,1,18,'s','me','2018-09-11',5),(358,1,16,'s','me','2018-09-11',10),(359,1,15,'s','me','2018-09-11',10),(360,1,14,'s','me','2018-09-11',5),(361,1,18,'s','me','2018-09-13',25);

UNLOCK TABLES;

/*Table structure for table `tbl_fornecedor` */

DROP TABLE IF EXISTS `tbl_fornecedor`;

CREATE TABLE `tbl_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `apelido` varchar(255) DEFAULT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL,
  `whatsapp` varchar(25) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `observacao` text,
  `tipo_pessoa` char(1) DEFAULT NULL COMMENT 'f - fisica / j - juridica',
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `rg` varchar(14) DEFAULT NULL,
  `inscr_municipal` varchar(20) DEFAULT NULL,
  `inscr_estadual` varchar(25) DEFAULT NULL,
  `tipo_ie` char(11) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(150) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `banco` varchar(250) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `digito_ag` varchar(5) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `digito_cc` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_fornecedor` */

LOCK TABLES `tbl_fornecedor` WRITE;

insert  into `tbl_fornecedor`(`id_fornecedor`,`nome`,`apelido`,`telefone`,`celular`,`whatsapp`,`email`,`site`,`observacao`,`tipo_pessoa`,`cpf_cnpj`,`rg`,`inscr_municipal`,`inscr_estadual`,`tipo_ie`,`cep`,`endereco`,`numero`,`bairro`,`complemento`,`banco`,`agencia`,`digito_ag`,`conta_corrente`,`digito_cc`) values (1,'Cristina Rodrigues','Fotografo',NULL,NULL,'016 991919933','crisphoto.rodrigues@gmail.com','www.crisphoto.com.br','fotografia profissional',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'49','0332 ',NULL,'18088','4'),(2,'Thiago revelatto','Bio Rib - Reciclagem de Óleo','016 4141-3234',NULL,'016 99786-1662','coleta@biorib.com.br','www.biorib.com.br','Recicla óleo, R$ 0,50 por Litro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Platinir - Logo','Pedreiro',NULL,NULL,'016 99243 9045',NULL,NULL,'Não usamos eles, apenas contato. Também faz elétrica e pintura',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Mestre Marceneiro','Material Marcenaria','016 3969 8720','016 99218 3799','016 99156-3522','josecarlos.araujo@mestremarceneiro.com','www.mestremarceneiro.com','Material de Marcenaria, madeiras, ferragens e acessórios',NULL,NULL,NULL,NULL,NULL,NULL,'14075-610','Av. Marechal Costa e Silva','3131','Vila Brasil',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Fabio','Mister Ottani - Massa de Pastel','016 3625 6139',NULL,'016 98149-0636','sac@misterottani.com.br','www.misterottani.com.br','Massa de Pastel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'São Paulo','266','Campos Eliseos',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Erasmo','Tati Minas','016 3934 5557',NULL,'016 99106 6455','tatiminasvendas@terra.com.br',NULL,'Pão de Queijo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'porto Seguro','2169','Ipiranga',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Edilson','Sacolas Personalizadas','016 3969 2039',NULL,NULL,'edilsongraf@hotmail.com',NULL,'Sacolas Personalizadas, Calendários, Filhinhas, Camisetas, chaveiros, adesivos, imã',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'João Sergio','Emablagens ws',NULL,'016 99388 3695','016 98807 0673',NULL,NULL,'Copos, sacolas, sacos de lixo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Castro Salgaderia','Castro Salgaderia','016 3610 2558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bernadino de campos','734',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'WRM','WRM',NULL,'016 99366 5500','016 99332 5538',NULL,NULL,'Camisetas Personalizadas, Tapetes de carro.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Jaqueline','Dentista Dra. Jaqueline',NULL,'016 98243 7151','016 99299 9457',NULL,NULL,'Cirurgião dentista',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Rubilan','Sabor e Arte','016 3625 1419',NULL,'016 9136 5418','saborearte.alge123@yahoo.com.br',NULL,'vendas de pão de queijo',NULL,NULL,NULL,NULL,NULL,NULL,'14085-030','Onze de Agosto','1423','Campos Elisios',NULL,NULL,NULL,NULL,NULL,NULL),(13,'David','Taurus - Segurança Particular',NULL,'016 99348 9342','016 98825 9213',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Paulo','Cooper Grafica','016 3023 4532',NULL,NULL,'coopergrafia@hotmail.com',NULL,'Filho do Emilio, compra sempre os croquetes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Visconde de Inhaúma','872','Centro',NULL,NULL,NULL,NULL,NULL,NULL),(15,'Thiago / Patricia','Montreal Copiado Gráfica','016 3636 0399','016 3610 6061',NULL,'cop_montreal@hotmail.com','www.copgrafmontreal.com.br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14010-160','São José','1217','Centro',NULL,NULL,NULL,NULL,NULL,NULL),(16,'Valéria','Sistema Clube de Comunicação','016 2101 3500','016 98159 3831',NULL,'valeria@clube.com.br','www.clube.com.br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14025-000','Av. Nove de Julho','600/606','Centro',NULL,NULL,NULL,NULL,NULL,NULL),(17,'Carlos','Alfa jc Planejados',NULL,'016 99382 7280','016 99297 5701','alfaplanejados@outlook.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'Monteiro','Distribuidora de Carne Monteiro',NULL,NULL,'016 99462 3927',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Copacol','Copacol - Peito de Frango',NULL,NULL,'017 98164 1800',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'Cupim Frango','Cupim Frango',NULL,NULL,'016 99204 3565',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'Marcio','Marcio - Refrigeração',NULL,NULL,'016 98192 7452',NULL,NULL,'Concerto de Refrigerados / Geladeira Expositora.\r\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'Lincon','Massa Boa',NULL,NULL,'016 98149 0636',NULL,NULL,'Massa de Pastel - Fabio (Mister Ottani) q deu o contato',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Thiago Sindico','Sindico do Prédio',NULL,NULL,'016 99709 0401',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'Weslei','Sucos Spres',NULL,NULL,'016 98856 1590',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'Vicente','Festpan - alimentos de panificação',NULL,NULL,'016 99159 2530',NULL,'http://www.festpan.com.br/','Vende a Gordura vegetal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'Edimilson','Farinha de Rosca - Encomendas','016 3237 1553','016 99173 7597','016 98150 1706',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'Izabela','Frango Gonzales',NULL,NULL,'016 99105 7993',NULL,'http://www.frangogonzalez.com.br/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'Renato - Suco Prats',NULL,NULL,NULL,'016  99716 3320',NULL,NULL,'Suco Prats - 300ml e 900ml\r\nSabores Laranja / Uva / Goiaba / Limão',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'Toninho do Alho',NULL,NULL,'016 99199 1704','016 99199 1704',NULL,NULL,'Vende alho moído (30 reais 3kg) e ovo de codorna (15 reais 1kg)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Vagner','Instalações Elétrica em geral - Eletrecista',NULL,'016997338398','016997338398',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `tbl_function_controller` */

DROP TABLE IF EXISTS `tbl_function_controller`;

CREATE TABLE `tbl_function_controller` (
  `function_controller_id` int(11) NOT NULL AUTO_INCREMENT,
  `arquivo_controller_id` int(11) NOT NULL,
  `nome_function` varchar(80) NOT NULL,
  `funcao` text,
  PRIMARY KEY (`function_controller_id`),
  KEY `FK_function_controller_id` (`arquivo_controller_id`),
  CONSTRAINT `FK_function_controller_id` FOREIGN KEY (`arquivo_controller_id`) REFERENCES `tbl_arquivo_controller` (`arquivo_controller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_function_controller` */

LOCK TABLES `tbl_function_controller` WRITE;

insert  into `tbl_function_controller`(`function_controller_id`,`arquivo_controller_id`,`nome_function`,`funcao`) values (1,1,'__construct','	public $data = array();\r\n\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		if ($this->session->userdata(\'is_loginho\') === null)\r\n			redirect(\'/\');\r\n		$this->data[\'__CLASS__\'] = __CLASS__;\r\n		$this->getStatusPedido(False);\r\n		$this->getMenus();\r\n	}'),(2,1,'getMenus','	public function getMenus(){\r\n		$this->data[\'menus\'] = $this->Generico->getAllMenus();\r\n	}'),(3,1,'getStatusPedido','	public function getStatusPedido($param = True){\r\n		$this->data[\'PedidoAbertoFechado\'] = $this->Pedidos->getQtdAbertoFechado();\r\n		if($param === True)\r\n			print_r(json_encode($this->data[\'PedidoAbertoFechado\']));\r\n	}'),(4,1,'_example_output','	public function _example_output($output = null)\r\n	{\r\n		$output = array_merge($this->data,(array)$output);\r\n		$this->load->view(\'restrito/admin.php\',$output);\r\n	}'),(5,1,'index','	public function index()\r\n	{\r\n		$this->data[\'main_page\'] = \'isset\';\r\n		$this->data[\'estoques\'] = $this->Generico->getEstoque();\r\n		$this->data[\'afazeres\'] = $this->Generico->getAFazer();\r\n		$this->data[\'PedidosSolicitados\'] = $this->Generico->getPedidoSolicitados();\r\n		$this->_example_output((object)array(\'output\' => \'\' , \'js_files\' => array() , \'css_files\' => array()));\r\n	}'),(6,1,'cliente_unique','	public function cliente_unique($id_cliente = \'\')\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/pedidos\").\"\'>Voltar ao Pedido</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cliente\');\r\n		if (!empty($id_cliente)){\r\n			$crud->where(\'tbl_cliente.id_cliente\',$id_cliente);\r\n		}\r\n		$crud->set_subject(\'Cadastro de Cliente\');\r\n		$crud->columns(\'nome\',\'email\',\'endereco\',\'tipo\');\r\n		$crud->fields(\'id_cliente\',\'nome\',\'cpf_cnpj\',\'email\',\'senha\',\'telefone\',\'endereco\',\'numero\',\'bairro\',                     \r\n					  \'complemento\',\'situacao\',\'tipo\',\'ganho_unitario\',\'ativo\', \'dt_cadastro\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF/CNPJ\');\r\n		$crud->display_as(\'senha\',\'Senha\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'endereco\',\'Endereco\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'ganho_unitario\',\'Ganho %\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n		$crud->display_as(\'dt_cadastro\',\'Dt. Cadastro\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'tipo\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'1\' => \'True\', \'0\' => \'False\'));\r\n		 \r\n		$output = $crud->render();\r\n\r\n		$this->_example_output($output);\r\n	}'),(7,1,'clientes','	public function clientes()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cliente\');\r\n		$crud->set_subject(\'Cadastro de Cliente\');\r\n		$crud->columns(\'nome\',\'email\',\'endereco\',\'tipo\');\r\n		$crud->fields(\'id_cliente\',\'nome\',\'cpf_cnpj\',\'email\',\'senha\',\'telefone\',\'endereco\',\'numero\',\'bairro\',                     \r\n					  \'complemento\',\'situacao\',\'tipo\',\'ganho_unitario\',\'ativo\', \'dt_cadastro\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF/CNPJ\');\r\n		$crud->display_as(\'senha\',\'Senha\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'endereco\',\'Endereco\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'ganho_unitario\',\'Ganho %\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n		$crud->display_as(\'dt_cadastro\',\'Dt. Cadastro\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'tipo\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'1\' => \'True\', \'0\' => \'False\'));\r\n		 \r\n		$output = $crud->render();\r\n\r\n		$this->_example_output($output);\r\n	}'),(8,1,'cidades','	public function cidades()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cidade\');\r\n		$crud->set_subject(\'Cadastro de Cidade\');\r\n		$crud->columns(\'nome\',\'uf\',\'link\');\r\n		$crud->fields(\'id_cidade\',\'nome\',\'uf\',\'link\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome da Cidade\');\r\n		$crud->display_as(\'uf\',\'UF\');\r\n		$crud->display_as(\'link\',\'Link\');\r\n\r\n		$crud->field_type(\'uf\',\'dropdown\', array(\'AC\' => \'Acre\', \'AL\' => \'Alagoas\', \'AP\' => \'Amapá\',\r\n												 \'AM\' => \'Amazonas\', \'BA\' => \'Bahia\', \'CE\' => \'Ceará\',\r\n												 \'DF\' => \'Distrito Federal\', \'ES\' => \'Espírito Santo\',\r\n												 \'GO\' => \'Goiás\', \'MA\' => \'Maranhão\', \'MT\' => \'Mato Grosso\',\r\n												 \'MS\' => \'Mato Grosso do Sul\', \'MG\' => \'Minas Gerais\',\r\n												 \'PA\' => \'Pará\', \'PB\' => \'Paraíba\', \'PR\' => \'Paraná\',\r\n												 \'PE\' => \'Pernambuco\', \'PI\' => \'Piauí\', \'RJ\' => \'Rio de Janeiro\',\r\n												 \'RN\' => \'Rio Grande do Norte\', \'RS\' => \'Rio Grande do Sul\',\r\n												 \'RO\' => \'Rondônia\', \'RR\' => \'Roraima\', \'SC\' => \'Santa Catarina\',\r\n												 \'SP\' => \'São Paulo\', \'SE\' => \'Sergipe\', \'TO\' => \'Tocantins\'));\r\n	 \r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(9,1,'fornecedores','	public function fornecedores()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_fornecedor\');\r\n		$crud->set_subject(\'Cadastro de Fornecedor\');\r\n		$crud->columns(\'nome\', \'apelido\', \'whatsapp\', \'email\',\'site\');\r\n		$crud->fields(\'nome\',\'apelido\',\'telefone\',\'celular\',\'whatsapp\',\'email\',\'site\',\'observacao\',\r\n				 	  \'tipo_pessoa\',\'cpf_cnpj\',\'rg\',\'inscr_municipal\',\'inscr_estadual\',\'tipo_ie\',\'cep\',\r\n					  \'endereco\',\'numero\',\'bairro\',\'complemento\',\'banco\',\'agencia\',\'digito_ag\',\'conta_corrente\',\'digito_cc\');\r\n		\r\n		$crud->display_as(\'id_fornecedor\',\'Id Fornecedor\');\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'apelido\',\'Apelido/ Razão Social\'); \r\n		$crud->display_as(\'whatsapp\',\'Whatsapp\');\r\n		$crud->display_as(\'celular\',\'Celular\');	\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'site\',\'Site\');\r\n		$crud->display_as(\'tipo_pessoa\',\'Fisíca/Juridica\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF / CNPJ\');\r\n		$crud->display_as(\'rg\',\'RG\');\r\n		$crud->display_as(\'inscr_municipal\',\'Inscrição Municipal\');\r\n		$crud->display_as(\'inscr_estadual\',\'Inscrição Estadual\');\r\n		$crud->display_as(\'tipo_ie\',\'Indicador IE\');\r\n		$crud->display_as(\'cep\',\'CEP\');\r\n		$crud->display_as(\'endereco\',\'Endereço\');\r\n		$crud->display_as(\'numero\',\'Nr.\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'banco\',\'Banco\');\r\n		$crud->display_as(\'agencia\',\'Agência\');\r\n		$crud->display_as(\'digito_ag\',\'Digito\');\r\n		$crud->display_as(\'conta_corrente\',\'Conta Corrente\');\r\n		$crud->display_as(\'digito_cc\',\'Digito\');\r\n\r\n		$crud->display_as(\'observacao\',\'Descrição\');\r\n\r\n		$crud->set_relation(\'banco\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'banco\'));\r\n		$crud->set_relation(\'tipo_ie\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_ie\'));\r\n\r\n		$crud->unset_texteditor(\'observacao\');\r\n\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(10,1,'tipos','	public function tipos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_tipo\');\r\n		$crud->set_subject(\'Cadastro de Tipo\');\r\n		$crud->columns(\'id_tipo\',\'campo\',\'tipo\',\'descricao\');\r\n		$crud->fields(\'campo\',\'tipo\',\'descricao\');\r\n		\r\n		$crud->display_as(\'campo\',\'Nome do Campo\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'descricao\',\'Descrição\');\r\n	 	\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(11,1,'categorias','	public function categorias()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_categoria_produto\');\r\n		$crud->set_subject(\'Cadastro da Categoria do Produto\');\r\n		$crud->columns(\'nome\',\'situacao\');\r\n		$crud->fields(\'id_categoria_produto\',\'nome\',\'situacao\');\r\n		\r\n		$crud->display_as(\'Nome\',\'Nome da Categoria\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 	\r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(12,1,'produtos','	public function produtos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_produto\');\r\n		$crud->set_subject(\'Cadastro de Produto\');\r\n		$crud->columns(\'nome\',\'situacao\');\r\n		$crud->fields(\'id_produto\',\'nome\',\'situacao\',\'imagem\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome do Produto\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 	\r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n	 	\r\n	 	$crud->add_action(\'Valores\', \'\', __CLASS__.\'/valores\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(13,1,'valores','	public function valores($id_produto)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/produtos\").\"\'>Voltar ao Produto</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_valor_produto\');\r\n		$crud->where(\'tbl_valor_produto.id_produto\', $id_produto);\r\n		$crud->set_subject(\'Cadastro de Valor do Produto\');\r\n		$crud->columns(\'id_produto\',\'id_categoria_produto\', \'data_atualizacao\',\'preco\', \'tipo_cliente\');\r\n		$crud->fields(\'id_valor_produto\',\'id_produto\',\'id_categoria_produto\', \'data_atualizacao\',\'preco\', \'tipo_cliente\');\r\n		\r\n		$crud->display_as(\'id_produto\',\'Nome do Produto\');\r\n		$crud->display_as(\'id_categoria_produto\',\'Categoria\');\r\n		$crud->display_as(\'data_atualizacao\',\'Data Atualização\');\r\n		$crud->display_as(\'preco\',\'Preço\');\r\n\r\n	 	$crud->set_relation(\'id_produto\',\'tbl_produto\',\'nome\');\r\n	 	$crud->set_relation(\'id_categoria_produto\',\'tbl_categoria_produto\',\'nome\', array(\'situacao\' => \'a\'));\r\n\r\n	 	$crud->field_type(\'tipo_cliente\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(14,1,'pedidos','	public function pedidos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_pedido\');\r\n		$crud->where(\'tbl_pedido.situacao <>\', \'e\');\r\n		$crud->order_by(\"data_entrega\", \"desc\");\r\n		$crud->set_subject(\'Cadastro de Valor do Produto\');\r\n		$crud->columns(\'id_cliente\',\'data_pedido\',\'data_entrega\',\'situacao\');\r\n		$crud->fields(\'id_pedido\',\'id_cliente\',\'id_cidade\',\'data_pedido\',\'valor\',\'valor_total\',\'situacao\',\'forma_pgto\',\'forma_entrega\',\r\n					  \'taxa_entrega\',\'data_entrega\',\'hora_entrega\',\'end_entrega\',\'num_entrega\',\'bairro_entrega\',\'comp_entrega\',\'data_pagamento\');\r\n		\r\n		$crud->display_as(\'id_cliente\',\'Nome do Cliente\');\r\n		$crud->display_as(\'id_cidade\',\'Cidade\');\r\n		$crud->display_as(\'data_pedido\',\'Data do Pedido\');\r\n		$crud->display_as(\'valor\',\'Valor\');\r\n		$crud->display_as(\'valor_total\',\'Valor Total\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'forma_pgto\',\'Forma Pgto\');\r\n		$crud->display_as(\'forma_entrega\',\'Forma Entrega\');\r\n		$crud->display_as(\'taxa_entrega\',\'Taxa de Entrega\');\r\n		$crud->display_as(\'data_entrega\',\'Data da Entrega\');\r\n		$crud->display_as(\'hora_entrega\',\'Hora de Entrega\');\r\n		$crud->display_as(\'end_entrega\',\'Novo Endereço\');\r\n		$crud->display_as(\'num_entrega\',\'N°\');\r\n		$crud->display_as(\'bairro_entrega\',\'Bairro\');\r\n		$crud->display_as(\'comp_entrega\',\'Complemento\');\r\n		$crud->display_as(\'data_pagamento\',\'Data Pagamento\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'s\' => \'Solicitação\', \'v\' => \'Visualizado\', \'p\' => \'Produzindo\', \'t\' => \'Saiu p/ entregar\', \'e\' => \'Entregue\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'forma_pgto\',\'dropdown\', array(\'d\' => \'Dinheiro\', \'cd\' => \'Cartão Débito\', \'cc\' => \'Cartão Crédito\'));\r\n		$crud->field_type(\'forma_entrega\',\'dropdown\', array(\'r\' => \'Retirar\', \'e\' => \'Entregar\'));\r\n\r\n	 	$crud->set_relation(\'id_cliente\',\'tbl_cliente\',\'nome\');\r\n	 	$crud->set_relation(\'id_cidade\',\'tbl_cidade\',\'nome\');\r\n\r\n	 	$crud->add_action(\'Itens do Pedido\', \'\', __CLASS__.\'/itemPedido\', \'ui-icon-plus\');\r\n	 	$crud->add_action(\'Cliente Pedido\', \'\', \'\', \'ui-icon-plus\', array($this,\'ClientePedido\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(15,1,'ClientePedido','	public function ClientePedido($primary_key , $row)\r\n	{\r\n		return site_url(__CLASS__.\"/cliente_unique/$row->id_cliente\");\r\n	}'),(16,1,'itemPedido','	public function itemPedido($id_pedido)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/pedidos\").\"\'>Voltar ao Pedido</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_item_pedido\');\r\n		$crud->where(\'tbl_item_pedido.id_pedido\', $id_pedido);\r\n		$crud->set_subject(\'Item Pedido\');\r\n		$crud->columns(\'id_pedido\',\'id_produto\',\'qtde\');\r\n		$crud->fields(\'id_item_pedido\',\'id_pedido\',\'id_produto\',\'qtde\', \'valor_unitario\');\r\n		\r\n		$crud->display_as(\'id_pedido\',\'Id do Pedido\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'qtde\',\'Qntde\');\r\n\r\n		$crud->set_relation(\'id_produto\',\'tbl_produto\',\'nome\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(17,1,'lojas','	public function lojas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_loja\');\r\n		$crud->set_subject(\'Loja\');\r\n		$crud->columns(\'id_loja\',\'nome_proprietario\',\'razao_social\',\'nome_fantasia\');\r\n		$crud->fields(\'id_loja\',\'nome_proprietario\',\'cpf\',\'razao_social\',\'nome_fantasia\',\'cnpj\',\'nr_inscricao_muni\',\'cnae\',\'data_nascimento\',\'data_abertura\',\'endereco\',\'numero\',\'complemento\',\'bairro\',\'cep\',\'municipio\',\'uf\');\r\n		\r\n		$crud->display_as(\'nome_proprietario\',\'Nome do Proprietário\');\r\n		$crud->display_as(\'cpf\',\'CPF\');\r\n		$crud->display_as(\'razao_social\',\'Razão Social\');\r\n		$crud->display_as(\'nome_fantasia\',\'Nome Fantasia\');\r\n		$crud->display_as(\'cnpj\',\'CNPJ\');\r\n		$crud->display_as(\'nr_inscricao_muni\',\'Insc. Municipal\');\r\n		$crud->display_as(\'cnae\',\'CNAE\');\r\n		$crud->display_as(\'data_nascimento\',\'Data Nascimento\');\r\n		$crud->display_as(\'data_abertura\',\'Data de Abertura\');\r\n		$crud->display_as(\'endereco\',\'Endereço\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'complemento\',\'Compl.\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'cep\',\'CEP\');\r\n		$crud->display_as(\'municipio\',\'Municipio\');\r\n		$crud->display_as(\'uf\',\'UF\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(18,1,'arquivo_controller','	public function arquivo_controller(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_arquivo_controller\');\r\n		$crud->set_subject(\'Arquivo Controller\');\r\n		$crud->columns(\'nome_controller\',\'diretorio\');\r\n		$crud->fields(\'nome_controller\',\'diretorio\');\r\n		\r\n		$crud->display_as(\'arquivo_controller_id\',\'Id Controller\');\r\n		$crud->display_as(\'nome_controller\',\'Nome da Controller\');\r\n		$crud->display_as(\'diretorio\',\'Diretório\');\r\n\r\n		$crud->required_fields(\'nome_controller\');\r\n\r\n	 	$crud->add_action(\'Funções\', \'\', __CLASS__.\'/funcoes\', \'ui-icon-plus\');\r\n	 	$crud->add_action(\'Gerar Controller\', \'\', __CLASS__.\'/gerar_controller\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(19,1,'funcoes','	public function funcoes($arquivo_controller_id){\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/arquivo_controller\").\"\'>Voltar ao Arq. Controller</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_function_controller\');\r\n		$crud->where(\'tbl_function_controller.arquivo_controller_id\', $arquivo_controller_id);\r\n		$crud->set_subject(\'Funções da Controller (\' . $arquivo_controller_id . \')\');\r\n		$crud->columns(\'nome_function\');\r\n		$crud->fields(\'arquivo_controller_id\',\'nome_function\',\'funcao\');\r\n		\r\n		$crud->display_as(\'arquivo_controller_id\',\'Id Controller\');\r\n		$crud->display_as(\'nome_function\',\'Nome da Function\');\r\n		$crud->display_as(\'funcao\',\'Função\');\r\n\r\n		$crud->required_fields(\'nome_function\',\'funcao\');\r\n\r\n		$crud->field_type(\'arquivo_controller_id\', \'hidden\', $arquivo_controller_id);\r\n\r\n		$crud->unset_texteditor(\'funcao\');		\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(20,1,'gerar_controller','	public function gerar_controller($arquivo_controller_id)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/arquivo_controller\").\"\'>Voltar ao Arq. Controller</a>\";\r\n\r\n		$controller = $this->Generico->getArquivoController($arquivo_controller_id);\r\n		$functions = $this->Generico->getFunctionByIdController($arquivo_controller_id);\r\n\r\n		$data = \r\n			\"<?php if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\\nclass $controller->nome_controller extends CI_Controller {\\n\";\r\n		foreach ($functions as $funcao) {\r\n			$data .= $funcao[\'funcao\'].\"\\n\\n\";\r\n		}\r\n		$data .= \'}\';\r\n\r\n		if (is_null($controller->diretorio)){\r\n			$dir_controller = FCPATH.\"/application/controllers/{$controller->nome_controller}.php\";\r\n		} else {\r\n			$dir_controller = FCPATH.\"/application/controllers/{$controller->diretorio}/{$controller->nome_controller}.php\";\r\n		}\r\n\r\n		if (write_file($dir_controller, $data) == FALSE)\r\n		{\r\n			$this->data[\'msg_file_create\'] = \'Unable to write the file\';\r\n		} else {\r\n			$this->data[\'msg_file_create\'] = \'File written!\';                           \r\n		}\r\n\r\n		$this->_example_output((object)array(\'output\' => \'\' , \'js_files\' => array() , \'css_files\' => array()));\r\n	}'),(21,1,'menu','	public function menu()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_menu\');\r\n		$crud->set_subject(\'Cadastro de Menu\');\r\n		$crud->columns(\'nome_menu\',\'menu_titulo\', \'order\', \'ativo\');\r\n		$crud->fields(\'nome_menu\',\'menu_titulo\',\'tag_i\', \'order\', \'ativo\');\r\n		\r\n		$crud->display_as(\'menu_id\',\'Id Menu\');\r\n		$crud->display_as(\'nome_menu\',\'Nome do Menu\');\r\n		$crud->display_as(\'menu_titulo\',\'Titulo\');\r\n		$crud->display_as(\'tag_i\',\'Tag Img\');\r\n		$crud->display_as(\'order\',\'N° Ordenação\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativado\', \'d\' => \'Desativado\'));\r\n\r\n		$crud->order_by(\'order\',\'asc\');\r\n\r\n		$crud->required_fields(\'nome_menu\');\r\n\r\n	 	$crud->add_action(\'Sub Menu\', \'\', __CLASS__.\'/submenu\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(22,1,'submenu','	public function submenu($menu_id)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/menu\").\"\'>Voltar ao Menu</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n		$crud->set_table(\'tbl_submenu\');\r\n		$crud->where(\'tbl_submenu.menu_id\', $menu_id);\r\n		$crud->set_subject(\'Cadastro do Sub Menu\');\r\n		$crud->columns(\'menu_id\',\'nome_submenu\',\'arquivo_controller_id\', \'function_controller_id\',\'order\', \'ativo\');\r\n		$crud->fields(\'menu_id\',\'nome_submenu\',\'arquivo_controller_id\', \'function_controller_id\',\'order\', \'ativo\');\r\n		\r\n		$crud->display_as(\'submenu_id\',\'Id Sub Menu\');\r\n		$crud->display_as(\'menu_id\',\'Menu\');\r\n		$crud->display_as(\'nome_submenu\',\'Nome Sub Menu\');\r\n		$crud->display_as(\'arquivo_controller_id\',\'Nome Controller\');\r\n		$crud->display_as(\'function_controller_id\',\'Nome Function\');\r\n		$crud->display_as(\'order\',\'N° Ordenação\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		\r\n		$crud->set_relation(\'arquivo_controller_id\', \'tbl_arquivo_controller\', \'nome_controller\');\r\n		$crud->set_relation(\'function_controller_id\', \'tbl_function_controller\', \'nome_function\');\r\n\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativado\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'menu_id\', \'hidden\', $menu_id);\r\n\r\n		$crud->required_fields(\'nome_submenu\',\'arquivo_controller_id\',\'function_controller_id\');\r\n\r\n		$this->load->library(\'gc_dependent_select\');\r\n\r\n		$fields = array(\r\n			// first field:\r\n			\'arquivo_controller_id\' => array( // first dropdown name\r\n			\'table_name\' => \'tbl_arquivo_controller\', // table of country\r\n			\'title\' => \'nome_controller\', // country title\r\n			\'relate\' => null // the first dropdown hasn\'t a relation\r\n			),\r\n			// second field\r\n			\'function_controller_id\' => array( // second dropdown name\r\n			\'table_name\' => \'tbl_function_controller\', // table of state\r\n			\'title\' => \'nome_function\', // state title\r\n			\'id_field\' => \'function_controller_id\', // table of state: primary key\r\n			\'relate\' => \'arquivo_controller_id\', // table of state:\r\n			\'data-placeholder\' => \'selecionar function\' //dropdown\'s data-placeholder:\r\n			)\r\n		);\r\n\r\n		$config = array(\r\n			\'main_table\' => \'tbl_submenu\',\r\n			\'main_table_primary\' => \'submenu_id\',\r\n			\"url\" => base_url() . \'index.php/\' . __CLASS__ . \'/\', //	.$id.\'/add\' //path to method\r\n			\'ajax_loader\' => base_url() . \'ajax-loader.gif\', // path to ajax-loader image. It\'s an optional parameter\r\n			\'segment_name\' =>\'get_functionByIdController\' // It\'s an optional parameter. by default \"get_items\"\r\n		);\r\n\r\n		$mult = new gc_dependent_select($crud, $fields, $config);\r\n\r\n		// the second method:\r\n		$js = $mult->get_js();\r\n\r\n		$output = $crud->render();\r\n\r\n		$output->output.= $js;\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(23,1,'get_functionByIdController','	public function get_functionByIdController($id){\r\n		$functions = $this->Generico->getFunctionByIdController($id);\r\n		\r\n		$arr = array();\r\n		foreach ($functions as $item) {\r\n			array_push($arr, array(\'value\' => $item[\'function_controller_id\'], \'property\' => $item[\'nome_function\']));\r\n		}\r\n		\r\n		echo json_encode($arr);\r\n	}'),(24,1,'estoque','public function estoque(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_estoque\');\r\n		$crud->set_subject(\'Consulta de Estoque\');\r\n		$crud->columns(\'id_loja\',\'id_produto\', \'qtde_minima\', \'qtde_total\', \'ativo\');\r\n		$crud->edit_fields(\'qtde_minima\', \'ativo\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'qtde_minima\',\'Qtde Estoque Minimo\');\r\n		$crud->display_as(\'qtde_total\',\'Qtde Disponível\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->required_fields(\'id_loja\',\'id_produto\', \'movimentacao\', \'qtde_minima\', \'qtde_movimento\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(25,1,'movimentacao_estoque','	public function movimentacao_estoque(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_movimentacao_estoque\');\r\n		$crud->set_subject(\'Movimentação de Estoque\');\r\n		$crud->columns(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\', \'id_item_pedido\');\r\n		$crud->fields(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'tipo_movimentacao\',\'Movimentação de\');\r\n		$crud->display_as(\'qtde_movimentacao\',\'Qtde Movimentação\');\r\n		$crud->display_as(\'data_movimentacao\',\'Data Movimentação\');\r\n		$crud->display_as(\'id_item_pedido\',\'Id Item Pedido\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'data_movimentacao\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		\r\n		$crud->required_fields(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\');\r\n\r\n		$crud->unset_delete();\r\n		$crud->unset_edit();\r\n\r\n		$crud->callback_after_insert(array($this, \'after_insert_update_mov_estoque\'));\r\n		$crud->callback_after_update(array($this, \'after_insert_update_mov_estoque\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(26,1,'after_insert_update_mov_estoque','	public function after_insert_update_mov_estoque($post_array,$primary_key){\r\n		$this->Generico->geraEstoque($post_array[\'id_loja\'], $post_array[\'id_produto\'], $post_array[\'tipo_movimentacao\'], $post_array[\'qtde_movimentacao\']);\r\n		$this->Generico->geraFichaKardex($post_array[\'id_loja\'], $post_array[\'id_produto\'], $post_array[\'tipo_movimentacao\'], \'me\', $post_array[\'qtde_movimentacao\']);\r\n	}'),(27,1,'ficha_kardex','	public function ficha_kardex(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_ficha_kardex\');\r\n		$crud->set_subject(\'Ficha Kardex\');\r\n		$crud->columns(\'id_ficha_kerdex\', \'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'origem_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		$crud->fields(\'id_ficha_kerdex\',\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'origem_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'origem_movimentacao\',\'Origem da Movimentação\');\r\n		$crud->display_as(\'tipo_movimentacao\',\'Movimentação de\');\r\n		$crud->display_as(\'qtde_movimentacao\',\'Qtde Movimentação\');\r\n		$crud->display_as(\'data_movimentacao\',\'Data Movimentação\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'origem_movimentacao\',\'dropdown\', array(\'me\' => \'Movimentação Estoque\', \'nfs\' => \'Nf Saída\', \'nfe\' => \'Nf Entrada\', \'ps\' => \'Pedido no Site\'));\r\n\r\n		$crud->unset_delete();\r\n		$crud->unset_edit();\r\n		$crud->unset_add();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(28,1,'postMoviEstoque','	public function postMoviEstoque(){\r\n		if($_POST){\r\n			$this->Generico->gerarMovimentacao($_POST[\'id_loja\'], $_POST[\'id_produto\'], $_POST[\'tipo_movimentacao\'], $_POST[\'qtde_movimentacao\']);\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(29,1,'afazer','	public function afazer(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_afazer\');\r\n		$crud->set_subject(\'A Fazer\');\r\n		$crud->columns(\'id_afazer\', \'afazer\', \'dt_inicio\', \'dt_fim\', \'realizado\');\r\n		$crud->fields(\'afazer\', \'dt_inicio\', \'dt_fim\', \'realizado\');\r\n		\r\n		$crud->display_as(\'id_afazer\',\'Id A Fazer\');\r\n		$crud->display_as(\'afazer\',\'A Fazer\');\r\n		$crud->display_as(\'dt_inicio\',\'Data Inicio\');\r\n		$crud->display_as(\'dt_fim\',\'Data Fim\');\r\n		$crud->display_as(\'realizado\',\'Realizado\');\r\n\r\n		$crud->field_type(\'realizado\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n\r\n		$crud->required_fields(\'afazer\', \'dt_inicio\', \'realizado\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(30,1,'postAFazer','	public function postAFazer(){\r\n		if($_POST){\r\n			$this->Generico->AFazerRealizado($_POST[\'id_afazer\'], $_POST[\'realizado\']);\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(31,1,'postPedidoEntregue','	public function postPedidoEntregue(){\r\n		if($_POST){\r\n			$this->Generico->AlterarSituacaoPedido($_POST[\'id_pedido\'], \'e\');\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(32,1,'postCancelarPedido','	public function postCancelarPedido(){\r\n		if($_POST){\r\n			$pedido = $this->Generico->getPedidoSolicitados($_POST[\'id_pedido\']);\r\n			foreach ($pedido[0][\'itens\'] as $items) {\r\n				$this->Generico->gerarMovimentacao($pedido[0][\'id_cidade\'], $items[\'id_produto\'], \'c\', $items[\'qtde\'], $items[\'id_item_pedido\']);\r\n				$this->Generico->AlterarSituacaoPedido($_POST[\'id_pedido\'], \'c\');\r\n			}\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(33,1,'ContasAPagar','	public function ContasAPagar(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_apagar\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Cadastrar Contas A Pagar\');\r\n		$crud->columns(\'id_contas_apagar\', \'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\');\r\n		$crud->fields(\'id_conta_gerencial\',\'dt_cadastro\', \'id_fornecedor\', \'dt_venc\', \'valor_apagar\', \'conta_fixa\', \'obs\', \'situacao\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Pagar\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->field_type(\'dt_cadastro\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		$crud->field_type(\'situacao\',\'hidden\', \'a\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n\r\n		$crud->required_fields(\'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\', \'conta_fixa\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(34,1,'PagarAConta','	public function PagarAConta(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_apagar\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Pagar A Contas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\');\r\n		$crud->fields(\'id_contas_apagar\', \'tipo_pagamento\', \'dt_venc\', \'dt_pago\', \'id_conta_corrente\', \'valor_apagar\', \r\n			\'valor_pgto\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'situacao\', \'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Pagar\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_pago\',\'Data Pagamento\'); \r\n		$crud->display_as(\'id_conta_corrente\',\'Conta corrente\');\r\n		$crud->display_as(\'valor_pgto\',\'Valor Pago\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_pagamento\',\'Tipo Pagamento\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_pagamento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$crud->field_type(\'conta_fixa\',\'hidden\');\r\n		$crud->field_type(\'situacao\',\'hidden\', \'p\');\r\n		$crud->field_type(\'id_contas_apagar\',\'hidden\');\r\n		$crud->field_type(\'id_fornecedor\',\'readonly\');\r\n		$crud->field_type(\'id_conta_gerencial\',\'readonly\');\r\n		$crud->field_type(\'dt_venc\',\'readonly\');\r\n		$crud->field_type(\'valor_apagar\',\'readonly\');\r\n\r\n		$crud->required_fields(\'tipo_pagamento\', \'dt_pago\', \'valor_pgto\', \'id_conta_corrente\');\r\n\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->callback_after_update(array($this, \'after_update_contas_apagar\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(35,1,'after_update_contas_apagar','	public function after_update_contas_apagar($post_array,$primary_key){\r\n		if ($post_array[\'conta_fixa\'] == \'s\')\r\n			$this->Generico->geraProximaContaAPagarFixa($primary_key);\r\n	}'),(36,1,'ContasPagas','	public function ContasPagas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_apagar\');\r\n		$crud->where(\'situacao\', \'p\');\r\n		$crud->order_by(\'dt_pago\', \'desc\');\r\n		$crud->set_subject(\'Pagar A Contas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\', \'tipo_pagamento\', \'dt_pago\', \'valor_apagar\');\r\n		$crud->fields(\'id_contas_apagar\', \'tipo_pagamento\', \'dt_venc\', \'dt_pago\', \'id_conta_corrente\', \'valor_apagar\', \r\n			\'valor_pgto\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'situacao\', \'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Pagar\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_pago\',\'Data Pagamento\');\r\n		$crud->display_as(\'id_conta_corrente\',\'Conta Corrente\');\r\n		$crud->display_as(\'valor_pgto\',\'Valor Pago\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_pagamento\',\'Tipo Pagamento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Aberto\', \'p\' => \'Pago\'));\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_pagamento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n		\r\n		$crud->unset_add();\r\n		$crud->unset_edit();\r\n		$crud->unset_delete();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(37,1,'conta_gerencial','	public function conta_gerencial(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_conta_gerencial\');\r\n		$crud->set_subject(\'Contas Gerenciais\');\r\n		$crud->columns(\'nome_conta_gerencial\', \'tipo_conta\', \'id_conta_dre\');\r\n		$crud->fields(\'nome_conta_gerencial\', \'tipo_conta\', \'id_conta_dre\',\r\n					  \'cc_debito\', \'cc_credito\', \'permite_compras\', \'ativo\');\r\n		\r\n		$crud->display_as(\'id_contas_apagar\',\'Id Conta Gerencial\');\r\n		$crud->display_as(\'nome_conta_gerencial\',\'Nome\');\r\n		$crud->display_as(\'tipo_conta\',\'Tipo\');\r\n		$crud->display_as(\'id_conta_dre\',\'Conta DRE\');\r\n		$crud->display_as(\'cc_debito\',\'Conta Débito\');\r\n		$crud->display_as(\'cc_credito\',\'Conta Crédito\');\r\n		$crud->display_as(\'permite_compras\',\'Permite Compra\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->required_fields(\'nome_conta_gerencial\', \'tipo_conta\', \'permite_compras\', \'ativo\');\r\n\r\n		$crud->field_type(\'tipo_conta\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\'));\r\n		$crud->field_type(\'permite_compras\',\'dropdown\', array(\'S\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativo\', \'n\' => \'Desativado\'));\r\n\r\n		$crud->set_relation(\'id_conta_dre\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'id_conta_dre\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(38,1,'conta_corrente','	public function conta_corrente(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_conta_corrente\');\r\n		$crud->set_subject(\'Contas Corrente\');\r\n		$crud->columns(\'nome_conta_corrente\', \'interna\', \'banco\', \'principal\');\r\n		$crud->fields(\'nome_conta_corrente\', \'interna\', \'banco\', \'agencia\', \'digito_ag\', \r\n			\'conta_corrente\', \'digito_cc\', \'principal\', \'ativo\');\r\n		\r\n		$crud->display_as(\'id_conta_corrente\',\'Id Conta Corrente\');\r\n		$crud->display_as(\'nome_conta_corrente\',\'Nome\');\r\n		$crud->display_as(\'interna\',\'Interna\');\r\n		$crud->display_as(\'banco\',\'Banco\');\r\n		$crud->display_as(\'agencia\',\'Nr. Agência\');\r\n		$crud->display_as(\'digito_ag\',\'Digito Ag\');\r\n		$crud->display_as(\'conta_corrente\',\'Nr. Conta Corrente\');\r\n		$crud->display_as(\'digito_cc\',\'Digíto Cc\');\r\n		$crud->display_as(\'principal\',\'Principal\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->required_fields(\'nome_conta_corrente\', \'interna\');\r\n\r\n		$crud->field_type(\'interna\',\'dropdown\', array(\'S\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativo\', \'n\' => \'Desativado\'));\r\n		$crud->field_type(\'principal\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		\r\n		$crud->set_relation(\'banco\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'banco\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(39,1,'ContasAReceber','	public function ContasAReceber(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_areceber\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Cadastrar Contas A Receber\');\r\n		$crud->columns(\'id_contas_areceber\', \'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\');\r\n		$crud->fields(\'id_conta_gerencial\',\'dt_cadastro\', \'id_fornecedor\', \'dt_venc\', \'valor_areceber\', \'conta_fixa\', \'nr_vezes\', \'obs\', \'situacao\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_areceber\',\'Valor A Receber\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Vezes\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->field_type(\'dt_cadastro\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		$crud->field_type(\'situacao\',\'hidden\', \'a\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'nr_vezes\',\'dropdown\', \r\n			array(\'1\' => \'1x\', \'2\' => \'2x\', \'3\' => \'3x\', \'4\' => \'4x\', \'5\' => \'5x\', \'6\' => \'6x\', \'7\' => \'7x\', \'8\' => \'8x\',\r\n			\'9\' => \'9x\'  , \'10\' => \'10x\', \'11\' => \'11x\', \'12\' => \'12x\', \'13\' => \'13x\', \'14\' => \'14x\', \'15\' => \'15x\', \'16\' => \'16x\',\r\n			\'17\' => \'17x\', \'18\' => \'18x\', \'19\' => \'19x\', \'20\' => \'20x\', \'21\' => \'21x\', \'22\' => \'22x\', \'23\' => \'23x\', \'24\' => \'24x\',\r\n			\'25\' => \'25x\', \'26\' => \'26x\', \'27\' => \'27x\', \'28\' => \'28x\', \'29\' => \'29x\', \'30\' => \'30x\', \'31\' => \'31x\', \'32\' => \'32x\',\r\n			\'33\' => \'33x\', \'34\' => \'34x\', \'35\' => \'35x\', \'36\' => \'36x\'));\r\n\r\n		$crud->required_fields(\'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\', \'conta_fixa\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(40,1,'ReceberAConta','	public function ReceberAConta(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_areceber\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Receber A Contas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\');\r\n		$crud->fields(\'id_contas_areceber\', \'tipo_recebimento\', \'dt_venc\', \'dt_recebido\', \'id_conta_corrente\', \r\n			\'valor_areceber\', \'valor_recebido\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'nr_vezes\', \'situacao\', \r\n			\'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_areceber\',\'Valor A Receber\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Parcela\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_recebido\',\'Data Recebimento\'); \r\n		$crud->display_as(\'id_conta_corrente\',\'Conta corrente\');\r\n		$crud->display_as(\'valor_recebido\',\'Valor Recebido\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_recebimento\',\'Tipo Recebimento\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_recebimento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$crud->field_type(\'conta_fixa\',\'hidden\');\r\n		$crud->field_type(\'nr_vezes\',\'readonly\');\r\n		$crud->field_type(\'situacao\',\'hidden\', \'r\');\r\n		$crud->field_type(\'id_contas_areceber\',\'hidden\');\r\n		$crud->field_type(\'id_fornecedor\',\'readonly\');\r\n		$crud->field_type(\'id_conta_gerencial\',\'readonly\');\r\n		$crud->field_type(\'dt_venc\',\'readonly\');\r\n		$crud->field_type(\'valor_areceber\',\'readonly\');\r\n\r\n		$crud->required_fields(\'tipo_recebimento\', \'dt_recebido\', \'valor_recebido\', \'id_conta_corrente\');\r\n\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->callback_after_update(array($this, \'after_update_contas_areceber\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(41,1,'after_update_contas_areceber','	public function after_update_contas_areceber($post_array,$primary_key){\r\n		if ($post_array[\'conta_fixa\'] == \'s\')\r\n			$this->Generico->geraProximaContaAReceberFixa($primary_key);\r\n		else \r\n			$this->Generico->geraProximaContaAReceberFixa($primary_key, TRUE);\r\n	}'),(42,1,'ContasRecebidas','	public function ContasRecebidas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_areceber\');\r\n		$crud->where(\'situacao\', \'r\');\r\n		$crud->order_by(\'dt_recebido\', \'desc\');\r\n		$crud->set_subject(\'Contas Recebidas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\', \'tipo_recebimento\', \'dt_recebido\', \'valor_recebido\');\r\n		$crud->fields(\'id_contas_apagar\', \'tipo_recebimento\', \'dt_venc\', \'dt_recebido\', \'id_conta_corrente\', \'valor_apagar\', \r\n			\'valor_pgto\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'nr_vezes\', \'situacao\', \'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Receber\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Parcela\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_recebido\',\'Data Recebimento\');\r\n		$crud->display_as(\'id_conta_corrente\',\'Conta Corrente\');\r\n		$crud->display_as(\'valor_pgto\',\'Valor Pago\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_recebimento\',\'Tipo Recebimento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n\r\n		$crud->field_type(\'nr_vezes\',\'readonly\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Aberto\', \'r\' => \'Recebido\'));\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_recebimento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n		\r\n		$crud->unset_add();\r\n		$crud->unset_edit();\r\n		$crud->unset_delete();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}');

UNLOCK TABLES;

/*Table structure for table `tbl_item_pedido` */

DROP TABLE IF EXISTS `tbl_item_pedido`;

CREATE TABLE `tbl_item_pedido` (
  `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ItensPedido',
  `id_pedido` int(11) NOT NULL COMMENT 'Pedidos',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `id_categoria_produto` int(11) NOT NULL COMMENT 'categoria',
  `qtde` decimal(6,0) NOT NULL,
  `valor_unitario` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `tbl_item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`),
  CONSTRAINT `tbl_item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_item_pedido` */

LOCK TABLES `tbl_item_pedido` WRITE;

insert  into `tbl_item_pedido`(`id_item_pedido`,`id_pedido`,`id_produto`,`id_categoria_produto`,`qtde`,`valor_unitario`) values (21,15,15,0,40,0.45),(22,15,16,0,5,0.45),(23,15,17,0,5,0.45),(24,16,13,0,15,0.45),(25,16,14,0,20,0.45),(26,16,15,0,15,0.45),(27,16,17,0,10,0.45),(28,16,18,0,10,0.45),(52,26,13,0,25,0.45),(53,26,14,0,25,0.45),(54,26,15,0,25,0.45),(55,26,18,0,25,0.45),(56,27,14,0,15,0.45),(57,27,17,0,15,0.45),(59,28,13,0,10,0.45),(60,28,14,0,20,0.45),(61,28,15,0,10,0.45),(62,28,16,0,20,0.45),(63,28,17,0,10,0.45),(64,28,18,0,30,0.45),(72,31,15,3,50,0.45),(73,31,39,3,50,0.45);

UNLOCK TABLES;

/*Table structure for table `tbl_loja` */

DROP TABLE IF EXISTS `tbl_loja`;

CREATE TABLE `tbl_loja` (
  `id_loja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Lojas',
  `nome_proprietario` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `nr_inscricao_muni` varchar(20) DEFAULT NULL,
  `cnae` varchar(250) DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `data_abertura` date NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(150) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `uf` varchar(10) NOT NULL,
  PRIMARY KEY (`id_loja`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabela de cadastro das lojas filiais';

/*Data for the table `tbl_loja` */

LOCK TABLES `tbl_loja` WRITE;

insert  into `tbl_loja`(`id_loja`,`nome_proprietario`,`cpf`,`razao_social`,`nome_fantasia`,`cnpj`,`nr_inscricao_muni`,`cnae`,`data_nascimento`,`data_abertura`,`endereco`,`numero`,`complemento`,`bairro`,`cep`,`municipio`,`uf`) values (1,'Matheus de Mello','36848874809','MATHEUS DE MELLO 36848874809','MISTER SALGADINHOS','29837475000119','20048716','56.20-1/04 - Fornecimento de alimentos preparados preponderantemente para consumo domiciliar','2018-03-03','2018-03-03','Prudente de Morais','532',NULL,'Centro','14015-100','Ribeirão Preto','SP'),(2,'Matheus de Mello','36848874809','MATHEUS DE MELLO 36848874809','MISTER SALGADINHOS - Pontal','29837475000119','20048716','56.20-1/04 - Fornecimento de alimentos preparados preponderantemente para consumo domiciliar','2018-03-03','2018-03-03','Prudente de Morais','532',NULL,'Centro','14015-100','Ribeirão Preto','SP');

UNLOCK TABLES;

/*Table structure for table `tbl_menu` */

DROP TABLE IF EXISTS `tbl_menu`;

CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_menu` varchar(80) NOT NULL,
  `menu_titulo` varchar(80) DEFAULT NULL,
  `tag_i` varchar(50) DEFAULT NULL,
  `order` decimal(10,3) DEFAULT NULL,
  `ativo` char(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_menu` */

LOCK TABLES `tbl_menu` WRITE;

insert  into `tbl_menu`(`menu_id`,`nome_menu`,`menu_titulo`,`tag_i`,`order`,`ativo`) values (1,'Painel de Controle','Principal','ti-panel',1.000,'a'),(2,'Configurações','Configurações','ti-settings',2.000,'a'),(3,'Manutenção','Cadastro Básico','ti-view-list-alt',3.000,'a'),(4,'Estoque','Movimentação','ti-layers-alt',4.000,'a'),(5,'Produtos',NULL,'ti-files',3.100,'a'),(6,'Pedidos',NULL,'ti-book',4.100,'a'),(7,'A Fazer','Meta','ti-bookmark',6.000,'a'),(8,'Pagamento','Financeiro','ti-receipt',5.000,'a'),(9,'Cadastro de Conta',NULL,'ti-archive',5.200,'a'),(10,'Recebimento',NULL,'ti-pencil-alt',5.100,'a');

UNLOCK TABLES;

/*Table structure for table `tbl_movimentacao_estoque` */

DROP TABLE IF EXISTS `tbl_movimentacao_estoque`;

CREATE TABLE `tbl_movimentacao_estoque` (
  `id_movimentacao_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `tipo_movimentacao` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'e - entrada / s - sainda / a - ajuste / t - transferencia / c - cancelado',
  `qtde_movimentacao` decimal(6,0) DEFAULT NULL,
  `data_movimentacao` datetime DEFAULT NULL,
  `id_item_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_movimentacao_estoque`),
  KEY `FK_MOV_ESTQ_LOJA` (`id_loja`),
  KEY `FK_MOV_ESTQ_PROD` (`id_produto`),
  KEY `FK_MOV_ESTQ_ITEM_PEDIDO` (`id_item_pedido`)
) ENGINE=MyISAM AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_movimentacao_estoque` */

LOCK TABLES `tbl_movimentacao_estoque` WRITE;

insert  into `tbl_movimentacao_estoque`(`id_movimentacao_estoque`,`id_loja`,`id_produto`,`tipo_movimentacao`,`qtde_movimentacao`,`data_movimentacao`,`id_item_pedido`) values (11,1,14,'e',0,'2018-07-17 16:18:08',NULL),(12,1,39,'e',0,'2018-07-17 16:19:00',NULL),(13,1,15,'e',0,'2018-07-17 16:19:26',NULL),(14,1,16,'e',0,'2018-07-17 16:19:26',NULL),(15,1,17,'e',0,'2018-07-17 16:19:57',NULL),(16,1,18,'e',0,'2018-07-17 16:19:57',NULL),(17,1,13,'e',0,'2018-07-17 16:19:57',NULL),(18,1,14,'e',186,'2018-07-19 14:53:09',0),(19,1,18,'e',81,'2018-07-19 14:58:07',0),(20,1,39,'e',78,'2018-07-19 14:59:08',0),(21,1,16,'e',140,'2018-07-19 14:59:48',0),(22,1,15,'e',102,'2018-07-19 15:00:12',0),(23,1,15,'s',50,'2018-07-23 09:37:39',72),(24,1,39,'s',50,'2018-07-23 09:37:39',73),(40,2,14,'e',470,'2018-07-27 11:03:44',NULL),(39,2,16,'e',200,'2018-07-27 11:03:44',NULL),(38,2,39,'e',46,'2018-07-27 11:03:44',NULL),(37,1,39,'e',100,'2018-07-27 11:03:08',0),(36,1,15,'e',100,'2018-07-27 11:02:50',0),(35,1,18,'s',7,'2018-07-27 10:23:18',0),(34,1,15,'s',8,'2018-07-27 10:23:06',0),(33,1,14,'s',10,'2018-07-27 10:22:54',0),(41,2,15,'e',267,'2018-07-27 11:03:44',NULL),(42,2,39,'e',50,'2018-07-27 11:03:44',NULL),(43,2,39,'s',46,'2018-07-27 12:28:19',0),(44,2,15,'s',15,'2018-07-31 08:10:32',0),(45,2,14,'s',15,'2018-07-31 08:10:52',0),(46,1,39,'s',50,'2018-07-31 08:13:54',0),(47,1,18,'s',74,'2018-07-31 08:14:13',0),(48,2,15,'s',100,'2018-07-31 08:15:58',0),(49,2,14,'s',100,'2018-07-31 08:16:17',0),(50,2,39,'s',50,'2018-07-31 08:16:32',0),(51,2,16,'s',100,'2018-07-31 08:17:20',0),(52,1,14,'s',25,'2018-07-31 17:07:31',0),(53,1,39,'s',25,'2018-07-31 17:07:39',0),(54,1,15,'s',25,'2018-07-31 17:07:48',0),(55,1,16,'s',25,'2018-07-31 17:08:00',0),(56,1,15,'s',50,'2018-08-04 13:05:19',0),(57,1,14,'s',5,'2018-08-06 08:54:30',0),(58,1,39,'s',5,'2018-08-06 08:54:38',0),(59,1,15,'s',5,'2018-08-06 08:54:44',0),(60,1,16,'s',5,'2018-08-06 08:54:55',0),(61,1,18,'s',2,'2018-08-06 08:55:10',0),(62,1,15,'e',45,'2018-08-06 09:24:59',0),(63,1,18,'e',100,'2018-08-06 09:46:46',0),(64,1,16,'e',44,'2018-08-06 09:47:10',0),(65,2,16,'s',50,'2018-08-06 09:47:23',0),(66,2,14,'s',50,'2018-08-06 09:47:34',0),(67,2,15,'s',50,'2018-08-06 09:47:44',0),(68,2,18,'e',50,'2018-08-06 09:47:58',NULL),(69,1,18,'e',2,'2018-08-06 09:59:00',0),(70,1,39,'s',12,'2018-08-06 10:31:10',0),(71,1,16,'s',12,'2018-08-06 10:31:16',0),(72,2,15,'s',62,'2018-08-06 10:59:50',0),(73,2,14,'s',5,'2018-08-06 11:13:41',0),(74,1,14,'s',5,'2018-08-07 10:01:08',0),(75,1,15,'s',5,'2018-08-07 10:01:17',0),(76,1,16,'s',5,'2018-08-07 10:01:29',0),(77,1,18,'s',5,'2018-08-07 10:01:38',0),(78,1,39,'s',10,'2018-08-08 10:48:24',0),(79,1,15,'s',5,'2018-08-08 10:48:34',0),(80,1,16,'s',5,'2018-08-08 10:48:43',0),(81,1,18,'s',5,'2018-08-08 10:48:52',0),(82,1,39,'s',10,'2018-08-08 11:55:58',0),(83,1,15,'s',5,'2018-08-08 11:56:11',0),(84,1,16,'s',5,'2018-08-08 11:56:21',0),(85,1,18,'s',5,'2018-08-08 11:56:34',0),(86,1,14,'s',30,'2018-08-08 13:25:48',0),(87,1,15,'s',30,'2018-08-08 13:25:58',0),(88,1,16,'s',20,'2018-08-08 13:26:09',0),(89,1,18,'s',20,'2018-08-08 13:26:25',0),(90,1,16,'s',107,'2018-08-08 16:03:04',0),(91,1,18,'s',5,'2018-08-08 16:03:19',0),(92,1,14,'s',5,'2018-08-08 16:06:00',0),(93,1,39,'s',5,'2018-08-08 16:06:08',0),(94,1,14,'e',44,'2018-08-08 16:53:10',0),(95,1,15,'e',36,'2018-08-08 16:53:20',0),(96,1,39,'s',11,'2018-08-08 16:53:32',0),(97,1,15,'e',250,'2018-08-09 08:12:09',0),(98,1,14,'e',268,'2018-08-09 08:12:54',0),(99,1,39,'e',125,'2018-08-09 08:18:22',0),(100,1,16,'e',235,'2018-08-09 08:18:39',0),(101,1,18,'e',153,'2018-08-09 08:22:29',0),(102,1,39,'s',10,'2018-08-09 08:23:10',0),(103,1,15,'s',5,'2018-08-09 08:25:28',0),(104,1,16,'s',5,'2018-08-09 08:25:46',0),(105,1,18,'s',5,'2018-08-09 08:25:58',0),(106,1,39,'s',10,'2018-08-09 14:18:40',0),(107,1,14,'s',10,'2018-08-09 14:18:53',0),(108,1,15,'s',10,'2018-08-09 14:19:00',0),(109,1,16,'s',10,'2018-08-09 14:19:13',0),(110,1,39,'s',5,'2018-08-09 14:20:35',0),(111,1,15,'s',5,'2018-08-09 14:21:01',0),(112,1,16,'s',5,'2018-08-09 14:21:10',0),(113,1,18,'s',5,'2018-08-09 14:21:20',0),(114,1,14,'s',5,'2018-08-10 13:54:34',0),(115,1,39,'s',5,'2018-08-10 13:54:43',0),(116,1,15,'s',5,'2018-08-10 13:54:53',0),(117,1,16,'s',5,'2018-08-10 13:55:04',0),(118,1,18,'s',5,'2018-08-10 13:55:11',0),(119,1,16,'s',40,'2018-08-10 15:35:54',0),(120,1,15,'s',30,'2018-08-10 15:36:10',0),(121,1,39,'s',30,'2018-08-10 15:38:27',0),(122,1,14,'s',10,'2018-08-10 15:38:49',0),(123,1,15,'s',10,'2018-08-10 15:38:56',0),(124,1,18,'s',5,'2018-08-10 15:39:04',0),(125,1,15,'s',20,'2018-08-10 16:18:29',0),(126,1,14,'s',10,'2018-08-10 16:18:44',0),(127,1,18,'s',10,'2018-08-10 16:18:52',0),(128,1,14,'s',10,'2018-08-11 11:19:49',0),(129,1,18,'s',5,'2018-08-11 11:19:58',0),(130,1,14,'e',244,'2018-08-13 07:30:35',0),(131,1,15,'s',34,'2018-08-13 07:31:06',0),(132,1,18,'e',140,'2018-08-13 07:31:48',0),(133,1,16,'e',218,'2018-08-13 07:32:52',0),(134,1,39,'s',5,'2018-08-13 07:33:06',0),(135,1,15,'s',30,'2018-08-13 08:10:47',0),(136,1,16,'s',10,'2018-08-13 08:11:04',0),(137,1,14,'s',5,'2018-08-13 08:57:49',0),(138,1,39,'s',5,'2018-08-13 08:58:01',0),(139,1,15,'s',5,'2018-08-13 08:58:10',0),(140,1,16,'s',5,'2018-08-13 08:58:40',0),(141,1,14,'s',5,'2018-08-14 07:10:26',0),(142,1,39,'s',5,'2018-08-14 07:10:33',0),(143,1,15,'s',5,'2018-08-14 07:10:45',0),(144,1,16,'s',5,'2018-08-14 07:10:52',0),(145,2,16,'s',50,'2018-08-14 07:11:19',0),(146,2,14,'s',300,'2018-08-14 07:11:29',0),(147,2,15,'s',40,'2018-08-14 07:11:36',0),(148,2,18,'s',50,'2018-08-14 07:11:44',0),(149,1,14,'s',5,'2018-08-14 09:01:16',0),(150,1,39,'s',5,'2018-08-14 09:01:51',0),(151,1,15,'s',5,'2018-08-14 09:02:00',0),(152,1,16,'s',5,'2018-08-14 09:02:08',0),(153,1,18,'s',5,'2018-08-14 09:02:15',0),(154,1,14,'s',20,'2018-08-14 13:51:55',0),(155,1,39,'s',20,'2018-08-14 13:52:03',0),(156,1,15,'s',20,'2018-08-14 13:52:10',0),(157,1,15,'s',20,'2018-08-14 13:52:18',0),(158,1,16,'s',20,'2018-08-14 13:52:34',0),(159,1,18,'s',20,'2018-08-14 13:52:41',0),(160,1,39,'s',5,'2018-08-14 14:48:57',0),(161,1,14,'s',5,'2018-08-14 14:49:05',0),(162,1,15,'s',5,'2018-08-14 14:49:10',0),(163,1,14,'e',5,'2018-08-14 14:49:22',0),(164,1,16,'s',5,'2018-08-14 14:49:31',0),(165,1,18,'s',5,'2018-08-14 14:49:40',0),(166,1,15,'s',5,'2018-08-14 14:50:16',0),(167,1,16,'s',20,'2018-08-15 14:34:15',0),(168,1,14,'s',10,'2018-08-15 14:34:22',0),(169,1,15,'s',10,'2018-08-15 14:34:30',0),(170,1,18,'s',10,'2018-08-15 14:34:39',0),(171,1,14,'s',50,'2018-08-15 14:34:50',0),(172,1,15,'s',50,'2018-08-15 14:34:59',0),(173,1,16,'s',50,'2018-08-15 14:35:14',0),(174,1,18,'s',50,'2018-08-15 14:35:22',0),(175,1,14,'s',9,'2018-08-15 15:16:58',0),(176,1,39,'s',5,'2018-08-15 15:17:12',0),(177,1,15,'s',5,'2018-08-15 15:17:26',0),(178,1,16,'s',5,'2018-08-15 15:17:36',0),(179,1,18,'s',5,'2018-08-15 15:17:46',0),(180,1,14,'s',10,'2018-08-15 16:45:57',0),(181,1,15,'s',10,'2018-08-15 16:46:08',0),(182,1,16,'s',10,'2018-08-15 16:46:23',0),(183,1,14,'s',10,'2018-08-16 08:56:58',0),(184,1,14,'s',1,'2018-08-16 08:57:06',0),(185,1,16,'s',10,'2018-08-16 08:57:15',0),(186,1,18,'s',10,'2018-08-16 08:57:30',0),(187,1,14,'s',25,'2018-08-16 09:44:13',0),(188,1,16,'s',25,'2018-08-16 09:44:22',0),(189,1,18,'s',25,'2018-08-16 09:44:30',0),(190,1,16,'s',168,'2018-08-16 11:49:45',0),(191,1,18,'s',138,'2018-08-16 11:50:14',0),(192,1,15,'s',61,'2018-08-18 06:31:05',0),(193,1,16,'s',50,'2018-08-18 06:31:14',0),(194,1,18,'e',200,'2018-08-18 07:47:52',0),(195,1,16,'e',191,'2018-08-18 07:48:21',0),(196,1,39,'s',15,'2018-08-18 07:48:37',0),(197,1,15,'e',168,'2018-08-18 07:49:05',0),(198,1,39,'e',168,'2018-08-18 07:49:13',0),(199,1,15,'s',168,'2018-08-18 07:49:21',0),(200,1,14,'e',377,'2018-08-18 07:49:32',0),(201,1,14,'s',2,'2018-08-18 08:23:35',0),(202,1,39,'s',10,'2018-08-18 08:23:53',0),(203,1,16,'s',15,'2018-08-18 08:24:02',0),(204,1,14,'s',25,'2018-08-18 08:24:13',0),(205,1,39,'s',25,'2018-08-18 08:24:21',0),(206,1,16,'s',25,'2018-08-18 08:24:30',0),(207,1,18,'s',25,'2018-08-18 08:24:38',0),(208,1,16,'s',10,'2018-08-18 09:37:48',0),(209,1,16,'s',10,'2018-08-18 09:37:49',0),(210,1,18,'s',5,'2018-08-18 09:37:59',0),(211,1,14,'s',5,'2018-08-18 09:38:10',0),(212,1,39,'s',50,'2018-08-18 12:45:06',0),(213,1,16,'s',10,'2018-08-18 13:59:00',0),(214,1,39,'s',5,'2018-08-18 13:59:27',0),(215,1,14,'s',5,'2018-08-18 13:59:38',0),(216,1,39,'s',10,'2018-08-18 15:29:13',0),(217,1,14,'s',10,'2018-08-18 15:29:25',0),(218,1,16,'s',25,'2018-08-18 16:09:38',0),(219,1,18,'s',25,'2018-08-18 16:09:46',0),(220,1,39,'s',10,'2018-08-22 08:17:36',0),(221,1,14,'s',10,'2018-08-22 08:17:46',0),(222,1,16,'s',10,'2018-08-22 08:24:30',0),(223,1,18,'s',10,'2018-08-22 08:24:42',0),(224,1,14,'s',10,'2018-08-22 09:06:25',0),(225,1,39,'s',10,'2018-08-22 09:06:33',0),(226,1,16,'s',20,'2018-08-22 09:07:16',0),(227,1,39,'s',15,'2018-08-22 16:24:54',0),(228,1,16,'s',15,'2018-08-22 16:25:04',0),(229,1,18,'s',10,'2018-08-22 16:25:15',0),(230,1,14,'s',10,'2018-08-22 16:25:31',0),(231,1,15,'e',150,'2018-08-23 07:19:32',0),(232,1,39,'e',150,'2018-08-23 07:19:40',0),(233,1,16,'e',150,'2018-08-23 07:19:55',0),(234,1,14,'s',10,'2018-08-23 10:08:11',0),(235,1,15,'s',10,'2018-08-23 10:08:19',0),(236,1,39,'s',20,'2018-08-23 11:19:24',0),(237,1,15,'s',20,'2018-08-23 11:19:33',0),(238,1,16,'s',20,'2018-08-23 11:19:44',0),(239,1,18,'s',20,'2018-08-23 11:19:51',0),(240,1,14,'e',1,'2018-08-23 12:07:20',NULL),(241,1,14,'s',1,'2018-08-23 12:07:29',NULL),(242,1,39,'s',20,'2018-08-23 14:55:38',NULL),(243,1,14,'s',10,'2018-08-23 14:55:49',NULL),(244,1,15,'s',10,'2018-08-23 14:56:00',NULL),(245,1,18,'s',10,'2018-08-23 14:56:08',NULL),(246,1,14,'s',10,'2018-08-23 14:59:50',NULL),(247,1,39,'s',10,'2018-08-23 14:59:56',NULL),(248,1,15,'s',10,'2018-08-23 15:00:16',NULL),(249,1,16,'s',10,'2018-08-23 15:00:22',NULL),(250,1,14,'e',1,'2018-08-24 10:51:33',NULL),(251,1,14,'s',1,'2018-08-24 11:01:18',NULL),(252,1,14,'s',20,'2018-08-24 15:31:01',NULL),(253,1,39,'s',10,'2018-08-24 15:31:10',NULL),(254,1,15,'s',20,'2018-08-24 15:31:16',NULL),(255,1,16,'s',20,'2018-08-24 15:31:22',NULL),(256,1,18,'s',10,'2018-08-24 15:31:31',NULL),(266,1,15,'s',25,'2018-08-27 16:04:25',NULL),(265,1,15,'s',5,'2018-08-27 15:06:51',NULL),(264,1,14,'s',5,'2018-08-27 15:06:44',NULL),(263,1,39,'s',15,'2018-08-27 15:06:35',NULL),(257,1,14,'s',25,'2018-08-25 06:47:26',NULL),(262,1,14,'e',25,'2018-08-25 06:47:53',NULL),(267,1,39,'s',25,'2018-08-27 16:04:34',NULL),(268,1,39,'s',54,'2018-08-27 16:15:29',NULL),(269,1,15,'s',5,'2018-08-27 16:15:35',NULL),(270,1,39,'e',65,'2018-08-29 08:11:43',NULL),(271,1,15,'e',30,'2018-08-29 08:11:57',NULL),(272,1,16,'e',40,'2018-08-29 08:12:17',NULL),(273,1,39,'s',75,'2018-08-29 08:24:27',NULL),(274,1,15,'s',75,'2018-08-29 08:24:31',NULL),(275,1,16,'s',75,'2018-08-29 08:24:43',NULL),(276,1,39,'e',25,'2018-08-29 08:24:48',NULL),(277,1,15,'e',100,'2018-08-30 07:47:09',NULL),(278,1,39,'e',100,'2018-08-30 07:47:14',NULL),(279,1,39,'s',25,'2018-08-30 09:28:08',NULL),(280,1,15,'e',25,'2018-08-30 09:28:11',NULL),(281,1,15,'s',50,'2018-08-30 09:28:27',NULL),(282,1,18,'s',25,'2018-08-30 09:28:37',NULL),(283,1,16,'s',25,'2018-08-30 09:28:56',NULL),(284,1,14,'s',25,'2018-08-30 09:29:02',NULL),(285,1,16,'s',50,'2018-08-30 11:30:57',NULL),(286,1,14,'s',40,'2018-08-30 11:31:25',NULL),(287,1,18,'s',30,'2018-08-30 11:31:32',NULL),(288,1,18,'s',11,'2018-08-30 11:53:44',NULL),(289,1,39,'e',100,'2018-08-31 08:24:13',NULL),(290,1,16,'e',114,'2018-08-31 08:27:02',NULL),(291,1,15,'e',30,'2018-08-31 08:28:00',NULL),(292,1,18,'s',26,'2018-08-31 08:30:47',NULL),(293,1,39,'s',60,'2018-08-31 09:04:31',NULL),(294,1,14,'s',10,'2018-08-31 09:04:40',NULL),(295,1,15,'s',10,'2018-08-31 09:04:59',NULL),(296,1,18,'s',10,'2018-08-31 09:05:10',NULL),(297,1,39,'s',100,'2018-08-31 10:09:52',NULL),(298,1,15,'s',95,'2018-08-31 10:09:58',NULL),(299,1,18,'s',20,'2018-08-31 11:45:55',NULL),(300,1,39,'s',10,'2018-08-31 11:46:04',NULL),(301,1,16,'s',15,'2018-08-31 11:46:30',NULL),(302,1,14,'s',10,'2018-08-31 11:46:38',NULL),(303,1,39,'s',30,'2018-08-31 12:12:08',NULL),(304,1,16,'s',25,'2018-08-31 12:12:17',NULL),(305,1,14,'s',50,'2018-08-31 12:12:25',NULL),(306,1,14,'e',50,'2018-09-01 06:05:38',NULL),(307,1,15,'e',104,'2018-09-01 06:05:46',NULL),(308,1,18,'e',100,'2018-09-01 06:05:54',NULL),(309,1,16,'s',10,'2018-09-01 06:07:34',NULL),(310,1,15,'e',25,'2018-09-03 12:24:25',NULL),(311,1,15,'s',10,'2018-09-03 12:24:32',NULL),(312,1,18,'s',10,'2018-09-03 12:25:22',NULL),(313,1,16,'s',10,'2018-09-03 12:26:17',NULL),(314,1,14,'s',10,'2018-09-03 12:26:28',NULL),(315,1,15,'s',5,'2018-09-04 10:57:50',NULL),(316,1,16,'s',5,'2018-09-04 10:57:56',NULL),(317,1,18,'s',15,'2018-09-04 10:58:02',NULL),(318,1,14,'s',10,'2018-09-05 06:56:08',NULL),(319,1,15,'s',10,'2018-09-05 06:56:14',NULL),(320,1,16,'s',10,'2018-09-05 06:56:20',NULL),(321,1,18,'s',10,'2018-09-05 06:56:25',NULL),(322,1,15,'e',150,'2018-09-05 09:10:53',NULL),(323,1,18,'s',12,'2018-09-05 09:11:23',NULL),(324,1,39,'e',150,'2018-09-05 09:11:32',NULL),(325,1,16,'e',140,'2018-09-05 09:11:48',NULL),(326,1,18,'s',10,'2018-09-06 11:55:17',NULL),(327,1,39,'s',20,'2018-09-06 11:55:25',NULL),(328,1,16,'s',5,'2018-09-06 11:57:26',NULL),(329,1,14,'s',100,'2018-09-06 12:29:17',NULL),(330,1,15,'s',100,'2018-09-06 12:29:24',NULL),(331,1,16,'s',100,'2018-09-06 12:29:33',NULL),(332,1,39,'s',50,'2018-09-06 13:17:46',NULL),(333,1,15,'s',50,'2018-09-06 13:17:49',NULL),(334,1,39,'s',10,'2018-09-06 13:58:57',NULL),(335,1,18,'s',10,'2018-09-06 13:59:08',NULL),(336,1,16,'s',10,'2018-09-06 13:59:31',NULL),(337,1,15,'s',10,'2018-09-06 13:59:42',NULL),(338,1,39,'s',5,'2018-09-11 12:41:47',NULL),(339,1,39,'s',0,'2018-09-11 12:41:50',NULL),(340,1,15,'e',5,'2018-09-11 12:41:56',NULL),(341,1,16,'s',5,'2018-09-11 12:42:00',NULL),(342,1,18,'s',5,'2018-09-11 12:42:05',NULL),(343,1,39,'s',20,'2018-09-11 12:42:18',NULL),(344,1,18,'s',10,'2018-09-11 12:42:27',NULL),(345,1,14,'s',5,'2018-09-11 12:42:32',NULL),(346,1,15,'e',150,'2018-09-11 12:43:43',NULL),(347,1,39,'e',150,'2018-09-11 12:43:49',NULL),(348,1,16,'e',150,'2018-09-11 12:43:56',NULL),(349,1,18,'e',50,'2018-09-11 12:44:00',NULL),(350,1,39,'s',20,'2018-09-11 13:52:52',NULL),(351,1,15,'s',20,'2018-09-11 13:52:59',NULL),(352,1,18,'s',20,'2018-09-11 13:53:07',NULL),(353,1,14,'s',5,'2018-09-11 14:53:12',NULL),(354,1,39,'s',5,'2018-09-11 14:53:16',NULL),(355,1,15,'s',5,'2018-09-11 14:53:19',NULL),(356,1,16,'s',5,'2018-09-11 14:53:23',NULL),(357,1,18,'s',5,'2018-09-11 14:53:27',NULL),(358,1,16,'s',10,'2018-09-11 14:57:36',NULL),(359,1,15,'s',10,'2018-09-11 14:57:44',NULL),(360,1,14,'s',5,'2018-09-11 14:57:47',NULL),(361,1,18,'s',25,'2018-09-13 08:01:37',NULL);

UNLOCK TABLES;

/*Table structure for table `tbl_newsletter` */

DROP TABLE IF EXISTS `tbl_newsletter`;

CREATE TABLE `tbl_newsletter` (
  `id_newsletter` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Newsletters',
  `email` varchar(255) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `data_criacao` date NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_newsletter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newslatter';

/*Data for the table `tbl_newsletter` */

LOCK TABLES `tbl_newsletter` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_pagina_principal` */

DROP TABLE IF EXISTS `tbl_pagina_principal`;

CREATE TABLE `tbl_pagina_principal` (
  `id_pagina_principal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pagina_principals',
  `titulo` varchar(250) NOT NULL,
  `sub_titulo` varchar(250) NOT NULL,
  `capa_principal` varchar(150) NOT NULL,
  `capa1` varchar(150) DEFAULT NULL,
  `capa2` varchar(150) DEFAULT NULL,
  `capa3` varchar(150) DEFAULT NULL,
  `capa4` varchar(150) DEFAULT NULL,
  `situacao` char(1) NOT NULL COMMENT 'a - ativo / d - desativado',
  PRIMARY KEY (`id_pagina_principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cadastro da Pagina Principal';

/*Data for the table `tbl_pagina_principal` */

LOCK TABLES `tbl_pagina_principal` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_pedido` */

DROP TABLE IF EXISTS `tbl_pedido`;

CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pedidos',
  `id_cliente` int(11) NOT NULL COMMENT 'Clientes',
  `id_cidade` int(11) NOT NULL COMMENT 'Cidades',
  `situacao` char(1) NOT NULL COMMENT 's - solicitado / v - visualizado / p - produzindo / t - saiu entrega / e - entregue / c - cancelado',
  `data_pedido` datetime NOT NULL,
  `valor` decimal(6,2) DEFAULT NULL,
  `valor_total` decimal(6,2) DEFAULT NULL,
  `forma_pgto` char(2) DEFAULT NULL COMMENT 'd - dinheiro / cd - cartao debito / cc - cartao crédito',
  `forma_entrega` char(1) NOT NULL COMMENT 'r - retirar / e - entregar',
  `taxa_entrega` decimal(6,2) DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `hora_entrega` varchar(10) DEFAULT NULL,
  `end_entrega` varchar(250) DEFAULT NULL COMMENT 'Usar este endereço quando informado, senão usar a do cadastro.',
  `cidade_entrega` varchar(150) DEFAULT NULL,
  `num_entrega` varchar(10) DEFAULT NULL,
  `bairro_entrega` varchar(150) DEFAULT NULL,
  `comp_entrega` varchar(100) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL COMMENT 'data do dia do pagamento',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_cidade` (`id_cidade`),
  CONSTRAINT `tbl_pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `tbl_pedido_ibfk_2` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Pedido do Salgado';

/*Data for the table `tbl_pedido` */

LOCK TABLES `tbl_pedido` WRITE;

insert  into `tbl_pedido`(`id_pedido`,`id_cliente`,`id_cidade`,`situacao`,`data_pedido`,`valor`,`valor_total`,`forma_pgto`,`forma_entrega`,`taxa_entrega`,`data_entrega`,`hora_entrega`,`end_entrega`,`cidade_entrega`,`num_entrega`,`bairro_entrega`,`comp_entrega`,`data_pagamento`) values (15,10,1,'e','2017-11-04 00:00:00',22.50,25.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,11,1,'e','2017-11-09 00:00:00',31.50,34.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,12,1,'e','2017-11-09 00:00:00',24.00,27.00,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,13,1,'e','2017-11-29 15:57:57',40.00,43.00,'d','',3.00,'2017-12-01','13:30h',NULL,NULL,NULL,NULL,NULL,NULL),(26,11,1,'e','2018-01-11 08:28:24',45.00,48.00,'d','',3.00,'2018-01-13','19:30h',NULL,NULL,NULL,NULL,NULL,NULL),(27,14,1,'e','2018-06-04 11:29:29',13.50,16.50,'cd','',3.00,'2018-06-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,15,2,'e','2018-06-07 21:20:21',45.00,48.00,'cd','',3.00,'2018-06-09','13:30h',NULL,NULL,NULL,NULL,NULL,NULL),(31,27,1,'e','2018-07-23 09:37:01',45.00,52.00,'cc','e',7.00,'2018-07-25','18:00',NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `tbl_produto` */

DROP TABLE IF EXISTS `tbl_produto`;

CREATE TABLE `tbl_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Produtos',
  `nome` varchar(255) NOT NULL,
  `situacao` char(1) NOT NULL COMMENT 'a - ativo / d - desativado',
  `controla_estoque` char(1) NOT NULL COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Produto';

/*Data for the table `tbl_produto` */

LOCK TABLES `tbl_produto` WRITE;

insert  into `tbl_produto`(`id_produto`,`nome`,`situacao`,`controla_estoque`) values (1,'Croquete','a',''),(2,'Bolinho de Carne','a',''),(3,'Coxinha','a',''),(4,'Enroladinho','a',''),(5,'Salsicha','a',''),(6,'Kibe','a',''),(13,'Mini Croquete','d',''),(14,'Mini Bolinho de Carne','a',''),(15,'Mini Coxinha','a',''),(16,'Mini Enroladinho','a',''),(17,'Mini Salsicha','a',''),(18,'Mini Kibe','a',''),(39,'Mini Bolinha de Queijo','a','');

UNLOCK TABLES;

/*Table structure for table `tbl_produto_categoria` */

DROP TABLE IF EXISTS `tbl_produto_categoria`;

CREATE TABLE `tbl_produto_categoria` (
  `id_produto_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_categoria_produto` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produto_categoria`),
  KEY `fk_pro_cat_prod` (`id_produto`),
  KEY `fk_pro_cat_cat` (`id_categoria_produto`),
  CONSTRAINT `fk_pro_cat_cat` FOREIGN KEY (`id_categoria_produto`) REFERENCES `tbl_categoria_produto` (`id_categoria_produto`),
  CONSTRAINT `fk_pro_cat_prod` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_produto_categoria` */

LOCK TABLES `tbl_produto_categoria` WRITE;

insert  into `tbl_produto_categoria`(`id_produto_categoria`,`id_produto`,`id_categoria_produto`,`imagem`) values (1,1,1,'frito_croquete.png'),(2,1,2,'congelado_croquete.png'),(3,13,3,'mini_cro.png'),(4,13,4,'mini_cro_sem.png'),(5,2,1,'frito_bolinho_carne.png'),(6,2,2,'congelado_bolinho_carne.png'),(7,14,3,'frito_mini_bolinho_carne.jpg'),(8,14,4,'congelado_mini_bolinho_carne.jpg'),(9,3,1,'frito_coxinha.png'),(10,3,2,'congelado_coxinha.png'),(11,15,3,'frito_mini_coxinha.jpg'),(12,15,4,'congelado_mini_coxinha.jpg'),(13,4,1,'frito_enroladinho.png'),(14,4,2,'congelado_enroladinho.png'),(15,16,3,'frito_mini_enroladinho.jpg'),(16,16,4,'congelado_mini_enroladinho.jpg'),(17,5,1,'frito_salsicha.png'),(18,5,2,'congelado_salsicha.png'),(19,17,3,'frito_mini_salsicha.jpg'),(20,17,4,'congelado_mini_salsicha.jpg'),(21,6,1,'frito_kibe.png'),(22,6,2,'congelado_kibe.png'),(23,18,3,'frito_mini_kibe.jpg'),(24,18,4,'congelado_mini_kibe.jpg'),(25,39,3,'frito_mini_bolinha_queijo.jpg'),(26,39,4,'congelado_mini_bolinha_queijo.jpg');

UNLOCK TABLES;

/*Table structure for table `tbl_representante_cliente` */

DROP TABLE IF EXISTS `tbl_representante_cliente`;

CREATE TABLE `tbl_representante_cliente` (
  `id_representante_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente_represent` int(11) NOT NULL,
  `id_cliente_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_representante_cliente`),
  UNIQUE KEY `UK_CLIENTE` (`id_cliente_cliente`),
  KEY `fk_cliente_representante` (`id_cliente_represent`),
  CONSTRAINT `fk_cliente_cliente` FOREIGN KEY (`id_cliente_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_cliente_representante` FOREIGN KEY (`id_cliente_represent`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_representante_cliente` */

LOCK TABLES `tbl_representante_cliente` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_representante_recebimento` */

DROP TABLE IF EXISTS `tbl_representante_recebimento`;

CREATE TABLE `tbl_representante_recebimento` (
  `id_representante_recebimento` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente_represent` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `data_pgto_pedido` date NOT NULL,
  `valor_receber` decimal(7,4) NOT NULL,
  `recebido` char(1) NOT NULL COMMENT 's - sim / n - não - s/n foi recebido pelo cliente',
  `situacao_pedido` char(1) NOT NULL COMMENT 'a - aberto / f - finalizado',
  PRIMARY KEY (`id_representante_recebimento`),
  KEY `FK_CLI_RECEB` (`id_cliente_represent`),
  CONSTRAINT `FK_CLI_RECEB` FOREIGN KEY (`id_cliente_represent`) REFERENCES `tbl_representante_cliente` (`id_representante_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_representante_recebimento` */

LOCK TABLES `tbl_representante_recebimento` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_submenu` */

DROP TABLE IF EXISTS `tbl_submenu`;

CREATE TABLE `tbl_submenu` (
  `submenu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `nome_submenu` varchar(100) NOT NULL,
  `arquivo_controller_id` int(11) NOT NULL,
  `function_controller_id` int(11) NOT NULL,
  `order` int(10) DEFAULT NULL,
  `ativo` char(1) DEFAULT NULL,
  PRIMARY KEY (`submenu_id`),
  KEY `FK_submenu_menu_id` (`menu_id`),
  KEY `FK_submenu_arq_ctrl` (`arquivo_controller_id`),
  KEY `FK_submenu_fun_ctrl` (`function_controller_id`),
  CONSTRAINT `FK_submenu_arq_ctrl` FOREIGN KEY (`arquivo_controller_id`) REFERENCES `tbl_arquivo_controller` (`arquivo_controller_id`),
  CONSTRAINT `FK_submenu_fun_ctrl` FOREIGN KEY (`function_controller_id`) REFERENCES `tbl_function_controller` (`function_controller_id`),
  CONSTRAINT `FK_submenu_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `tbl_menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_submenu` */

LOCK TABLES `tbl_submenu` WRITE;

insert  into `tbl_submenu`(`submenu_id`,`menu_id`,`nome_submenu`,`arquivo_controller_id`,`function_controller_id`,`order`,`ativo`) values (1,1,'Inicio',1,5,1,'a'),(2,2,'Cadastrar Tipo',1,10,1,'a'),(3,2,'Cadastrar Menus',1,21,2,'a'),(4,2,'Cadastrar Arquivo Controller',1,18,3,'a'),(5,3,'Cadastrar Clientes',1,7,1,'a'),(6,3,'Cadastrar Cidades',1,8,2,'a'),(7,3,'Cadastrar Fornecedores',1,9,3,'a'),(9,3,'Cadastrar Lojas',1,17,4,'a'),(10,5,'Cadastrar Categorias',1,11,1,'a'),(11,5,'Cadastrar Produtos',1,12,2,'a'),(12,4,'Movimentação de Estoque',1,25,1,'a'),(13,4,'Consulta de Estoque',1,24,2,'a'),(14,6,'Pedidos Solicitados',1,14,1,'a'),(15,4,'Ficha Kardex',1,27,3,'a'),(16,7,'A Fazer',1,29,1,'a'),(17,8,'Cadastrar Conta a Pagar',1,33,1,'a'),(18,8,'Pagar A Conta',1,34,2,'a'),(19,8,'Contas Pagas',1,36,3,'a'),(20,9,'Conta Corrente',1,38,1,'a'),(21,9,'Conta Gerencial',1,37,2,'a'),(22,10,'Cadastrar Conta a Receber',1,39,1,'a'),(23,10,'Receber A Conta',1,40,2,'a'),(24,10,'Contas Recebidas',1,42,3,'a');

UNLOCK TABLES;

/*Table structure for table `tbl_tipo` */

DROP TABLE IF EXISTS `tbl_tipo`;

CREATE TABLE `tbl_tipo` (
  `campo` varchar(50) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COMMENT='Tabelas de Tipo';

/*Data for the table `tbl_tipo` */

LOCK TABLES `tbl_tipo` WRITE;

insert  into `tbl_tipo`(`campo`,`tipo`,`descricao`,`id_tipo`) values ('forma_pgto','d','Dinheiro',1),('forma_pgto','cd','Cartão de Débito',2),('forma_pgto','cc','Cartão de Crédito',3),('hora_entrega','11:00','11:00h',4),('hora_entrega','12:00','12:00h',5),('hora_entrega','13:00','13:00h',6),('hora_entrega','14:00','14:00h',7),('hora_entrega','15:00','15:00h',8),('hora_entrega','16:00','16:00h',9),('hora_entrega','17:00','17:00h',10),('hora_entrega','18:00','18:00h',11),('hora_entrega','19:00','19:00h',12),('banco','001','001 - Banco do Brasil S.A.',13),('banco','003','003 - Banco da Amazônia S.A.',14),('banco','004','004 - Banco do Nordeste do Brasil S.A.',15),('banco','012','012 - Banco Standard de Investimentos S.A.',16),('banco','021','021 - BANESTES S.A. Banco do Estado do Espírito Santo',17),('banco','024','024 - Banco de Pernambuco S.A. - BANDEPE',18),('banco','025','025 - Banco Alfa S.A.',19),('banco','029','029 - Banco Banerj S.A.',20),('banco','031','031 - Banco Beg S.A.',21),('banco','033','033 - Banco Santander (Brasil) S.A.',22),('banco','036','036 - Banco Bradesco BBI S.A.',23),('banco','037','037 - Banco do Estado do Pará S.A.',24),('banco','040','040 - Banco Cargill S.A.',25),('banco','041','041 - Banco do Estado do Rio Grande do Sul S.A.',26),('banco','044','044 - Banco BVA S.A.',27),('banco','045','045 - Banco Opportunity S.A.',28),('banco','047','047 - Banco do Estado de Sergipe S.A.',29),('banco','062','062 - Hipercard Banco Múltiplo S.A.',30),('banco','063','063 - Banco Ibi S.A. Banco Múltiplo',31),('banco','064','064 - Goldman Sachs do Brasil Banco Múltiplo S.A.',32),('banco','069','069 - BPN Brasil Banco Múltiplo S.A.',33),('banco','070','070 - BRB - Banco de Brasília S.A.',34),('banco','072','072 - Banco Rural Mais S.A.',35),('banco','073','073 - BB Banco Popular do Brasil S.A.',36),('banco','074','074 - Banco J. Safra S.A.',37),('banco','077','077 - Banco Intermedium S.A.',38),('banco','078','078 - BES Investimento do Brasil S.A.-Banco de Investimento',39),('banco','079','079 - Banco Original do Agronegócio S.A.',40),('banco','085','085 - Cooperativa Central de Crédito Urbano - Cecred',41),('banco','096','096 - Banco BM&amp;F de Serviços de Liquidação e Custódia S.A',42),('banco','099','099 - Uniprime Cooperativa de Crédito',43),('banco','102','102 - XP Investimentos Corretora de Câmbio Títulos e Valores Mobiliários S.A',44),('banco','104','104 - Caixa Econômica Federal',45),('banco','107','107 - Banco BBM S.A.',46),('banco','119','119 - Banco Western Union do Brasil S.A.',47),('banco','121','121 - Banco Agiplan S.A.',48),('banco','184','184 - Banco Itaú BBA S.A.',49),('banco','204','204 - Banco Bradesco Cartões S.A.',50),('banco','208','208 - Banco BTG Pactual S.A.',51),('banco','212','212 - Banco Original S.A.',52),('banco','214','214 - Banco Dibens S.A.',53),('banco','215','215 - Banco Comercial e de Investimento Sudameris S.A.',54),('banco','217','217 - Banco John Deere S.A.',55),('banco','218','218 - Banco Bonsucesso S.A.',56),('banco','222','222 - Banco Credit Agricole Brasil S.A.',57),('banco','224','224 - Banco Fibra S.A.',58),('banco','225','225 - Banco Brascan S.A.',59),('banco','229','229 - Banco Cruzeiro do Sul S.A.',60),('banco','230','230 - Unicard Banco Múltiplo S.A.',61),('banco','233','233 - Banco Cifra S.A.',62),('banco','237','237 - Banco Bradesco S.A.',63),('banco','246','246 - Banco ABC Brasil S.A.',64),('banco','248','248 - Banco Boavista Interatlântico S.A.',65),('banco','249','249 - Banco Investcred Unibanco S.A.',66),('banco','250','250 - BCV - Banco de Crédito e Varejo S.A.',67),('banco','260','260 - Nu Pagamentos S.A Nubank',68),('banco','263','263 - Banco Cacique S.A.',69),('banco','265','265 - Banco Fator S.A.',70),('banco','318','318 - Banco BMG S.A.',71),('banco','320','320 - Banco Industrial e Comercial S.A.',72),('banco','341','341 - Itaú Unibanco S.A.',73),('banco','356','356 - Banco Real S.A.',74),('banco','366','366 - Banco Société Générale Brasil S.A.',75),('banco','370','370 - Banco WestLB do Brasil S.A.',76),('banco','376','376 - Banco J. P. Morgan S.A.',77),('banco','389','389 - Banco Mercantil do Brasil S.A.',78),('banco','394','394 - Banco Bradesco Financiamentos S.A.',79),('banco','394','394 - Banco Finasa BMC S.A.',80),('banco','399','399 - HSBC Bank Brasil S.A. - Banco Múltiplo',81),('banco','409','409 - UNIBANCO - União de Bancos Brasileiros S.A.',82),('banco','422','422 - Banco Safra S.A.',83),('banco','453','453 - Banco Rural S.A.',84),('banco','456','456 - Banco de Tokyo-Mitsubishi UFJ Brasil S.A.',85),('banco','464','464 - Banco Sumitomo Mitsui Brasileiro S.A.',86),('banco','473','473 - Banco Caixa Geral - Brasil S.A.',87),('banco','477','477 - Citibank S.A.',88),('banco','479','479 - Banco ItaúBank S.A',89),('banco','487','487 - Deutsche Bank S.A. - Banco Alemão',90),('banco','488','488 - JPMorgan Chase Bank',91),('banco','492','492 - ING Bank N.V.',92),('banco','505','505 - Banco Credit Suisse (Brasil) S.A.',93),('banco','600','600 - Banco Luso Brasileiro S.A.',94),('banco','604','604 - Banco Industrial do Brasil S.A.',95),('banco','610','610 - Banco VR S.A.',96),('banco','611','611 - Banco Paulista S.A.',97),('banco','612','612 - Banco Guanabara S.A.',98),('banco','623','623 - Banco Panamericano S.A.',99),('banco','626','626 - Banco Ficsa S.A.',100),('banco','633','633 - Banco Rendimento S.A.',101),('banco','634','634 - Banco Triângulo S.A.',102),('banco','637','637 - Banco Sofisa S.A.',103),('banco','638','638 - Banco Prosper S.A.',104),('banco','641','641 - Banco Alvorada S.A.',105),('banco','643','643 - Banco Pine S.A.',106),('banco','652','652 - Itaú Unibanco Holding S.A.',107),('banco','653','653 - Banco Indusval S.A.',108),('banco','655','655 - Banco Votorantim S.A.',109),('banco','707','707 - Banco Daycoval S.A.',110),('banco','719','719 - Banif-Banco Internacional do Funchal (Brasil)S.A.',111),('banco','735','735 - Banco Neon S.A.',112),('banco','739','739 - Banco BGN S.A.',113),('banco','40','40 - Banco Barclays S.A.',114),('banco','745','745 - Banco Citibank S.A.',115),('banco','746','746 - Banco Modal S.A.',116),('banco','747','747 - Banco Rabobank International Brasil S.A.',117),('banco','748','748 - Banco Cooperativo Sicredi S.A.',118),('banco','749','749 - Banco Simples S.A.',119),('banco','751','751 - Scotiabank Brasil S.A. Banco Múltiplo',120),('banco','752','752 - Banco BNP Paribas Brasil S.A.',121),('banco','755','755 - Bank of America Merrill Lynch Banco Múltiplo S.A.',122),('banco','756','756 - Banco Cooperativo do Brasil S.A. - BANCOOB – SICOOB',123),('tipo_ie','1','Contribuinte do ICMS',124),('tipo_ie','2','Contribuinte Isento de Inscrição',125),('tipo_ie','3','Não Contribuinte',126),('tipo_pagamento','1','BOLETO',170),('tipo_pagamento','2','CARTÃO BENEFÍCIO',171),('tipo_pagamento','3','CARTÃO DE CRÉDITO',172),('tipo_pagamento','4','CARTÃO DE DÉBITO',173),('tipo_pagamento','5','CHEQUE',174),('tipo_pagamento','6','DEPÓSITO',175),('tipo_pagamento','7','DINHEIRO',176),('tipo_pagamento','8','IMPORTADO NF',177),('tipo_pagamento','9','PAGAMENTO DIGITAL',178),('tipo_pagamento','10','TEF',179),('tipo_pagamento','11','TRANSFERÊNCIA',180),('tipo_pagamento','12','VALE',181),('id_conta_dre','e','Aluguel, Condomínio e IPTU',182),('id_conta_dre','s','Custo da Mercadoria',183),('id_conta_dre','s','Despesas Financeirasv',184),('id_conta_dre','s','Gerais e Administrativas',185),('id_conta_dre','s','Impostos e Devoluções',186),('id_conta_dre','s','Pessoal',187),('id_conta_dre','s','Pro labore',188),('id_conta_dre','s','Propaganda e Marketing',189),('id_conta_dre','s','Utilidades',190),('id_conta_dre','e','Receitas Financeiras',191),('id_conta_dre','e','Entradas',192);

UNLOCK TABLES;

/*Table structure for table `tbl_valor_produto` */

DROP TABLE IF EXISTS `tbl_valor_produto`;

CREATE TABLE `tbl_valor_produto` (
  `id_valor_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ValoresProduto',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `data_atualizacao` date NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `tipo_cliente` char(1) DEFAULT NULL COMMENT 'c - cliente / r - revendedor / s - representante / p - parceiro',
  `id_categoria_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_valor_produto`),
  KEY `id_produto` (`id_produto`),
  KEY `tbl_valor_produto_ibfk_2` (`id_categoria_produto`),
  CONSTRAINT `tbl_valor_produto_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`),
  CONSTRAINT `tbl_valor_produto_ibfk_2` FOREIGN KEY (`id_categoria_produto`) REFERENCES `tbl_categoria_produto` (`id_categoria_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Valores do Produto';

/*Data for the table `tbl_valor_produto` */

LOCK TABLES `tbl_valor_produto` WRITE;

insert  into `tbl_valor_produto`(`id_valor_produto`,`id_produto`,`data_atualizacao`,`preco`,`tipo_cliente`,`id_categoria_produto`) values (170,1,'2018-01-01',3.00,'c',1),(171,1,'2018-01-01',3.00,'s',1),(172,1,'2018-01-01',2.20,'r',1),(173,2,'2018-01-01',3.00,'c',1),(174,2,'2018-01-01',3.00,'s',1),(175,2,'2018-01-01',2.20,'r',1),(176,3,'2018-01-01',3.00,'c',1),(177,3,'2018-01-01',3.00,'s',1),(178,3,'2018-01-01',2.20,'r',1),(179,4,'2018-01-01',3.00,'c',1),(180,4,'2018-01-01',3.00,'s',1),(181,4,'2018-01-01',2.20,'r',1),(182,5,'2018-01-01',3.00,'c',1),(183,5,'2018-01-01',3.00,'s',1),(184,5,'2018-01-01',2.20,'r',1),(185,6,'2018-01-01',3.00,'c',1),(186,6,'2018-01-01',3.00,'s',1),(187,6,'2018-01-01',2.20,'r',1),(188,1,'2018-01-01',2.25,'c',2),(189,1,'2018-01-01',2.50,'s',2),(190,1,'2018-01-01',1.90,'r',2),(191,2,'2018-01-01',2.25,'c',2),(192,2,'2018-01-01',2.50,'s',2),(193,2,'2018-01-01',1.90,'r',2),(194,3,'2018-01-01',2.25,'c',2),(195,3,'2018-01-01',2.50,'s',2),(196,3,'2018-01-01',1.90,'r',2),(197,4,'2018-01-01',2.25,'c',2),(198,4,'2018-01-01',2.50,'s',2),(199,4,'2018-01-01',1.90,'r',2),(200,5,'2018-01-01',2.25,'c',2),(201,5,'2018-01-01',2.50,'s',2),(202,5,'2018-01-01',1.90,'r',2),(203,6,'2018-01-01',2.25,'c',2),(204,6,'2018-01-01',2.50,'s',2),(205,6,'2018-01-01',1.90,'r',2),(206,13,'2018-01-01',0.45,'c',3),(207,13,'2018-01-01',0.45,'s',3),(208,13,'2018-01-01',0.36,'r',3),(209,14,'2018-01-01',0.45,'c',3),(210,14,'2018-01-01',0.45,'s',3),(211,14,'2018-01-01',0.36,'r',3),(212,15,'2018-01-01',0.45,'c',3),(213,15,'2018-01-01',0.45,'s',3),(214,15,'2018-01-01',0.36,'r',3),(215,16,'2018-01-01',0.45,'c',3),(216,16,'2018-01-01',0.45,'s',3),(217,16,'2018-01-01',0.36,'r',3),(218,17,'2018-01-01',0.45,'c',3),(219,17,'2018-01-01',0.45,'s',3),(220,17,'2018-01-01',0.36,'r',3),(221,18,'2018-01-01',0.45,'c',3),(222,18,'2018-01-01',0.45,'s',3),(223,18,'2018-01-01',0.36,'r',3),(224,39,'2018-01-01',0.45,'c',3),(225,39,'2018-01-01',0.45,'s',3),(226,39,'2018-01-01',0.36,'r',3),(227,13,'2018-01-01',0.40,'c',4),(228,13,'2018-01-01',0.40,'s',4),(229,13,'2018-01-01',0.35,'r',4),(230,14,'2018-01-01',0.40,'c',4),(231,14,'2018-01-01',0.40,'s',4),(232,14,'2018-01-01',0.35,'r',4),(233,15,'2018-01-01',0.40,'c',4),(234,15,'2018-01-01',0.40,'s',4),(235,15,'2018-01-01',0.35,'r',4),(236,16,'2018-01-01',0.40,'c',4),(237,16,'2018-01-01',0.40,'s',4),(238,16,'2018-01-01',0.35,'r',4),(239,17,'2018-01-01',0.40,'c',4),(240,17,'2018-01-01',0.40,'s',4),(241,17,'2018-01-01',0.35,'r',4),(242,18,'2018-01-01',0.40,'c',4),(243,18,'2018-01-01',0.40,'s',4),(244,18,'2018-01-01',0.35,'r',4),(245,39,'2018-01-01',0.40,'c',4),(246,39,'2018-01-01',0.40,'s',4),(247,39,'2018-01-01',0.35,'r',4);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
