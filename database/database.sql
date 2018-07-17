/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.5-10.1.31-MariaDB : Database - miste872_prod
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
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ci_sessions` */

LOCK TABLES `ci_sessions` WRITE;

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('08nlo1fku9df4r4071mb10pqchtfqfqp','::1',1531780779,'__ci_last_regenerate|i:1531780565;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('1endlrh2v51vs1qglpld5vprvai5ojs0','::1',1531835658,'__ci_last_regenerate|i:1531835658;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('1esmplgrghtntqtphc803n7jnt3fd3s7','::1',1531769480,'__ci_last_regenerate|i:1531769480;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('1j51gga2i707sslplqgnmvgfics2s30q','::1',1531756673,'__ci_last_regenerate|i:1531756201;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('30rfgvhu72dg170hhhf00bljgdevhu3t','::1',1531847333,'__ci_last_regenerate|i:1531847333;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('319s21ettg58p5g9d8o1rtsuc9rc64gl','::1',1531858957,'__ci_last_regenerate|i:1531858957;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('3ped36ioi9h5so58i4n3edp6j0aidv1f','::1',1531837924,'__ci_last_regenerate|i:1531837924;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('4g72mm65n9ghasnt55mndvgqu488l0ee','::1',1531768693,'__ci_last_regenerate|i:1531768693;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('4tsfipe3e85qrkcnsbh2ipljagi8h61u','::1',1531847985,'__ci_last_regenerate|i:1531847985;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('5p2d2o5mnchpat2p9so8vrrucute33e8','::1',1531772166,'__ci_last_regenerate|i:1531772166;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('5tc7d2qphuinvalm6ae3mi9ihfj2dcri','::1',1531775458,'__ci_last_regenerate|i:1531775458;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('6ku9tn7dr2abf26pst98lb3efiem3p7h','::1',1531836314,'__ci_last_regenerate|i:1531836314;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('6s5kovj90loh8cir8f3ah3usodvj7gen','::1',1531835297,'__ci_last_regenerate|i:1531835297;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('798nac0q0vga8vutn55vo0g1ob11eet4','::1',1531858629,'__ci_last_regenerate|i:1531858629;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('7kscd5n7vdtnk2i62udd6m6jooe9tmuq','::1',1531775792,'__ci_last_regenerate|i:1531775792;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('7m3o0j7bsnfm79d1gjdk60go48474o9f','::1',1531858292,'__ci_last_regenerate|i:1531858292;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('82la6ud868j6aibhboqjid67phi63n7f','::1',1531765284,'__ci_last_regenerate|i:1531765284;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('89p1k3gu91dht9brihlroovbqd4pdiit','::1',1531856479,'__ci_last_regenerate|i:1531856479;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('8c92ipv1h87a717cmbgoj9sett5f9o93','::1',1531836871,'__ci_last_regenerate|i:1531836871;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('9gtj1b8rneobgfu348dubs1d6t4mg43b','::1',1531844607,'__ci_last_regenerate|i:1531844607;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('a84gnlr27909u7gie12pm0q5qs4l7qc5','::1',1531758241,'__ci_last_regenerate|i:1531757830;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('aiaar8itb5hufj4p0rhrikeeeriu9836','::1',1531768070,'__ci_last_regenerate|i:1531768070;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('bb20j2njhn52tmmqet169ed28rkm6g9p','::1',1531757527,'__ci_last_regenerate|i:1531757527;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('bcp5hb580vf497p4vtha9o936hhvcbp9','::1',1531837233,'__ci_last_regenerate|i:1531837233;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('bhqnuq8lptararessrl8faqk5l422k6u','::1',1531831591,'__ci_last_regenerate|i:1531831591;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('bksqfslbm367hagb17euvr5quqbk5hj7','::1',1531762445,'__ci_last_regenerate|i:1531762445;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('bolqn6hs7mic38ld4ocignl03si4uoif','::1',1531762756,'__ci_last_regenerate|i:1531762756;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('cff98shvmjutm2sol0hg49s1ab4tq0mk','::1',1531756999,'__ci_last_regenerate|i:1531756716;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ck52rl4o8hkg5omgltq526186o1aq0l2','::1',1531766213,'__ci_last_regenerate|i:1531766213;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('cn55gnajralgj7lbvtdj7innadjsmq86','::1',1531768391,'__ci_last_regenerate|i:1531768391;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('co4vlnga4tu48q725bh0ocvtplctjbh3','::1',1531779564,'__ci_last_regenerate|i:1531779564;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('crq1b4pfarb24smkgmhsd3nugqmcn8ud','::1',1531757830,'__ci_last_regenerate|i:1531757830;'),('d3fp7mnj570qeugkm6huvk70r1a27vrj','::1',1531767271,'__ci_last_regenerate|i:1531767271;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('d5j39mjq2bb7pfga2b2jnbutqbtdb65u','::1',1531840967,'__ci_last_regenerate|i:1531840967;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('d7fgd0immvo2l5b587b24ue7mqconsvo','::1',1531754698,'__ci_last_regenerate|i:1531754698;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('d8tauviktm0hsp2ctqd1h3rg5hilh16q','::1',1531761385,'__ci_last_regenerate|i:1531761385;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('del313mo063ke26q5in39aemmu21470c','::1',1531774726,'__ci_last_regenerate|i:1531774726;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('elnjc3e7vgo8lk0obmua20sihr7ehrvq','::1',1531777646,'__ci_last_regenerate|i:1531777646;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('eru3ecvfeqajdngvu5mlouuh7trj4f6o','::1',1531842688,'__ci_last_regenerate|i:1531842688;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('fio917o2jk0mf1nbk7j2euj8gm6cndqi','::1',1531780233,'__ci_last_regenerate|i:1531780233;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('g3n0j8t2jsjdrlal42hoi1aq4sfgep2a','::1',1531847634,'__ci_last_regenerate|i:1531847634;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('hgu4bgth78ofed8a5plsl3002or448so','::1',1531779874,'__ci_last_regenerate|i:1531779874;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('hprahjnc4toksa9a0ol9q87fajatpkmm','::1',1531778862,'__ci_last_regenerate|i:1531778862;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('hstmu12pghqcbvev3r0v4ahjh88dglk4','::1',1531859738,'__ci_last_regenerate|i:1531859463;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ibdm7ao5balthvjuc59pp751fjl4tepc','::1',1531842005,'__ci_last_regenerate|i:1531842005;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('iv7hmv3eb9gt7vv0nj5ngh93alojjmdp','::1',1531840467,'__ci_last_regenerate|i:1531840467;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('jpcjpri4k249q3v6ri0b8eud4d7gdkj6','::1',1531837577,'__ci_last_regenerate|i:1531837577;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('jrk8a1arqgpuqrnjg678rurnofu7oqha','::1',1531838261,'__ci_last_regenerate|i:1531838261;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('lj1626utlj0c25djnn1ktrfg5i0m6r72','::1',1531853472,'__ci_last_regenerate|i:1531853472;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('lr0ir37o1nkungqdt7m1e7c5e900v7uc','::1',1531773775,'__ci_last_regenerate|i:1531773775;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('m7c4pms30c1cs77fsl55k0la02cn1i7h','::1',1531843830,'__ci_last_regenerate|i:1531843830;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('m7evotihbblu2cmjdebg08bhoc484ltb','::1',1531859463,'__ci_last_regenerate|i:1531859463;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('mb5df609r8hi87i3ito7obr7b9rlcvf9','::1',1531764662,'__ci_last_regenerate|i:1531764662;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('mqddpttvchkk4p7eo0epprr8dl68vme9','::1',1531776784,'__ci_last_regenerate|i:1531776784;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('nns7mp2t836gjpfdf3vf2b2m39qr21d9','::1',1531759516,'__ci_last_regenerate|i:1531759516;'),('o33g4q1r8pkclqgfbosf55vonghqatm4','::1',1531774243,'__ci_last_regenerate|i:1531774243;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('p4pcov5jqa4snbeguqdr40dokfh2cojk','::1',1531841688,'__ci_last_regenerate|i:1531841688;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('phadh9ip1gicbqj2kmti6qboqhr5h28m','::1',1531772685,'__ci_last_regenerate|i:1531772166;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ppcdd5arj08cpflonohn19s8or4gdhdp','::1',1531856062,'__ci_last_regenerate|i:1531856062;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('pulbaun8vp4i773rb8n7eirnhldsr38c','::1',1531756201,'__ci_last_regenerate|i:1531756201;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('qc43ngn0llv8gqojscfso7abqesrcbld','::1',1531834775,'__ci_last_regenerate|i:1531834775;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('qc9pkh6giq70lhd7sndtfhe8ie8g8hl0','::1',1531779261,'__ci_last_regenerate|i:1531779261;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('qkf3klkvlc0dnoe41aburfbohpkrn54e','::1',1531842367,'__ci_last_regenerate|i:1531842367;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ri6g0qbbif88ne92tve3te0vp18n6sa5','::1',1531780565,'__ci_last_regenerate|i:1531780565;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('sjhcn4anbgqouk1s5sm8hg5261n5p9b2','::1',1531776420,'__ci_last_regenerate|i:1531776420;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('smcak6lnavic8f09h7qn0ot4iprb2qvl','::1',1531775137,'__ci_last_regenerate|i:1531775137;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('tkqp8ua121t5anl12k87pm59vm05h4ga','::1',1531761787,'__ci_last_regenerate|i:1531761787;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('u5id3q6iolma6m5m4985kor1ieqlq8h6','::1',1531844995,'__ci_last_regenerate|i:1531844995;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('udramub64fn7uih1jhrseb2dt0fnlla0','::1',1531765908,'__ci_last_regenerate|i:1531765908;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('v0gbh0rdfqlb54ssqt2o4qm6u0qgh5vb','::1',1531773240,'__ci_last_regenerate|i:1531773240;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('vcc4rjjb8ckr90b5k8q0l93oodo18utg','::1',1531755899,'__ci_last_regenerate|i:1531755899;is_loginho|b:1;nome_user|s:7:\"Matheus\";');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_afazer` */

LOCK TABLES `tbl_afazer` WRITE;

insert  into `tbl_afazer`(`id_afazer`,`afazer`,`dt_inicio`,`dt_fim`,`realizado`) values (3,'Conquistar Novos Clientes','2018-07-16',NULL,'n'),(4,'Bolsa Termina','2018-07-16','2018-07-18','n');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_cart` */

LOCK TABLES `tbl_cart` WRITE;

insert  into `tbl_cart`(`id_cart`,`id_session`,`id_categoria_produto`,`id_produto`,`id_cidade`,`qtde`,`valor_unitario`,`situacao`,`cod_promo`) values (2,'76abb1d174afe90b48403c9b98fa8eba',3,15,1,10,0.45,'d','0'),(3,'76abb1d174afe90b48403c9b98fa8eba',3,15,1,10,0.45,'d','0'),(4,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,14,1,40,0.45,'a','0'),(5,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,15,1,30,0.45,'a','0'),(6,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,16,1,30,0.45,'a','0'),(7,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,16,1,10,0.45,'a','0'),(8,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,18,1,20,0.45,'a','0'),(9,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,18,1,40,0.45,'a','0'),(10,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,18,1,10,0.45,'a','0'),(11,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,18,1,10,0.45,'a','0'),(12,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,17,1,30,0.45,'a','0'),(13,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,17,1,20,0.45,'a','0'),(15,'4d48895e978f7e285b9ce37ad43ebde3',4,14,1,30,0.40,'d','0'),(16,'4d48895e978f7e285b9ce37ad43ebde3',4,14,1,10,0.40,'d','0'),(17,'4d48895e978f7e285b9ce37ad43ebde3',3,39,1,10,0.45,'d','0'),(18,'dbc262b62a18f9bd96db1dfb727a0280',3,14,1,10,0.45,'d','0'),(19,'a21137a1611878b68fe79e2bb5b648f7',3,14,1,10,0.45,'d','0'),(20,'2fd839424524994f96b22e802c9769f7',3,14,1,10,0.45,'d','0'),(21,'26cab29561f00b193daf19ba1b87a216',3,14,1,10,0.45,'d','0'),(22,'26cab29561f00b193daf19ba1b87a216',3,14,1,10,0.45,'d','0'),(23,'2c786df43c1e6daaef072d9b97608491',3,14,1,10,0.45,'d','0'),(24,'2c786df43c1e6daaef072d9b97608491',3,14,1,40,0.45,'d','0'),(25,'168a8d5fb73568d367b27091b7a326d8',3,14,1,20,0.45,'d','0'),(26,'dcbabc824f1c1902ff31157ecac55fe0',3,14,1,10,0.45,'d','0'),(27,'dcbabc824f1c1902ff31157ecac55fe0',4,14,1,10,0.40,'d','0'),(28,'108b2b8e3a47fd83d7f0c8133d4f0411',3,14,1,10,0.45,'d','0'),(29,'108b2b8e3a47fd83d7f0c8133d4f0411',3,15,1,10,0.45,'d','0'),(30,'108b2b8e3a47fd83d7f0c8133d4f0411',4,14,1,10,0.40,'d','0'),(31,'6c3059eaf980aed66a62f1358ffa3a99',3,14,1,10,0.45,'d','0');

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
  `telefone` varchar(30) NOT NULL,
  `endereco` varchar(250) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(150) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `situacao` char(1) DEFAULT NULL COMMENT 'a - ativo / d - desativado',
  `tipo` char(1) DEFAULT NULL COMMENT 'c - cliente / r - revendedor / s - representante / p - parceiro',
  `ganho_unitario` decimal(2,2) DEFAULT NULL COMMENT 'Somente revendedor e representando vai ter este campo habilitado',
  `cpf_cnpj` varchar(14) DEFAULT NULL COMMENT 'cpf ou cnpj',
  `hash` varchar(255) DEFAULT NULL COMMENT 'id criptografado',
  `ativo` char(1) DEFAULT '0' COMMENT '1 - true / 0 false',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Cliente';

/*Data for the table `tbl_cliente` */

LOCK TABLES `tbl_cliente` WRITE;

insert  into `tbl_cliente`(`id_cliente`,`nome`,`email`,`senha`,`telefone`,`endereco`,`numero`,`bairro`,`complemento`,`situacao`,`tipo`,`ganho_unitario`,`cpf_cnpj`,`hash`,`ativo`) values (10,'Fernanda Lujan Torolio gonzalez','ferlujangom@hotmail.com','','11988775176','Av do café 1149 bl B ap 103','','',NULL,'a','c',NULL,NULL,NULL,'0'),(11,'Juliana Roberta Verissimo','julianarverissimo@gmail.com','','16992155377','Rua Monte Santo, 324','','',NULL,'a','c',NULL,NULL,NULL,'0'),(12,'ANA CAROLINA TASCHETI','taschetty@hotmail.com','','16 99247-4154','macario da silva ribeiro 99','','',NULL,'a','c',NULL,NULL,NULL,'0'),(13,'Carol','carolynebrito3@gmail.com','','16 99161-2326','Rua Paraguaçu Paulista 137','','',NULL,'a','c',NULL,NULL,NULL,'0'),(14,'Alfredo souza','alfredosouza2012@bol.com.br','','16992839989','Rua Antônio Martinez, 222','','',NULL,'a','c',NULL,NULL,NULL,'0'),(15,'Jessica','jessicamylove47@hotmail.com','','16991676217','Macir ramazini 2462','','',NULL,'a','c',NULL,NULL,NULL,'0'),(22,'MATHEUS DE MELLO','matheus.gnu@gmail.com','e3bcdf1347b79080238afbe758cf103d','16991838523','Av. Plínio Castro Prado 431, Apto 33','1000','centro',NULL,'a','c',0.00,NULL,NULL,'1'),(23,'valeria loppi simoes de abreu oliveira','valeria.loppi26@gmail.com','6464248e8460c1f803c4ea1d8867652b','199971156160','av presidente vargs','1617','JARDIM IRAJA','loja 02 -loja mais natural','a','c',0.00,NULL,NULL,'1'),(24,'Leonardo Patricio','nosferaturaiu@gmail.com','dad96e9e0dfe82c0deda5673e539b96f','16993758806','Vicente Della Ricci','30','Geraldo de Carvalho','30','a','c',0.00,NULL,'1ff1de774005f8da13f42943881c655f',NULL),(25,'Micael Monteiro','Mica__pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo Horizonte',NULL,'a','c',0.00,NULL,'8e296a067a37563370ded05f5a3bf3ec',NULL),(26,'Micael monteiro','mica_pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo horizonte',NULL,'a','c',0.00,NULL,NULL,'1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de log para erros na consulta da database';

/*Data for the table `tbl_error_log_db` */

LOCK TABLES `tbl_error_log_db` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_estoque` */

DROP TABLE IF EXISTS `tbl_estoque`;

CREATE TABLE `tbl_estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Estoques',
  `id_loja` int(11) NOT NULL COMMENT 'Lojas',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `qtde_total` decimal(6,0) NOT NULL COMMENT 'qnt total disponivel',
  `qtde_minima` decimal(6,0) DEFAULT NULL COMMENT 'estoque minimo',
  PRIMARY KEY (`id_estoque`),
  UNIQUE KEY `UK_LP` (`id_loja`,`id_produto`),
  KEY `id_loja` (`id_loja`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `tbl_estoque_ibfk_1` FOREIGN KEY (`id_loja`) REFERENCES `tbl_loja` (`id_loja`),
  CONSTRAINT `tbl_estoque_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_estoque` */

LOCK TABLES `tbl_estoque` WRITE;

insert  into `tbl_estoque`(`id_estoque`,`id_loja`,`id_produto`,`qtde_total`,`qtde_minima`) values (4,1,14,50,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_ficha_kardex` */

LOCK TABLES `tbl_ficha_kardex` WRITE;

insert  into `tbl_ficha_kardex`(`id_ficha_kerdex`,`id_loja`,`id_produto`,`tipo_movimentacao`,`origem_movimentacao`,`data_movimentacao`,`qtde_movimentacao`) values (26,1,14,'s','ps','2018-07-17',10),(27,1,14,'c','me','2018-07-17',20),(28,1,14,'c','me','2018-07-17',20),(29,1,14,'c','me','2018-07-17',20);

UNLOCK TABLES;

/*Table structure for table `tbl_fornecedor` */

DROP TABLE IF EXISTS `tbl_fornecedor`;

CREATE TABLE `tbl_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `ramo` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL,
  `whatsapp` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_fornecedor` */

LOCK TABLES `tbl_fornecedor` WRITE;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_function_controller` */

LOCK TABLES `tbl_function_controller` WRITE;

insert  into `tbl_function_controller`(`function_controller_id`,`arquivo_controller_id`,`nome_function`,`funcao`) values (1,1,'__construct','	public $data = array();\r\n\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		if ($this->session->userdata(\'is_loginho\') === null)\r\n			redirect(\'/\');\r\n		$this->data[\'__CLASS__\'] = __CLASS__;\r\n		$this->getStatusPedido(False);\r\n		$this->getMenus();\r\n	}'),(2,1,'getMenus','	public function getMenus(){\r\n		$this->data[\'menus\'] = $this->Generico->getAllMenus();\r\n	}'),(3,1,'getStatusPedido','	public function getStatusPedido($param = True){\r\n		$this->data[\'PedidoAbertoFechado\'] = $this->Pedidos->getQtdAbertoFechado();\r\n		if($param === True)\r\n			print_r(json_encode($this->data[\'PedidoAbertoFechado\']));\r\n	}'),(4,1,'_example_output','	public function _example_output($output = null)\r\n	{\r\n		$output = array_merge($this->data,(array)$output);\r\n		$this->load->view(\'restrito/admin.php\',$output);\r\n	}'),(5,1,'index','	public function index()\r\n	{\r\n		$this->data[\'main_page\'] = \'isset\';\r\n		$this->data[\'estoques\'] = $this->Generico->getEstoque();\r\n		$this->data[\'afazeres\'] = $this->Generico->getAFazer();\r\n		$this->data[\'PedidosSolicitados\'] = $this->Generico->getPedidoSolicitados();\r\n		$this->_example_output((object)array(\'output\' => \'\' , \'js_files\' => array() , \'css_files\' => array()));\r\n	}'),(6,1,'cliente_unique','	public function cliente_unique($id_cliente = \'\')\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/pedidos\").\"\'>Voltar ao Pedido</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cliente\');\r\n		if (!empty($id_cliente)){\r\n			$crud->where(\'tbl_cliente.id_cliente\',$id_cliente);\r\n		}\r\n		$crud->set_subject(\'Cadastro de Cliente\');\r\n		$crud->columns(\'nome\',\'email\',\'endereco\',\'tipo\');\r\n		$crud->fields(\'id_cliente\',\'nome\',\'cpf_cnpj\',\'email\',\'senha\',\'telefone\',\'endereco\',\'numero\',\'bairro\',                     \r\n					  \'complemento\',\'situacao\',\'tipo\',\'ganho_unitario\',\'ativo\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF/CNPJ\');\r\n		$crud->display_as(\'senha\',\'Senha\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'endereco\',\'Endereco\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'ganho_unitario\',\'Ganho %\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'tipo\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'1\' => \'True\', \'0\' => \'False\'));\r\n		 \r\n		$output = $crud->render();\r\n\r\n		$this->_example_output($output);\r\n	}'),(7,1,'clientes','	public function clientes()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cliente\');\r\n		$crud->set_subject(\'Cadastro de Cliente\');\r\n		$crud->columns(\'nome\',\'email\',\'endereco\',\'tipo\');\r\n		$crud->fields(\'id_cliente\',\'nome\',\'cpf_cnpj\',\'email\',\'senha\',\'telefone\',\'endereco\',\'numero\',\'bairro\',                     \r\n					  \'complemento\',\'situacao\',\'tipo\',\'ganho_unitario\',\'ativo\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF/CNPJ\');\r\n		$crud->display_as(\'senha\',\'Senha\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'endereco\',\'Endereco\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'ganho_unitario\',\'Ganho %\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'tipo\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'1\' => \'True\', \'0\' => \'False\'));\r\n		 \r\n		$output = $crud->render();\r\n\r\n		$this->_example_output($output);\r\n	}'),(8,1,'cidades','	public function cidades()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cidade\');\r\n		$crud->set_subject(\'Cadastro de Cidade\');\r\n		$crud->columns(\'nome\',\'uf\',\'link\');\r\n		$crud->fields(\'id_cidade\',\'nome\',\'uf\',\'link\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome da Cidade\');\r\n		$crud->display_as(\'uf\',\'UF\');\r\n		$crud->display_as(\'link\',\'Link\');\r\n\r\n		$crud->field_type(\'uf\',\'dropdown\', array(\'AC\' => \'Acre\', \'AL\' => \'Alagoas\', \'AP\' => \'Amapá\',\r\n												 \'AM\' => \'Amazonas\', \'BA\' => \'Bahia\', \'CE\' => \'Ceará\',\r\n												 \'DF\' => \'Distrito Federal\', \'ES\' => \'Espírito Santo\',\r\n												 \'GO\' => \'Goiás\', \'MA\' => \'Maranhão\', \'MT\' => \'Mato Grosso\',\r\n												 \'MS\' => \'Mato Grosso do Sul\', \'MG\' => \'Minas Gerais\',\r\n												 \'PA\' => \'Pará\', \'PB\' => \'Paraíba\', \'PR\' => \'Paraná\',\r\n												 \'PE\' => \'Pernambuco\', \'PI\' => \'Piauí\', \'RJ\' => \'Rio de Janeiro\',\r\n												 \'RN\' => \'Rio Grande do Norte\', \'RS\' => \'Rio Grande do Sul\',\r\n												 \'RO\' => \'Rondônia\', \'RR\' => \'Roraima\', \'SC\' => \'Santa Catarina\',\r\n												 \'SP\' => \'São Paulo\', \'SE\' => \'Sergipe\', \'TO\' => \'Tocantins\'));\r\n	 \r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(9,1,'fornecedores','	public function fornecedores()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_fornecedor\');\r\n		$crud->set_subject(\'Cadastro de Fornecedor\');\r\n		$crud->columns(\'nome\',\'telefone\',\'situacao\');\r\n		$crud->fields(\'id_fornecedor\',\'nome\',\'telefone\',\'situacao\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome Fornecedor\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 \r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(10,1,'tipos','	public function tipos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_tipo\');\r\n		$crud->set_subject(\'Cadastro de Tipo\');\r\n		$crud->columns(\'id_tipo\',\'campo\',\'tipo\',\'descricao\');\r\n		$crud->fields(\'campo\',\'tipo\',\'descricao\');\r\n		\r\n		$crud->display_as(\'campo\',\'Nome do Campo\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'descricao\',\'Descrição\');\r\n	 	\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(11,1,'categorias','	public function categorias()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_categoria_produto\');\r\n		$crud->set_subject(\'Cadastro da Categoria do Produto\');\r\n		$crud->columns(\'nome\',\'situacao\');\r\n		$crud->fields(\'id_categoria_produto\',\'nome\',\'situacao\');\r\n		\r\n		$crud->display_as(\'Nome\',\'Nome da Categoria\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 	\r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(12,1,'produtos','	public function produtos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_produto\');\r\n		$crud->set_subject(\'Cadastro de Produto\');\r\n		$crud->columns(\'nome\',\'situacao\');\r\n		$crud->fields(\'id_produto\',\'nome\',\'situacao\',\'imagem\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome do Produto\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 	\r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n	 	\r\n	 	$crud->add_action(\'Valores\', \'\', __CLASS__.\'/valores\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(13,1,'valores','	public function valores($id_produto)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/produtos\").\"\'>Voltar ao Produto</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_valor_produto\');\r\n		$crud->where(\'tbl_valor_produto.id_produto\', $id_produto);\r\n		$crud->set_subject(\'Cadastro de Valor do Produto\');\r\n		$crud->columns(\'id_produto\',\'id_categoria_produto\', \'data_atualizacao\',\'preco\', \'tipo_cliente\');\r\n		$crud->fields(\'id_valor_produto\',\'id_produto\',\'id_categoria_produto\', \'data_atualizacao\',\'preco\', \'tipo_cliente\');\r\n		\r\n		$crud->display_as(\'id_produto\',\'Nome do Produto\');\r\n		$crud->display_as(\'id_categoria_produto\',\'Categoria\');\r\n		$crud->display_as(\'data_atualizacao\',\'Data Atualização\');\r\n		$crud->display_as(\'preco\',\'Preço\');\r\n\r\n	 	$crud->set_relation(\'id_produto\',\'tbl_produto\',\'nome\');\r\n	 	$crud->set_relation(\'id_categoria_produto\',\'tbl_categoria_produto\',\'nome\', array(\'situacao\' => \'a\'));\r\n\r\n	 	$crud->field_type(\'tipo_cliente\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(14,1,'pedidos','	public function pedidos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_pedido\');\r\n		$crud->where(\'tbl_pedido.situacao <>\', \'e\');\r\n		$crud->order_by(\"data_entrega\", \"desc\");\r\n		$crud->set_subject(\'Cadastro de Valor do Produto\');\r\n		$crud->columns(\'id_cliente\',\'data_pedido\',\'data_entrega\',\'situacao\');\r\n		$crud->fields(\'id_pedido\',\'id_cliente\',\'id_cidade\',\'data_pedido\',\'valor\',\'valor_total\',\'situacao\',\'forma_pgto\',\'forma_entrega\',\r\n					  \'taxa_entrega\',\'data_entrega\',\'hora_entrega\',\'end_entrega\',\'num_entrega\',\'bairro_entrega\',\'comp_entrega\',\'data_pagamento\');\r\n		\r\n		$crud->display_as(\'id_cliente\',\'Nome do Cliente\');\r\n		$crud->display_as(\'id_cidade\',\'Cidade\');\r\n		$crud->display_as(\'data_pedido\',\'Data do Pedido\');\r\n		$crud->display_as(\'valor\',\'Valor\');\r\n		$crud->display_as(\'valor_total\',\'Valor Total\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'forma_pgto\',\'Forma Pgto\');\r\n		$crud->display_as(\'forma_entrega\',\'Forma Entrega\');\r\n		$crud->display_as(\'taxa_entrega\',\'Taxa de Entrega\');\r\n		$crud->display_as(\'data_entrega\',\'Data da Entrega\');\r\n		$crud->display_as(\'hora_entrega\',\'Hora de Entrega\');\r\n		$crud->display_as(\'end_entrega\',\'Novo Endereço\');\r\n		$crud->display_as(\'num_entrega\',\'N°\');\r\n		$crud->display_as(\'bairro_entrega\',\'Bairro\');\r\n		$crud->display_as(\'comp_entrega\',\'Complemento\');\r\n		$crud->display_as(\'data_pagamento\',\'Data Pagamento\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'s\' => \'Solicitação\', \'v\' => \'Visualizado\', \'p\' => \'Produzindo\', \'t\' => \'Saiu p/ entregar\', \'e\' => \'Entregue\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'forma_pgto\',\'dropdown\', array(\'d\' => \'Dinheiro\', \'cd\' => \'Cartão Débito\', \'cc\' => \'Cartão Crédito\'));\r\n		$crud->field_type(\'forma_entrega\',\'dropdown\', array(\'r\' => \'Retirar\', \'e\' => \'Entregar\'));\r\n\r\n	 	$crud->set_relation(\'id_cliente\',\'tbl_cliente\',\'nome\');\r\n	 	$crud->set_relation(\'id_cidade\',\'tbl_cidade\',\'nome\');\r\n\r\n	 	$crud->add_action(\'Itens do Pedido\', \'\', __CLASS__.\'/itemPedido\', \'ui-icon-plus\');\r\n	 	$crud->add_action(\'Cliente Pedido\', \'\', \'\', \'ui-icon-plus\', array($this,\'ClientePedido\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(15,1,'ClientePedido','	public function ClientePedido($primary_key , $row)\r\n	{\r\n		return site_url(__CLASS__.\"/cliente_unique/$row->id_cliente\");\r\n	}'),(16,1,'itemPedido','	public function itemPedido($id_pedido)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/pedidos\").\"\'>Voltar ao Pedido</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_item_pedido\');\r\n		$crud->where(\'tbl_item_pedido.id_pedido\', $id_pedido);\r\n		$crud->set_subject(\'Item Pedido\');\r\n		$crud->columns(\'id_pedido\',\'id_produto\',\'qtde\');\r\n		$crud->fields(\'id_item_pedido\',\'id_pedido\',\'id_produto\',\'qtde\', \'valor_unitario\');\r\n		\r\n		$crud->display_as(\'id_pedido\',\'Id do Pedido\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'qtde\',\'Qntde\');\r\n\r\n		$crud->set_relation(\'id_produto\',\'tbl_produto\',\'nome\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(17,1,'lojas','	public function lojas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_loja\');\r\n		$crud->set_subject(\'Loja\');\r\n		$crud->columns(\'id_loja\',\'nome_proprietario\',\'razao_social\',\'nome_fantasia\');\r\n		$crud->fields(\'id_loja\',\'nome_proprietario\',\'cpf\',\'razao_social\',\'nome_fantasia\',\'cnpj\',\'nr_inscricao_muni\',\'cnae\',\'data_nascimento\',\'data_abertura\',\'endereco\',\'numero\',\'complemento\',\'bairro\',\'cep\',\'municipio\',\'uf\');\r\n		\r\n		$crud->display_as(\'nome_proprietario\',\'Nome do Proprietário\');\r\n		$crud->display_as(\'cpf\',\'CPF\');\r\n		$crud->display_as(\'razao_social\',\'Razão Social\');\r\n		$crud->display_as(\'nome_fantasia\',\'Nome Fantasia\');\r\n		$crud->display_as(\'cnpj\',\'CNPJ\');\r\n		$crud->display_as(\'nr_inscricao_muni\',\'Insc. Municipal\');\r\n		$crud->display_as(\'cnae\',\'CNAE\');\r\n		$crud->display_as(\'data_nascimento\',\'Data Nascimento\');\r\n		$crud->display_as(\'data_abertura\',\'Data de Abertura\');\r\n		$crud->display_as(\'endereco\',\'Endereço\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'complemento\',\'Compl.\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'cep\',\'CEP\');\r\n		$crud->display_as(\'municipio\',\'Municipio\');\r\n		$crud->display_as(\'uf\',\'UF\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(18,1,'arquivo_controller','	public function arquivo_controller(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_arquivo_controller\');\r\n		$crud->set_subject(\'Arquivo Controller\');\r\n		$crud->columns(\'nome_controller\',\'diretorio\');\r\n		$crud->fields(\'nome_controller\',\'diretorio\');\r\n		\r\n		$crud->display_as(\'arquivo_controller_id\',\'Id Controller\');\r\n		$crud->display_as(\'nome_controller\',\'Nome da Controller\');\r\n		$crud->display_as(\'diretorio\',\'Diretório\');\r\n\r\n		$crud->required_fields(\'nome_controller\');\r\n\r\n	 	$crud->add_action(\'Funções\', \'\', __CLASS__.\'/funcoes\', \'ui-icon-plus\');\r\n	 	$crud->add_action(\'Gerar Controller\', \'\', __CLASS__.\'/gerar_controller\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(19,1,'funcoes','	public function funcoes($arquivo_controller_id){\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/arquivo_controller\").\"\'>Voltar ao Arq. Controller</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_function_controller\');\r\n		$crud->where(\'tbl_function_controller.arquivo_controller_id\', $arquivo_controller_id);\r\n		$crud->set_subject(\'Funções da Controller (\' . $arquivo_controller_id . \')\');\r\n		$crud->columns(\'nome_function\');\r\n		$crud->fields(\'arquivo_controller_id\',\'nome_function\',\'funcao\');\r\n		\r\n		$crud->display_as(\'arquivo_controller_id\',\'Id Controller\');\r\n		$crud->display_as(\'nome_function\',\'Nome da Function\');\r\n		$crud->display_as(\'funcao\',\'Função\');\r\n\r\n		$crud->required_fields(\'nome_function\',\'funcao\');\r\n\r\n		$crud->field_type(\'arquivo_controller_id\', \'hidden\', $arquivo_controller_id);\r\n\r\n		$crud->unset_texteditor(\'funcao\');		\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(20,1,'gerar_controller','	public function gerar_controller($arquivo_controller_id)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/arquivo_controller\").\"\'>Voltar ao Arq. Controller</a>\";\r\n\r\n		$controller = $this->Generico->getArquivoController($arquivo_controller_id);\r\n		$functions = $this->Generico->getFunctionByIdController($arquivo_controller_id);\r\n\r\n		$data = \r\n			\"<?php if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\\nclass $controller->nome_controller extends CI_Controller {\\n\";\r\n		foreach ($functions as $funcao) {\r\n			$data .= $funcao[\'funcao\'].\"\\n\\n\";\r\n		}\r\n		$data .= \'}\';\r\n\r\n		if (is_null($controller->diretorio)){\r\n			$dir_controller = FCPATH.\"/application/controllers/{$controller->nome_controller}.php\";\r\n		} else {\r\n			$dir_controller = FCPATH.\"/application/controllers/{$controller->diretorio}/{$controller->nome_controller}.php\";\r\n		}\r\n\r\n		if (write_file($dir_controller, $data) == FALSE)\r\n		{\r\n			$this->data[\'msg_file_create\'] = \'Unable to write the file\';\r\n		} else {\r\n			$this->data[\'msg_file_create\'] = \'File written!\';                           \r\n		}\r\n\r\n		$this->_example_output((object)array(\'output\' => \'\' , \'js_files\' => array() , \'css_files\' => array()));\r\n	}'),(21,1,'menu','	public function menu()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_menu\');\r\n		$crud->set_subject(\'Cadastro de Menu\');\r\n		$crud->columns(\'nome_menu\',\'menu_titulo\', \'order\', \'ativo\');\r\n		$crud->fields(\'nome_menu\',\'menu_titulo\',\'tag_i\', \'order\', \'ativo\');\r\n		\r\n		$crud->display_as(\'menu_id\',\'Id Menu\');\r\n		$crud->display_as(\'nome_menu\',\'Nome do Menu\');\r\n		$crud->display_as(\'menu_titulo\',\'Titulo\');\r\n		$crud->display_as(\'tag_i\',\'Tag Img\');\r\n		$crud->display_as(\'order\',\'N° Ordenação\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativado\', \'d\' => \'Desativado\'));\r\n\r\n		$crud->order_by(\'order\',\'asc\');\r\n\r\n		$crud->required_fields(\'nome_menu\');\r\n\r\n	 	$crud->add_action(\'Sub Menu\', \'\', __CLASS__.\'/submenu\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(22,1,'submenu','	public function submenu($menu_id)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/menu\").\"\'>Voltar ao Menu</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n		$crud->set_table(\'tbl_submenu\');\r\n		$crud->where(\'tbl_submenu.menu_id\', $menu_id);\r\n		$crud->set_subject(\'Cadastro do Sub Menu\');\r\n		$crud->columns(\'menu_id\',\'nome_submenu\',\'arquivo_controller_id\', \'function_controller_id\',\'order\', \'ativo\');\r\n		$crud->fields(\'menu_id\',\'nome_submenu\',\'arquivo_controller_id\', \'function_controller_id\',\'order\', \'ativo\');\r\n		\r\n		$crud->display_as(\'submenu_id\',\'Id Sub Menu\');\r\n		$crud->display_as(\'menu_id\',\'Menu\');\r\n		$crud->display_as(\'nome_submenu\',\'Nome Sub Menu\');\r\n		$crud->display_as(\'arquivo_controller_id\',\'Nome Controller\');\r\n		$crud->display_as(\'function_controller_id\',\'Nome Function\');\r\n		$crud->display_as(\'order\',\'N° Ordenação\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		\r\n		$crud->set_relation(\'arquivo_controller_id\', \'tbl_arquivo_controller\', \'nome_controller\');\r\n		$crud->set_relation(\'function_controller_id\', \'tbl_function_controller\', \'nome_function\');\r\n\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativado\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'menu_id\', \'hidden\', $menu_id);\r\n\r\n		$crud->required_fields(\'nome_submenu\',\'arquivo_controller_id\',\'function_controller_id\');\r\n\r\n		$this->load->library(\'gc_dependent_select\');\r\n\r\n		$fields = array(\r\n			// first field:\r\n			\'arquivo_controller_id\' => array( // first dropdown name\r\n			\'table_name\' => \'tbl_arquivo_controller\', // table of country\r\n			\'title\' => \'nome_controller\', // country title\r\n			\'relate\' => null // the first dropdown hasn\'t a relation\r\n			),\r\n			// second field\r\n			\'function_controller_id\' => array( // second dropdown name\r\n			\'table_name\' => \'tbl_function_controller\', // table of state\r\n			\'title\' => \'nome_function\', // state title\r\n			\'id_field\' => \'function_controller_id\', // table of state: primary key\r\n			\'relate\' => \'arquivo_controller_id\', // table of state:\r\n			\'data-placeholder\' => \'selecionar function\' //dropdown\'s data-placeholder:\r\n			)\r\n		);\r\n\r\n		$config = array(\r\n			\'main_table\' => \'tbl_submenu\',\r\n			\'main_table_primary\' => \'submenu_id\',\r\n			\"url\" => base_url() . \'index.php/\' . __CLASS__ . \'/\', //	.$id.\'/add\' //path to method\r\n			\'ajax_loader\' => base_url() . \'ajax-loader.gif\', // path to ajax-loader image. It\'s an optional parameter\r\n			\'segment_name\' =>\'get_functionByIdController\' // It\'s an optional parameter. by default \"get_items\"\r\n		);\r\n\r\n		$mult = new gc_dependent_select($crud, $fields, $config);\r\n\r\n		// the second method:\r\n		$js = $mult->get_js();\r\n\r\n		$output = $crud->render();\r\n\r\n		$output->output.= $js;\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(23,1,'get_functionByIdController','	public function get_functionByIdController($id){\r\n		$functions = $this->Generico->getFunctionByIdController($id);\r\n		\r\n		$arr = array();\r\n		foreach ($functions as $item) {\r\n			array_push($arr, array(\'value\' => $item[\'function_controller_id\'], \'property\' => $item[\'nome_function\']));\r\n		}\r\n		\r\n		echo json_encode($arr);\r\n	}'),(24,1,'estoque','	public function estoque(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_estoque\');\r\n		$crud->set_subject(\'Consulta de Estoque\');\r\n		$crud->columns(\'id_loja\',\'id_produto\', \'qtde_minima\', \'qtde_total\');\r\n		$crud->edit_fields(\'qtde_minima\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'qtde_minima\',\'Qtde Estoque Minimo\');\r\n		$crud->display_as(\'qtde_total\',\'Qtde Disponível\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\'));\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->required_fields(\'id_loja\',\'id_produto\', \'movimentacao\', \'qtde_minima\', \'qtde_movimento\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(25,1,'movimentacao_estoque','	public function movimentacao_estoque(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_movimentacao_estoque\');\r\n		$crud->set_subject(\'Movimentação de Estoque\');\r\n		$crud->columns(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\', \'id_item_pedido\');\r\n		$crud->fields(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'tipo_movimentacao\',\'Movimentação de\');\r\n		$crud->display_as(\'qtde_movimentacao\',\'Qtde Movimentação\');\r\n		$crud->display_as(\'data_movimentacao\',\'Data Movimentação\');\r\n		$crud->display_as(\'id_item_pedido\',\'Id Item Pedido\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'data_movimentacao\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		\r\n		$crud->required_fields(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\');\r\n\r\n		$crud->unset_delete();\r\n		$crud->unset_edit();\r\n\r\n		$crud->callback_after_insert(array($this, \'after_insert_update_mov_estoque\'));\r\n		$crud->callback_after_update(array($this, \'after_insert_update_mov_estoque\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(26,1,'after_insert_update_mov_estoque','	public function after_insert_update_mov_estoque($post_array,$primary_key){\r\n		$this->Generico->geraEstoque($post_array[\'id_loja\'], $post_array[\'id_produto\'], $post_array[\'tipo_movimentacao\'], $post_array[\'qtde_movimentacao\']);\r\n		$this->Generico->geraFichaKardex($post_array[\'id_loja\'], $post_array[\'id_produto\'], $post_array[\'tipo_movimentacao\'], \'me\', $post_array[\'qtde_movimentacao\']);\r\n	}'),(27,1,'ficha_kardex','	public function ficha_kardex(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_ficha_kardex\');\r\n		$crud->set_subject(\'Ficha Kardex\');\r\n		$crud->columns(\'id_ficha_kerdex\', \'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'origem_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		$crud->fields(\'id_ficha_kerdex\',\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'origem_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'origem_movimentacao\',\'Origem da Movimentação\');\r\n		$crud->display_as(\'tipo_movimentacao\',\'Movimentação de\');\r\n		$crud->display_as(\'qtde_movimentacao\',\'Qtde Movimentação\');\r\n		$crud->display_as(\'data_movimentacao\',\'Data Movimentação\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'origem_movimentacao\',\'dropdown\', array(\'me\' => \'Movimentação Estoque\', \'nfs\' => \'Nf Saída\', \'nfe\' => \'Nf Entrada\', \'ps\' => \'Pedido no Site\'));\r\n\r\n		$crud->unset_delete();\r\n		$crud->unset_edit();\r\n		$crud->unset_add();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(28,1,'postMoviEstoque','	public function postMoviEstoque(){\r\n		if($_POST){\r\n			$this->Generico->gerarMovimentacao($_POST[\'id_loja\'], $_POST[\'id_produto\'], $_POST[\'tipo_movimentacao\'], $_POST[\'qtde_movimentacao\']);\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(29,1,'afazer','	public function afazer(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_afazer\');\r\n		$crud->set_subject(\'A Fazer\');\r\n		$crud->columns(\'id_afazer\', \'afazer\', \'dt_inicio\', \'dt_fim\', \'realizado\');\r\n		$crud->fields(\'afazer\', \'dt_inicio\', \'dt_fim\', \'realizado\');\r\n		\r\n		$crud->display_as(\'id_afazer\',\'Id A Fazer\');\r\n		$crud->display_as(\'afazer\',\'A Fazer\');\r\n		$crud->display_as(\'dt_inicio\',\'Data Inicio\');\r\n		$crud->display_as(\'dt_fim\',\'Data Fim\');\r\n		$crud->display_as(\'realizado\',\'Realizado\');\r\n\r\n		$crud->field_type(\'realizado\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n\r\n		$crud->required_fields(\'afazer\', \'dt_inicio\', \'realizado\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(30,1,'postAFazer','	public function postAFazer(){\r\n		if($_POST){\r\n			$this->Generico->AFazerRealizado($_POST[\'id_afazer\'], $_POST[\'realizado\']);\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(31,1,'postPedidoEntregue','	public function postPedidoEntregue(){\r\n		if($_POST){\r\n			$this->Generico->AlterarSituacaoPedido($_POST[\'id_pedido\'], \'e\');\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(32,1,'postCancelarPedido','	public function postCancelarPedido(){\r\n		if($_POST){\r\n			$pedido = $this->Generico->getPedidoSolicitados($_POST[\'id_pedido\']);\r\n			foreach ($pedido[0][\'itens\'] as $items) {\r\n				$this->Generico->gerarMovimentacao($pedido[0][\'id_cidade\'], $items[\'id_produto\'], \'c\', $items[\'qtde\'], $items[\'id_item_pedido\']);\r\n				$this->Generico->AlterarSituacaoPedido($_POST[\'id_pedido\'], \'c\');\r\n			}\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}');

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_item_pedido` */

LOCK TABLES `tbl_item_pedido` WRITE;

insert  into `tbl_item_pedido`(`id_item_pedido`,`id_pedido`,`id_produto`,`id_categoria_produto`,`qtde`,`valor_unitario`) values (66,75,39,0,10,0.45),(67,75,14,0,40,0.40),(68,76,14,0,10,0.45),(69,77,14,0,10,0.45),(70,78,14,0,10,0.45),(71,79,14,0,10,0.45),(72,80,14,0,20,0.45),(73,81,14,0,50,0.45),(74,82,14,0,20,0.45),(75,83,14,0,10,0.45),(76,83,14,0,10,0.40),(77,84,14,3,10,0.45),(78,84,15,3,10,0.45),(79,84,14,4,10,0.40),(80,85,14,3,10,0.45);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_menu` */

LOCK TABLES `tbl_menu` WRITE;

insert  into `tbl_menu`(`menu_id`,`nome_menu`,`menu_titulo`,`tag_i`,`order`,`ativo`) values (1,'Painel de Controle','Principal','ti-panel',1.000,'a'),(2,'Configurações','Configurações','ti-settings',2.000,'a'),(3,'Manutenção','Cadastro Básico','ti-view-list-alt',3.000,'a'),(4,'Estoque','Movimentação','ti-layers-alt',4.000,'a'),(5,'Produtos',NULL,'ti-files',3.100,'a'),(6,'Pedidos',NULL,'ti-book',4.100,'a'),(7,'A Fazer','Meta','ti-bookmark',5.000,'a');

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
  KEY `FK_MOV_ESTQ_ITEM_PEDIDO` (`id_item_pedido`),
  CONSTRAINT `FK_MOV_ESTQ_ITEM_PEDIDO` FOREIGN KEY (`id_item_pedido`) REFERENCES `tbl_item_pedido` (`id_item_pedido`),
  CONSTRAINT `FK_MOV_ESTQ_LOJA` FOREIGN KEY (`id_loja`) REFERENCES `tbl_loja` (`id_loja`),
  CONSTRAINT `FK_MOV_ESTQ_PROD` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_movimentacao_estoque` */

LOCK TABLES `tbl_movimentacao_estoque` WRITE;

insert  into `tbl_movimentacao_estoque`(`id_movimentacao_estoque`,`id_loja`,`id_produto`,`tipo_movimentacao`,`qtde_movimentacao`,`data_movimentacao`,`id_item_pedido`) values (27,1,14,'s',10,'2018-07-17 15:47:27',80),(28,1,14,'c',20,'2018-07-17 22:13:17',74),(29,1,14,'c',20,'2018-07-17 22:16:27',74),(30,1,14,'c',20,'2018-07-17 22:17:19',74);

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
  `num_entrega` varchar(10) DEFAULT NULL,
  `bairro_entrega` varchar(150) DEFAULT NULL,
  `comp_entrega` varchar(100) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL COMMENT 'data do dia do pagamento',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_cidade` (`id_cidade`),
  CONSTRAINT `tbl_pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `tbl_pedido_ibfk_2` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Pedido do Salgado';

/*Data for the table `tbl_pedido` */

LOCK TABLES `tbl_pedido` WRITE;

insert  into `tbl_pedido`(`id_pedido`,`id_cliente`,`id_cidade`,`situacao`,`data_pedido`,`valor`,`valor_total`,`forma_pgto`,`forma_entrega`,`taxa_entrega`,`data_entrega`,`hora_entrega`,`end_entrega`,`num_entrega`,`bairro_entrega`,`comp_entrega`,`data_pagamento`) values (15,10,1,'e','2017-11-04 00:00:00',22.50,25.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,11,1,'e','2017-11-09 00:00:00',31.50,34.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,12,1,'e','2017-11-09 00:00:00',24.00,27.00,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,13,1,'e','2017-11-29 15:57:57',40.00,43.00,'d','',3.00,'2017-12-01','13:30h',NULL,NULL,NULL,NULL,NULL),(26,11,1,'e','2018-01-11 08:28:24',45.00,48.00,'d','',3.00,'2018-01-13','19:30h',NULL,NULL,NULL,NULL,NULL),(27,14,1,'e','2018-06-04 11:29:29',13.50,16.50,'cd','',3.00,'2018-06-06',NULL,NULL,NULL,NULL,NULL,NULL),(28,15,2,'e','2018-06-07 21:20:21',45.00,48.00,'cd','',3.00,'2018-06-09','13:30h',NULL,NULL,NULL,NULL,NULL),(74,22,1,'e','2018-07-13 19:30:17',9.00,9.00,'d','r',7.00,'2018-07-14','11:00',NULL,NULL,NULL,NULL,NULL),(75,22,1,'e','2018-07-14 09:51:17',20.50,20.50,'d','r',7.00,'2018-07-14','14:00',NULL,NULL,NULL,NULL,NULL),(76,22,1,'e','2018-07-16 12:55:53',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL),(77,22,1,'e','2018-07-16 12:55:53',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL),(78,22,1,'e','2018-07-16 13:19:42',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL),(79,22,1,'e','2018-07-16 13:21:48',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL),(80,22,1,'e','2018-07-16 16:20:44',9.00,9.00,'d','r',7.00,'2018-07-17','11:00',NULL,NULL,NULL,NULL,NULL),(81,22,1,'e','2018-07-16 17:15:54',22.50,22.50,'d','r',7.00,'2018-07-17','11:00',NULL,NULL,NULL,NULL,NULL),(82,22,1,'c','2018-07-16 17:16:50',9.00,9.00,'d','r',7.00,'2018-07-17','11:00',NULL,NULL,NULL,NULL,NULL),(83,22,1,'s','2018-07-17 12:51:05',8.50,15.50,'d','e',7.00,'2018-07-17','16:00',NULL,NULL,NULL,NULL,NULL),(84,22,1,'s','2018-07-17 13:10:08',13.00,13.00,'cd','r',7.00,'2018-07-18','12:00',NULL,NULL,NULL,NULL,NULL),(85,22,1,'s','2018-07-17 15:47:18',4.50,4.50,'d','r',7.00,'2018-07-18','11:00',NULL,NULL,NULL,NULL,NULL);

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
  PRIMARY KEY (`id_representante_recebimento`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_submenu` */

LOCK TABLES `tbl_submenu` WRITE;

insert  into `tbl_submenu`(`submenu_id`,`menu_id`,`nome_submenu`,`arquivo_controller_id`,`function_controller_id`,`order`,`ativo`) values (1,1,'Inicio',1,5,1,'a'),(2,2,'Cadastrar Tipo',1,10,1,'a'),(3,2,'Cadastrar Menus',1,21,2,'a'),(4,2,'Cadastrar Arquivo Controller',1,18,3,'a'),(5,3,'Cadastrar Clientes',1,7,1,'a'),(6,3,'Cadastrar Cidades',1,8,2,'a'),(7,3,'Cadastrar Fornecedores',1,9,3,'a'),(9,3,'Cadastrar Lojas',1,17,4,'a'),(10,5,'Cadastrar Categorias',1,11,1,'a'),(11,5,'Cadastrar Produtos',1,12,2,'a'),(12,4,'Movimentação de Estoque',1,25,1,'a'),(13,4,'Consulta de Estoque',1,24,2,'a'),(14,6,'Pedidos Solicitados',1,14,1,'a'),(15,4,'Ficha Kardex',1,27,3,'a'),(16,7,'A Fazer',1,29,1,'a');

UNLOCK TABLES;

/*Table structure for table `tbl_tipo` */

DROP TABLE IF EXISTS `tbl_tipo`;

CREATE TABLE `tbl_tipo` (
  `campo` varchar(50) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Tabelas de Tipo';

/*Data for the table `tbl_tipo` */

LOCK TABLES `tbl_tipo` WRITE;

insert  into `tbl_tipo`(`campo`,`tipo`,`descricao`,`id_tipo`) values ('forma_pgto','d','Dinheiro',1),('forma_pgto','cd','Cartão de Débito',2),('forma_pgto','cc','Cartão de Crédito',3),('hora_entrega','11:00','11:00h',4),('hora_entrega','12:00','12:00h',5),('hora_entrega','13:00','13:00h',6),('hora_entrega','14:00','14:00h',7),('hora_entrega','15:00','15:00h',8),('hora_entrega','16:00','16:00h',9),('hora_entrega','17:00','17:00h',10),('hora_entrega','18:00','18:00h',11),('hora_entrega','19:00','19:00h',12);

UNLOCK TABLES;

/*Table structure for table `tbl_valor_produto` */

DROP TABLE IF EXISTS `tbl_valor_produto`;

CREATE TABLE `tbl_valor_produto` (
  `id_valor_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ValoresProduto',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `data_atualizacao` date NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `tipo_cliente` char(1) DEFAULT NULL COMMENT 'c - cliente / r - revendedor / s - representante / p - parceiro',
  `id_categoria_produto` int(11) DEFAULT NULL,
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
