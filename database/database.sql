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

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('0kd4e6t11ovb3crdqe3tm3nhnubb5vla','::1',1532088376,'__ci_last_regenerate|i:1532088376;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('14g5e3soikv4k72a2apkj9jjbf33fgbf','::1',1532121145,'__ci_last_regenerate|i:1532121145;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('25cn6lvrn5eeikochgr1b4v0adm7ot15','::1',1532120349,'__ci_last_regenerate|i:1532120349;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('2gctvtod92gvnss0n92ujeombkvg54iu','::1',1532033177,'__ci_last_regenerate|i:1532033177;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('2ticqk58b4aqb86htgelohaj1nbf5dnr','::1',1533070895,'__ci_last_regenerate|i:1533070895;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('3ek43mk40m2bcf3ujg0ro8qtp30d5nk6','::1',1532032873,'__ci_last_regenerate|i:1532032873;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('40jbdv0p0k5b25jsnmif346saqs1f093','::1',1533241492,'__ci_last_regenerate|i:1533241492;'),('4ctded22vabkq3d2iuovbq7frgl53g41','::1',1533153862,'__ci_last_regenerate|i:1533153862;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('4kmme8a32buj2mhcbhl0r175tka59lhe','::1',1532091587,'__ci_last_regenerate|i:1532091587;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('4og1n3lrfkut6u9k9sulvparamvicolc','::1',1532026519,'__ci_last_regenerate|i:1532026519;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('4slq765rldv36amsnieou63joclnv7qh','::1',1533153438,'__ci_last_regenerate|i:1533153438;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('6rji83am42bg4dcm4if8rp3h03odvuem','::1',1532032210,'__ci_last_regenerate|i:1532032210;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('7jec1p75u2hbo50t1dv2grt7j34jf5jc','::1',1532087804,'__ci_last_regenerate|i:1532087804;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('857gfs0k6i33ksu81tllk4f5e6fqi58a','::1',1532108973,'__ci_last_regenerate|i:1532108973;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('8g0a400t75a8vdhs91m4hngm455752l4','::1',1533314073,'__ci_last_regenerate|i:1533314073;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('9kfrb4vt3i3ce5d66g2cgqu58b2gpjiu','::1',1532121833,'__ci_last_regenerate|i:1532121833;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('bh6bm056huqsntgdjgtboob687n5oqg0','::1',1532101219,'__ci_last_regenerate|i:1532101219;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('c28fhevbj145sspq4v9jiikv70drnki7','::1',1533313391,'__ci_last_regenerate|i:1533313391;'),('cljskkdpv247q19hvep03a2j1lttecto','::1',1532091286,'__ci_last_regenerate|i:1532091286;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('cucj29jsjshihbhjpofd26vi1f472t3t','::1',1533330680,'__ci_last_regenerate|i:1533330680;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('datl2hbnrioc3b3u4kbjl69m4n4mlta4','::1',1532093087,'__ci_last_regenerate|i:1532093087;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('dmdmi656mh8fu7go0d9ofhelrkq0kkrp','::1',1532115168,'__ci_last_regenerate|i:1532115168;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('dud9d0qu52ef5cs2hmnu2kvgqchgn9f3','::1',1532027573,'__ci_last_regenerate|i:1532027573;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('e99oq7nb65l0mb3gn5indlkh6s3qjot2','::1',1532031686,'__ci_last_regenerate|i:1532031686;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ebe29gkt8f03r8vejghr7mgmggjh7nj2','::1',1533212188,'__ci_last_regenerate|i:1533212188;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('efuv42dp0jr5t018etqf50edak7am4pd','::1',1532033656,'__ci_last_regenerate|i:1532033656;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ev44rr3oj5q6t6qp5cm9v3f1hlq01137','::1',1533328224,'__ci_last_regenerate|i:1533328224;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('fasc2d8ncsm403ftodudi4bsd8dfrhsh','::1',1533330985,'__ci_last_regenerate|i:1533330680;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('fkikudm0euijhvjqvvabuit0t1t3pnqa','::1',1532120828,'__ci_last_regenerate|i:1532120828;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('fqreiut3plct824njsid3i80fbpjga7i','::1',1532112101,'__ci_last_regenerate|i:1532112101;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('g9pdns8gne8l0lrjp1b0bfoad8vsmhqb','::1',1532103003,'__ci_last_regenerate|i:1532103003;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('gcsa07goroal0g8tbtp5tpc10qk7tnk3','::1',1533212190,'__ci_last_regenerate|i:1533212188;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('gr45n7f4etc1vad4idpmmlbghd2bt03m','::1',1532114758,'__ci_last_regenerate|i:1532114758;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('h1ap3lak1aeocuqdqerc26dd79587phn','::1',1533324674,'__ci_last_regenerate|i:1533324674;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('hlv0dhrfc02evnqm3631dvsn5maa847n','::1',1532092749,'__ci_last_regenerate|i:1532092749;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ias9fjd5n3of4m46hjqo5o7lvd5ojlqj','::1',1533159961,'__ci_last_regenerate|i:1533155499;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('icgaot4a1f7d4rbr8rb86hs3np8ttit9','::1',1533314073,'__ci_last_regenerate|i:1533314073;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('iespsemahpek2pihsd4c25k50c83h0b9','::1',1533154545,'__ci_last_regenerate|i:1533154545;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('iqmr3ibns8jp4fne28144doi85074e24','::1',1532089768,'__ci_last_regenerate|i:1532089768;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ivbttf55ur8pc7eb9p4f945uplh1trn1','::1',1532028413,'__ci_last_regenerate|i:1532028413;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('j7ahqnqnc9sl9lk59ihh1sdnntommf89','::1',1532121451,'__ci_last_regenerate|i:1532121451;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('j8p4otg6053maf4ibae3q1t66gdvs61j','::1',1533328530,'__ci_last_regenerate|i:1533328530;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('jh73o68p63gt99p8afkc7rtn79l7elec','::1',1533324344,'__ci_last_regenerate|i:1533324344;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('k9d8e1o4oegec5le2h4hnc7pqt8bd92i','::1',1533153114,'__ci_last_regenerate|i:1533153114;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('kod04c41hveat5t8efhr6q0448jq7shu','::1',1533154854,'__ci_last_regenerate|i:1533154854;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('l07iqi1me54e2e2gku21r2leb5109hbk','::1',1533059865,'__ci_last_regenerate|i:1533055327;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('lthsmopu4ljbthkfo2d4pe3600ar28i0','::1',1533154236,'__ci_last_regenerate|i:1533154236;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('n7l38mdtbic702lat7st8dakmk5fnkej','::1',1532035158,'__ci_last_regenerate|i:1532033656;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('o0kc8i3j771kt8125phk6laa8ba837uk','::1',1532092319,'__ci_last_regenerate|i:1532092319;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ocnn29sd5neecrnqu620n3albgga44cr','::1',1533071553,'__ci_last_regenerate|i:1533071553;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('oev1v6guue3fbnh4t0a8fe9guujb6bgc','::1',1533069708,'__ci_last_regenerate|i:1533069708;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ojljf0dloa480oatim5ftohlu0minj41','::1',1533152797,'__ci_last_regenerate|i:1533152797;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('p8rclc5e8121tc4ir299bke1l8sns1nk','::1',1533055327,'__ci_last_regenerate|i:1533055327;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('pfja5nrvmfs8l33grsv6a5tbrqtrt2g1','::1',1532115931,'__ci_last_regenerate|i:1532115931;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ptn2majvcls1upqnakn1ptiogde8q4to','::1',1532089251,'__ci_last_regenerate|i:1532089251;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('q814milnruv3embc0tlhlearkstdpe13','::1',1532090942,'__ci_last_regenerate|i:1532090942;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('qpnrc4302lsns3pb06dr0sk3qcpbh52v','::1',1533071219,'__ci_last_regenerate|i:1533071219;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('rbp9c7ddu4cur3ceo4apmnoa2l573urr','::1',1532119969,'__ci_last_regenerate|i:1532119969;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('renu4ckfjuccr96djjkkspr6kl6n9tvo','::1',1532032516,'__ci_last_regenerate|i:1532032516;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('s53dj23sjpp5pnb2aln3f8c5jjsna68a','::1',1533074855,'__ci_last_regenerate|i:1533071553;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('t5k8tjbi8lrnhdfscphnpviu3l8ma632','::1',1533155499,'__ci_last_regenerate|i:1533155499;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('tshsou55hrpf9n7o68cgvb3d3b59cl4f','::1',1532122640,'__ci_last_regenerate|i:1532122640;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('u6tffr11drk5bpi87tct6a5rnnss4c1d','::1',1532093721,'__ci_last_regenerate|i:1532093721;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('ugsk48i2meihdels31a6tacb36u4isg1','::1',1532137071,'__ci_last_regenerate|i:1532122640;is_loginho|b:1;nome_user|s:7:\"Matheus\";'),('v6qobg8dumda6l10girukn9lejksapsq','::1',1532090473,'__ci_last_regenerate|i:1532090473;is_loginho|b:1;nome_user|s:7:\"Matheus\";');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_cart` */

LOCK TABLES `tbl_cart` WRITE;

insert  into `tbl_cart`(`id_cart`,`id_session`,`id_categoria_produto`,`id_produto`,`id_cidade`,`qtde`,`valor_unitario`,`situacao`,`cod_promo`) values (2,'76abb1d174afe90b48403c9b98fa8eba',3,15,1,10,0.45,'d','0'),(3,'76abb1d174afe90b48403c9b98fa8eba',3,15,1,10,0.45,'d','0'),(4,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,14,1,40,0.45,'a','0'),(5,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,15,1,30,0.45,'a','0'),(6,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,16,1,30,0.45,'a','0'),(7,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,16,1,10,0.45,'a','0'),(8,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,18,1,20,0.45,'a','0'),(9,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,18,1,40,0.45,'a','0'),(10,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,18,1,10,0.45,'a','0'),(11,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,18,1,10,0.45,'a','0'),(12,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,17,1,30,0.45,'a','0'),(13,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,17,1,20,0.45,'a','0'),(15,'4d48895e978f7e285b9ce37ad43ebde3',4,14,1,30,0.40,'d','0'),(16,'4d48895e978f7e285b9ce37ad43ebde3',4,14,1,10,0.40,'d','0'),(17,'4d48895e978f7e285b9ce37ad43ebde3',3,39,1,10,0.45,'d','0'),(18,'dbc262b62a18f9bd96db1dfb727a0280',3,14,1,10,0.45,'d','0'),(19,'a21137a1611878b68fe79e2bb5b648f7',3,14,1,10,0.45,'d','0'),(20,'2fd839424524994f96b22e802c9769f7',3,14,1,10,0.45,'d','0'),(21,'26cab29561f00b193daf19ba1b87a216',3,14,1,10,0.45,'d','0'),(22,'26cab29561f00b193daf19ba1b87a216',3,14,1,10,0.45,'d','0'),(23,'2c786df43c1e6daaef072d9b97608491',3,14,1,10,0.45,'d','0'),(24,'2c786df43c1e6daaef072d9b97608491',3,14,1,40,0.45,'d','0'),(25,'168a8d5fb73568d367b27091b7a326d8',3,14,1,20,0.45,'d','0'),(26,'dcbabc824f1c1902ff31157ecac55fe0',3,14,1,10,0.45,'d','0'),(27,'dcbabc824f1c1902ff31157ecac55fe0',4,14,1,10,0.40,'d','0'),(28,'108b2b8e3a47fd83d7f0c8133d4f0411',3,14,1,10,0.45,'d','0'),(29,'108b2b8e3a47fd83d7f0c8133d4f0411',3,15,1,10,0.45,'d','0'),(30,'108b2b8e3a47fd83d7f0c8133d4f0411',4,14,1,10,0.40,'d','0'),(31,'6c3059eaf980aed66a62f1358ffa3a99',3,14,1,10,0.45,'d','0'),(35,'eae64936af1ec5c12d85017f835b7fed',3,16,1,40,0.45,'a','0'),(36,'fc311772ca515836719d3f6569f29b54',3,14,1,10,0.45,'d','0'),(37,'9257ffc4f3a1807fd08b99ca9c9edec6',3,16,1,10,0.45,'d','0'),(38,'9257ffc4f3a1807fd08b99ca9c9edec6',3,18,1,10,0.45,'d','0'),(39,'98386affb8ac5112b1b4782388201333',3,14,1,10,0.45,'d','0'),(40,'98386affb8ac5112b1b4782388201333',3,16,1,10,0.45,'d','0'),(41,'62c616f416365b0d92a8f031464ed6c5',3,14,1,10,0.45,'d','0'),(42,'86a13a8b35fa3150f84535987d5e6a44',3,14,1,10,0.45,'d','0'),(43,'86a13a8b35fa3150f84535987d5e6a44',3,16,1,10,0.45,'d','0'),(44,'86a13a8b35fa3150f84535987d5e6a44',3,18,1,10,0.45,'d','0'),(45,'86a13a8b35fa3150f84535987d5e6a44',3,15,1,10,0.45,'d','0');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Cliente';

/*Data for the table `tbl_cliente` */

LOCK TABLES `tbl_cliente` WRITE;

insert  into `tbl_cliente`(`id_cliente`,`nome`,`email`,`senha`,`telefone`,`endereco`,`numero`,`bairro`,`complemento`,`situacao`,`tipo`,`ganho_unitario`,`cpf_cnpj`,`hash`,`ativo`,`id_cidade`,`dt_cadastro`) values (10,'Fernanda Lujan Torolio gonzalez','ferlujangom@hotmail.com','','11988775176','Av do café 1149 bl B ap 103','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(11,'Juliana Roberta Verissimo','julianarverissimo@gmail.com','','16992155377','Rua Monte Santo, 324','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(12,'ANA CAROLINA TASCHETI','taschetty@hotmail.com','','16 99247-4154','macario da silva ribeiro 99','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(13,'Carol','carolynebrito3@gmail.com','','16 99161-2326','Rua Paraguaçu Paulista 137','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(14,'Alfredo souza','alfredosouza2012@bol.com.br','','16992839989','Rua Antônio Martinez, 222','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(15,'Jessica','jessicamylove47@hotmail.com','','16991676217','Macir ramazini 2462','','',NULL,'a','c',NULL,NULL,NULL,'0',NULL,NULL),(22,'MATHEUS DE MELLO','matheus.gnu@gmail.com','e3bcdf1347b79080238afbe758cf103d','16991838523','Av. Plínio Castro Prado 431, Apto 33','1000','centro',NULL,'a','c',0.00,NULL,NULL,'1',NULL,NULL),(23,'valeria loppi simoes de abreu oliveira','valeria.loppi26@gmail.com','6464248e8460c1f803c4ea1d8867652b','199971156160','av presidente vargs','1617','JARDIM IRAJA','loja 02 -loja mais natural','a','c',0.00,NULL,NULL,'1',NULL,NULL),(24,'Leonardo Patricio','nosferaturaiu@gmail.com','dad96e9e0dfe82c0deda5673e539b96f','16993758806','Vicente Della Ricci','30','Geraldo de Carvalho','30','a','c',0.00,NULL,'1ff1de774005f8da13f42943881c655f',NULL,NULL,NULL),(25,'Micael Monteiro','Mica__pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo Horizonte',NULL,'a','c',0.00,NULL,'8e296a067a37563370ded05f5a3bf3ec',NULL,NULL,NULL),(26,'Micael monteiro','mica_pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo horizonte',NULL,'a','c',0.00,NULL,NULL,'1',NULL,NULL),(28,'Teste','teste@teste.com','e3bcdf1347b79080238afbe758cf103d','016 99191 9933',NULL,NULL,NULL,NULL,'a','c',0.00,NULL,'','1',NULL,'2018-07-24 14:45:57');

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

insert  into `tbl_conta_corrente`(`id_conta_corrente`,`nome_conta_corrente`,`interna`,`banco`,`agencia`,`digito_ag`,`conta_corrente`,`digito_cc`,`principal`,`ativo`) values (1,'itau','S','49','8011',NULL,'18080','2','s','a');

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

insert  into `tbl_conta_gerencial`(`id_conta_gerencial`,`nome_conta_gerencial`,`tipo_conta`,`id_conta_dre`,`cc_debito`,`cc_credito`,`permite_compras`,`ativo`) values (1,'Abatimentos','s','','','','n','a'),(2,'Água','s','190',NULL,NULL,'n','a'),(3,'Aluguel','s','182','','','n','a'),(4,'Aluguel de Equipamentos','s','185','','','n','a'),(5,'Amortização de Empréstimos','s','184','','','n','a'),(6,'as e Equipamentos Próprios','s','185','','','n','a'),(7,'Benefícios Salariais','s','187','','','n','a'),(8,'Brindes','s','189','','','n','a'),(9,'Combustível e Pedágios','s','185','','','n','a'),(10,'Comissão de Vendas','s','187','','','n','a'),(11,'Condomínio','s','182','','','n','a'),(12,'Contabilidade','s','185','','','n','a'),(13,'Devoluções','s','186','','','n','a'),(14,'Embalagem','s','183','','','n','a'),(15,'Encargos Salariais','s','187','','','n','a'),(16,'Eventos','s','189','','','n','a'),(17,'Frete','s','185','','','n','a'),(18,'Honorários Advocatícios','s','185','','','n','a'),(19,'Impostos','s','186','','','n','a'),(20,'Internet','s','190','','','n','a'),(21,'IPTU','s','182','','','n','a'),(22,'Juros de Empréstimos','s','184','','','n','a'),(23,'Limpeza','s','185','','','n','a'),(24,'Luz','s','190','','','n','a'),(25,'Manutenção','s','185','','','n','a'),(26,'Material de Escritório','s','185','','','n','a'),(27,'Matéria-Prima','s','183','','','n','a'),(28,'Mercadoria para Revenda','s','183','','','n','a'),(29,'Outras Despesas','s','','','','n','a'),(30,'Outras Despesas','s','','','','n','a'),(31,'PAGAMENTO A FORNECEDOR','s','183','','','n','a'),(33,'Propaganda','s','189','','','n','a'),(34,'Salários','s','187','','','n','a'),(35,'SALGADERIA CASTRO','s','183','','','n','a'),(36,'Segurança','s','185','','','n','a'),(37,'Seguros em Geral','s','185','','','n','a'),(38,'Serviços de Entrega','s','185','','','n','a'),(39,'Tarifas Bancárias','s','184','','','n','a'),(40,'Telefone Celular','s','190','','','n','a'),(41,'Telefone Fixo','s','190','','','n','a'),(42,'Transferência','s','185','','','n','a'),(43,'TV a Cabo','s','190','','','n','a'),(44,'Viagem e Hospedagem','s','185','','','n','a'),(45,'Aportes ou Empréstimos','E','191','','','n','a'),(46,'Outras Receitas','E','','','','n','a'),(47,'Outras Receitas','E','','','','n','a'),(48,'Rendimentos de Aplicação Bancária','E','191','','','n','a'),(49,'Transferência','E','192','','','n','a'),(50,'Vendas via Loja Virtual','E','192','','','n','a'),(51,'Vendas via PDV','E','192','','','n','a'),(52,'Vendas via Pedido','E','192','','','n','a');

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
  `nr_vezes` char(4) DEFAULT NULL COMMENT '1x/2x/3x/4x ...',
  PRIMARY KEY (`id_contas_apagar`),
  KEY `FK_CONTAS_APAGAR_FORNECEDOR` (`id_fornecedor`),
  KEY `FK_CONTAS_APAGAR_CONTA_GERENECIAL` (`id_conta_gerencial`),
  KEY `FK_CONTAS_APAGAR_CONTA_CORRENTE` (`id_conta_corrente`),
  CONSTRAINT `FK_CONTAS_APAGAR_CONTA_CORRENTE` FOREIGN KEY (`id_conta_corrente`) REFERENCES `tbl_conta_corrente` (`id_conta_corrente`),
  CONSTRAINT `FK_CONTAS_APAGAR_CONTA_GERENECIAL` FOREIGN KEY (`id_conta_gerencial`) REFERENCES `tbl_conta_gerencial` (`id_conta_gerencial`),
  CONSTRAINT `FK_CONTAS_APAGAR_FORNECEDOR` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_contas_apagar` */

LOCK TABLES `tbl_contas_apagar` WRITE;

insert  into `tbl_contas_apagar`(`id_contas_apagar`,`dt_cadastro`,`id_conta_gerencial`,`id_fornecedor`,`id_documento`,`dt_venc`,`valor_apagar`,`dt_pago`,`id_conta_corrente`,`valor_pgto`,`valor_desconto`,`valor_juros`,`obs`,`conta_fixa`,`situacao`,`tipo_pagamento`,`nr_vezes`) values (1,'2018-07-20',2,1,NULL,'2018-07-25',50.00,'2018-07-25',1,50.00,NULL,NULL,NULL,'s','p','176',NULL),(2,'2018-07-20',31,1,NULL,'2018-07-24',100.00,'2018-07-25',1,100.00,NULL,NULL,NULL,'n','p','176',NULL),(3,'2018-07-20',2,1,NULL,'2018-08-25',50.00,NULL,1,NULL,NULL,NULL,NULL,'s','a',NULL,NULL),(6,'2018-08-01',26,1,NULL,'2018-08-02',50.00,'2018-08-01',1,50.00,NULL,NULL,NULL,'n','p','170','3'),(7,'2018-08-01',26,1,NULL,'2018-08-02',50.00,'2018-08-01',1,50.00,NULL,NULL,NULL,'n','p','176','3'),(8,'2018-08-01',26,1,NULL,'2018-09-02',50.00,'2018-09-01',1,50.00,NULL,NULL,NULL,'n','p','176','2'),(11,'2018-08-01',26,1,NULL,'2018-10-02',50.00,'2018-10-01',1,50.00,NULL,NULL,NULL,'n','p','176','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_contas_areceber` */

LOCK TABLES `tbl_contas_areceber` WRITE;

insert  into `tbl_contas_areceber`(`id_contas_areceber`,`dt_cadastro`,`id_conta_gerencial`,`id_fornecedor`,`id_documento`,`dt_venc`,`valor_areceber`,`dt_recebido`,`id_conta_corrente`,`valor_recebido`,`valor_desconto`,`valor_juros`,`obs`,`conta_fixa`,`situacao`,`tipo_recebimento`,`nr_vezes`) values (1,'2018-08-03',47,1,NULL,'2018-08-04',30.00,'2018-08-04',1,10.00,0.00,0.00,'pagar xyz','n','r','176',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_endereco` */

LOCK TABLES `tbl_endereco` WRITE;

insert  into `tbl_endereco`(`id_endereco`,`endereco`,`numero`,`bairro`,`complemento`,`cep`,`principal`,`id_cliente`,`id_cidade`) values (7,'Av. Plínio Castro Prado','431','jd paulista','431','14061190','n',28,1),(8,'Rua Álvares Cabral, 1351, Ap 51','431','Centro',NULL,'14010080','s',28,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_estoque` */

LOCK TABLES `tbl_estoque` WRITE;

insert  into `tbl_estoque`(`id_estoque`,`id_loja`,`id_produto`,`qtde_total`,`qtde_minima`) values (4,1,14,10,NULL),(5,1,16,-30,NULL),(6,1,18,-20,NULL),(7,1,15,-10,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_ficha_kardex` */

LOCK TABLES `tbl_ficha_kardex` WRITE;

insert  into `tbl_ficha_kardex`(`id_ficha_kerdex`,`id_loja`,`id_produto`,`tipo_movimentacao`,`origem_movimentacao`,`data_movimentacao`,`qtde_movimentacao`) values (26,1,14,'s','ps','2018-07-17',10),(27,1,14,'c','me','2018-07-17',20),(28,1,14,'c','me','2018-07-17',20),(29,1,14,'c','me','2018-07-17',20),(30,1,14,'s','ps','2018-07-24',10),(31,1,16,'s','ps','2018-07-24',10),(32,1,18,'s','ps','2018-07-24',10),(33,1,14,'s','ps','2018-07-24',10),(34,1,16,'s','ps','2018-07-24',10),(35,1,14,'s','ps','2018-07-24',10),(36,1,14,'s','ps','2018-07-24',10),(37,1,15,'s','ps','2018-07-24',10),(38,1,16,'s','ps','2018-07-24',10),(39,1,18,'s','ps','2018-07-24',10);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_fornecedor` */

LOCK TABLES `tbl_fornecedor` WRITE;

insert  into `tbl_fornecedor`(`id_fornecedor`,`nome`,`apelido`,`telefone`,`celular`,`whatsapp`,`email`,`site`,`observacao`,`tipo_pessoa`,`cpf_cnpj`,`rg`,`inscr_municipal`,`inscr_estadual`,`tipo_ie`,`cep`,`endereco`,`numero`,`bairro`,`complemento`,`banco`,`agencia`,`digito_ag`,`conta_corrente`,`digito_cc`) values (1,'MATHEUS DE MELLO','salgadeiro',NULL,NULL,'16991838523',NULL,NULL,'teste',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'MATHEUS DE MELLO',NULL,'16991838523',NULL,NULL,'matheus.gnu@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'126','14061190','Av. Plínio Castro Prado 431, Apto 33',NULL,NULL,NULL,'67',NULL,NULL,NULL,NULL);

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

insert  into `tbl_function_controller`(`function_controller_id`,`arquivo_controller_id`,`nome_function`,`funcao`) values (1,1,'__construct','	public $data = array();\r\n\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		if ($this->session->userdata(\'is_loginho\') === null)\r\n			redirect(\'/\');\r\n		$this->data[\'__CLASS__\'] = __CLASS__;\r\n		$this->getStatusPedido(False);\r\n		$this->getMenus();\r\n	}'),(2,1,'getMenus','	public function getMenus(){\r\n		$this->data[\'menus\'] = $this->Generico->getAllMenus();\r\n	}'),(3,1,'getStatusPedido','	public function getStatusPedido($param = True){\r\n		$this->data[\'PedidoAbertoFechado\'] = $this->Pedidos->getQtdAbertoFechado();\r\n		if($param === True)\r\n			print_r(json_encode($this->data[\'PedidoAbertoFechado\']));\r\n	}'),(4,1,'_example_output','	public function _example_output($output = null)\r\n	{\r\n		$output = array_merge($this->data,(array)$output);\r\n		$this->load->view(\'restrito/admin.php\',$output);\r\n	}'),(5,1,'index','	public function index()\r\n	{\r\n		$this->data[\'main_page\'] = \'isset\';\r\n		$this->data[\'estoques\'] = $this->Generico->getEstoque();\r\n		$this->data[\'afazeres\'] = $this->Generico->getAFazer();\r\n		$this->data[\'PedidosSolicitados\'] = $this->Generico->getPedidoSolicitados();\r\n		$this->_example_output((object)array(\'output\' => \'\' , \'js_files\' => array() , \'css_files\' => array()));\r\n	}'),(6,1,'cliente_unique','	public function cliente_unique($id_cliente = \'\')\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/pedidos\").\"\'>Voltar ao Pedido</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cliente\');\r\n		if (!empty($id_cliente)){\r\n			$crud->where(\'tbl_cliente.id_cliente\',$id_cliente);\r\n		}\r\n		$crud->set_subject(\'Cadastro de Cliente\');\r\n		$crud->columns(\'nome\',\'email\',\'endereco\',\'tipo\');\r\n		$crud->fields(\'id_cliente\',\'nome\',\'cpf_cnpj\',\'email\',\'senha\',\'telefone\',\'endereco\',\'numero\',\'bairro\',                     \r\n					  \'complemento\',\'situacao\',\'tipo\',\'ganho_unitario\',\'ativo\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF/CNPJ\');\r\n		$crud->display_as(\'senha\',\'Senha\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'endereco\',\'Endereco\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'ganho_unitario\',\'Ganho %\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'tipo\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'1\' => \'True\', \'0\' => \'False\'));\r\n		 \r\n		$output = $crud->render();\r\n\r\n		$this->_example_output($output);\r\n	}'),(7,1,'clientes','	public function clientes()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cliente\');\r\n		$crud->set_subject(\'Cadastro de Cliente\');\r\n		$crud->columns(\'nome\',\'email\',\'endereco\',\'tipo\');\r\n		$crud->fields(\'id_cliente\',\'nome\',\'cpf_cnpj\',\'email\',\'senha\',\'telefone\',\'endereco\',\'numero\',\'bairro\',                     \r\n					  \'complemento\',\'situacao\',\'tipo\',\'ganho_unitario\',\'ativo\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF/CNPJ\');\r\n		$crud->display_as(\'senha\',\'Senha\');\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'endereco\',\'Endereco\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'ganho_unitario\',\'Ganho %\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'tipo\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'1\' => \'True\', \'0\' => \'False\'));\r\n		 \r\n		$output = $crud->render();\r\n\r\n		$this->_example_output($output);\r\n	}'),(8,1,'cidades','	public function cidades()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_cidade\');\r\n		$crud->set_subject(\'Cadastro de Cidade\');\r\n		$crud->columns(\'nome\',\'uf\',\'link\');\r\n		$crud->fields(\'id_cidade\',\'nome\',\'uf\',\'link\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome da Cidade\');\r\n		$crud->display_as(\'uf\',\'UF\');\r\n		$crud->display_as(\'link\',\'Link\');\r\n\r\n		$crud->field_type(\'uf\',\'dropdown\', array(\'AC\' => \'Acre\', \'AL\' => \'Alagoas\', \'AP\' => \'Amapá\',\r\n												 \'AM\' => \'Amazonas\', \'BA\' => \'Bahia\', \'CE\' => \'Ceará\',\r\n												 \'DF\' => \'Distrito Federal\', \'ES\' => \'Espírito Santo\',\r\n												 \'GO\' => \'Goiás\', \'MA\' => \'Maranhão\', \'MT\' => \'Mato Grosso\',\r\n												 \'MS\' => \'Mato Grosso do Sul\', \'MG\' => \'Minas Gerais\',\r\n												 \'PA\' => \'Pará\', \'PB\' => \'Paraíba\', \'PR\' => \'Paraná\',\r\n												 \'PE\' => \'Pernambuco\', \'PI\' => \'Piauí\', \'RJ\' => \'Rio de Janeiro\',\r\n												 \'RN\' => \'Rio Grande do Norte\', \'RS\' => \'Rio Grande do Sul\',\r\n												 \'RO\' => \'Rondônia\', \'RR\' => \'Roraima\', \'SC\' => \'Santa Catarina\',\r\n												 \'SP\' => \'São Paulo\', \'SE\' => \'Sergipe\', \'TO\' => \'Tocantins\'));\r\n	 \r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(9,1,'fornecedores','	public function fornecedores()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_fornecedor\');\r\n		$crud->set_subject(\'Cadastro de Fornecedor\');\r\n		$crud->columns(\'nome\', \'apelido\', \'whatsapp\', \'email\',\'site\');\r\n		$crud->fields(\'nome\',\'apelido\',\'telefone\',\'celular\',\'whatsapp\',\'email\',\'site\',\'observacao\',\r\n				 	  \'tipo_pessoa\',\'cpf_cnpj\',\'rg\',\'inscr_municipal\',\'inscr_estadual\',\'tipo_ie\',\'cep\',\r\n					  \'endereco\',\'numero\',\'bairro\',\'complemento\',\'banco\',\'agencia\',\'digito_ag\',\'conta_corrente\',\'digito_cc\');\r\n		\r\n		$crud->display_as(\'id_fornecedor\',\'Id Fornecedor\');\r\n		$crud->display_as(\'nome\',\'Nome\');\r\n		$crud->display_as(\'apelido\',\'Apelido/ Razão Social\'); \r\n		$crud->display_as(\'whatsapp\',\'Whatsapp\');\r\n		$crud->display_as(\'celular\',\'Celular\');	\r\n		$crud->display_as(\'telefone\',\'Telefone\');\r\n		$crud->display_as(\'email\',\'E-mail\');\r\n		$crud->display_as(\'site\',\'Site\');\r\n		$crud->display_as(\'tipo_pessoa\',\'Fisíca/Juridica\');\r\n		$crud->display_as(\'cpf_cnpj\',\'CPF / CNPJ\');\r\n		$crud->display_as(\'rg\',\'RG\');\r\n		$crud->display_as(\'inscr_municipal\',\'Inscrição Municipal\');\r\n		$crud->display_as(\'inscr_estadual\',\'Inscrição Estadual\');\r\n		$crud->display_as(\'tipo_ie\',\'Indicador IE\');\r\n		$crud->display_as(\'cep\',\'CEP\');\r\n		$crud->display_as(\'endereco\',\'Endereço\');\r\n		$crud->display_as(\'numero\',\'Nr.\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'complemento\',\'Complemento\');\r\n		$crud->display_as(\'banco\',\'Banco\');\r\n		$crud->display_as(\'agencia\',\'Agência\');\r\n		$crud->display_as(\'digito_ag\',\'Digito\');\r\n		$crud->display_as(\'conta_corrente\',\'Conta Corrente\');\r\n		$crud->display_as(\'digito_cc\',\'Digito\');\r\n\r\n		$crud->display_as(\'observacao\',\'Descrição\');\r\n\r\n		$crud->set_relation(\'banco\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'banco\'));\r\n		$crud->set_relation(\'tipo_ie\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_ie\'));\r\n\r\n		$crud->unset_texteditor(\'observacao\');\r\n\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(10,1,'tipos','	public function tipos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_tipo\');\r\n		$crud->set_subject(\'Cadastro de Tipo\');\r\n		$crud->columns(\'id_tipo\',\'campo\',\'tipo\',\'descricao\');\r\n		$crud->fields(\'campo\',\'tipo\',\'descricao\');\r\n		\r\n		$crud->display_as(\'campo\',\'Nome do Campo\');\r\n		$crud->display_as(\'tipo\',\'Tipo\');\r\n		$crud->display_as(\'descricao\',\'Descrição\');\r\n	 	\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(11,1,'categorias','	public function categorias()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_categoria_produto\');\r\n		$crud->set_subject(\'Cadastro da Categoria do Produto\');\r\n		$crud->columns(\'nome\',\'situacao\');\r\n		$crud->fields(\'id_categoria_produto\',\'nome\',\'situacao\');\r\n		\r\n		$crud->display_as(\'Nome\',\'Nome da Categoria\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 	\r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(12,1,'produtos','	public function produtos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_produto\');\r\n		$crud->set_subject(\'Cadastro de Produto\');\r\n		$crud->columns(\'nome\',\'situacao\');\r\n		$crud->fields(\'id_produto\',\'nome\',\'situacao\',\'imagem\');\r\n		\r\n		$crud->display_as(\'nome\',\'Nome do Produto\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n	 	\r\n	 	$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Ativo\', \'d\' => \'Desativado\'));\r\n	 	\r\n	 	$crud->add_action(\'Valores\', \'\', __CLASS__.\'/valores\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(13,1,'valores','	public function valores($id_produto)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/produtos\").\"\'>Voltar ao Produto</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_valor_produto\');\r\n		$crud->where(\'tbl_valor_produto.id_produto\', $id_produto);\r\n		$crud->set_subject(\'Cadastro de Valor do Produto\');\r\n		$crud->columns(\'id_produto\',\'id_categoria_produto\', \'data_atualizacao\',\'preco\', \'tipo_cliente\');\r\n		$crud->fields(\'id_valor_produto\',\'id_produto\',\'id_categoria_produto\', \'data_atualizacao\',\'preco\', \'tipo_cliente\');\r\n		\r\n		$crud->display_as(\'id_produto\',\'Nome do Produto\');\r\n		$crud->display_as(\'id_categoria_produto\',\'Categoria\');\r\n		$crud->display_as(\'data_atualizacao\',\'Data Atualização\');\r\n		$crud->display_as(\'preco\',\'Preço\');\r\n\r\n	 	$crud->set_relation(\'id_produto\',\'tbl_produto\',\'nome\');\r\n	 	$crud->set_relation(\'id_categoria_produto\',\'tbl_categoria_produto\',\'nome\', array(\'situacao\' => \'a\'));\r\n\r\n	 	$crud->field_type(\'tipo_cliente\',\'dropdown\', array(\'c\' => \'Cliente\', \'r\' => \'Revendedor\', \'s\' => \'Representante\', \'p\' => \'Parceiro\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(14,1,'pedidos','	public function pedidos()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_pedido\');\r\n		$crud->where(\'tbl_pedido.situacao <>\', \'e\');\r\n		$crud->order_by(\"data_entrega\", \"desc\");\r\n		$crud->set_subject(\'Cadastro de Valor do Produto\');\r\n		$crud->columns(\'id_cliente\',\'data_pedido\',\'data_entrega\',\'situacao\');\r\n		$crud->fields(\'id_pedido\',\'id_cliente\',\'id_cidade\',\'data_pedido\',\'valor\',\'valor_total\',\'situacao\',\'forma_pgto\',\'forma_entrega\',\r\n					  \'taxa_entrega\',\'data_entrega\',\'hora_entrega\',\'end_entrega\',\'num_entrega\',\'bairro_entrega\',\'comp_entrega\',\'data_pagamento\');\r\n		\r\n		$crud->display_as(\'id_cliente\',\'Nome do Cliente\');\r\n		$crud->display_as(\'id_cidade\',\'Cidade\');\r\n		$crud->display_as(\'data_pedido\',\'Data do Pedido\');\r\n		$crud->display_as(\'valor\',\'Valor\');\r\n		$crud->display_as(\'valor_total\',\'Valor Total\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n		$crud->display_as(\'forma_pgto\',\'Forma Pgto\');\r\n		$crud->display_as(\'forma_entrega\',\'Forma Entrega\');\r\n		$crud->display_as(\'taxa_entrega\',\'Taxa de Entrega\');\r\n		$crud->display_as(\'data_entrega\',\'Data da Entrega\');\r\n		$crud->display_as(\'hora_entrega\',\'Hora de Entrega\');\r\n		$crud->display_as(\'end_entrega\',\'Novo Endereço\');\r\n		$crud->display_as(\'num_entrega\',\'N°\');\r\n		$crud->display_as(\'bairro_entrega\',\'Bairro\');\r\n		$crud->display_as(\'comp_entrega\',\'Complemento\');\r\n		$crud->display_as(\'data_pagamento\',\'Data Pagamento\');\r\n\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'s\' => \'Solicitação\', \'v\' => \'Visualizado\', \'p\' => \'Produzindo\', \'t\' => \'Saiu p/ entregar\', \'e\' => \'Entregue\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'forma_pgto\',\'dropdown\', array(\'d\' => \'Dinheiro\', \'cd\' => \'Cartão Débito\', \'cc\' => \'Cartão Crédito\'));\r\n		$crud->field_type(\'forma_entrega\',\'dropdown\', array(\'r\' => \'Retirar\', \'e\' => \'Entregar\'));\r\n\r\n	 	$crud->set_relation(\'id_cliente\',\'tbl_cliente\',\'nome\');\r\n	 	$crud->set_relation(\'id_cidade\',\'tbl_cidade\',\'nome\');\r\n\r\n	 	$crud->add_action(\'Itens do Pedido\', \'\', __CLASS__.\'/itemPedido\', \'ui-icon-plus\');\r\n	 	$crud->add_action(\'Cliente Pedido\', \'\', \'\', \'ui-icon-plus\', array($this,\'ClientePedido\'));\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(15,1,'ClientePedido','	public function ClientePedido($primary_key , $row)\r\n	{\r\n		return site_url(__CLASS__.\"/cliente_unique/$row->id_cliente\");\r\n	}'),(16,1,'itemPedido','	public function itemPedido($id_pedido)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/pedidos\").\"\'>Voltar ao Pedido</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_item_pedido\');\r\n		$crud->where(\'tbl_item_pedido.id_pedido\', $id_pedido);\r\n		$crud->set_subject(\'Item Pedido\');\r\n		$crud->columns(\'id_pedido\',\'id_produto\',\'qtde\');\r\n		$crud->fields(\'id_item_pedido\',\'id_pedido\',\'id_produto\',\'qtde\', \'valor_unitario\');\r\n		\r\n		$crud->display_as(\'id_pedido\',\'Id do Pedido\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'qtde\',\'Qntde\');\r\n\r\n		$crud->set_relation(\'id_produto\',\'tbl_produto\',\'nome\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(17,1,'lojas','	public function lojas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_loja\');\r\n		$crud->set_subject(\'Loja\');\r\n		$crud->columns(\'id_loja\',\'nome_proprietario\',\'razao_social\',\'nome_fantasia\');\r\n		$crud->fields(\'id_loja\',\'nome_proprietario\',\'cpf\',\'razao_social\',\'nome_fantasia\',\'cnpj\',\'nr_inscricao_muni\',\'cnae\',\'data_nascimento\',\'data_abertura\',\'endereco\',\'numero\',\'complemento\',\'bairro\',\'cep\',\'municipio\',\'uf\');\r\n		\r\n		$crud->display_as(\'nome_proprietario\',\'Nome do Proprietário\');\r\n		$crud->display_as(\'cpf\',\'CPF\');\r\n		$crud->display_as(\'razao_social\',\'Razão Social\');\r\n		$crud->display_as(\'nome_fantasia\',\'Nome Fantasia\');\r\n		$crud->display_as(\'cnpj\',\'CNPJ\');\r\n		$crud->display_as(\'nr_inscricao_muni\',\'Insc. Municipal\');\r\n		$crud->display_as(\'cnae\',\'CNAE\');\r\n		$crud->display_as(\'data_nascimento\',\'Data Nascimento\');\r\n		$crud->display_as(\'data_abertura\',\'Data de Abertura\');\r\n		$crud->display_as(\'endereco\',\'Endereço\');\r\n		$crud->display_as(\'numero\',\'N°\');\r\n		$crud->display_as(\'complemento\',\'Compl.\');\r\n		$crud->display_as(\'bairro\',\'Bairro\');\r\n		$crud->display_as(\'cep\',\'CEP\');\r\n		$crud->display_as(\'municipio\',\'Municipio\');\r\n		$crud->display_as(\'uf\',\'UF\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(18,1,'arquivo_controller','	public function arquivo_controller(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_arquivo_controller\');\r\n		$crud->set_subject(\'Arquivo Controller\');\r\n		$crud->columns(\'nome_controller\',\'diretorio\');\r\n		$crud->fields(\'nome_controller\',\'diretorio\');\r\n		\r\n		$crud->display_as(\'arquivo_controller_id\',\'Id Controller\');\r\n		$crud->display_as(\'nome_controller\',\'Nome da Controller\');\r\n		$crud->display_as(\'diretorio\',\'Diretório\');\r\n\r\n		$crud->required_fields(\'nome_controller\');\r\n\r\n	 	$crud->add_action(\'Funções\', \'\', __CLASS__.\'/funcoes\', \'ui-icon-plus\');\r\n	 	$crud->add_action(\'Gerar Controller\', \'\', __CLASS__.\'/gerar_controller\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(19,1,'funcoes','	public function funcoes($arquivo_controller_id){\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/arquivo_controller\").\"\'>Voltar ao Arq. Controller</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_function_controller\');\r\n		$crud->where(\'tbl_function_controller.arquivo_controller_id\', $arquivo_controller_id);\r\n		$crud->set_subject(\'Funções da Controller (\' . $arquivo_controller_id . \')\');\r\n		$crud->columns(\'nome_function\');\r\n		$crud->fields(\'arquivo_controller_id\',\'nome_function\',\'funcao\');\r\n		\r\n		$crud->display_as(\'arquivo_controller_id\',\'Id Controller\');\r\n		$crud->display_as(\'nome_function\',\'Nome da Function\');\r\n		$crud->display_as(\'funcao\',\'Função\');\r\n\r\n		$crud->required_fields(\'nome_function\',\'funcao\');\r\n\r\n		$crud->field_type(\'arquivo_controller_id\', \'hidden\', $arquivo_controller_id);\r\n\r\n		$crud->unset_texteditor(\'funcao\');		\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(20,1,'gerar_controller','	public function gerar_controller($arquivo_controller_id)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/arquivo_controller\").\"\'>Voltar ao Arq. Controller</a>\";\r\n\r\n		$controller = $this->Generico->getArquivoController($arquivo_controller_id);\r\n		$functions = $this->Generico->getFunctionByIdController($arquivo_controller_id);\r\n\r\n		$data = \r\n			\"<?php if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\\nclass $controller->nome_controller extends CI_Controller {\\n\";\r\n		foreach ($functions as $funcao) {\r\n			$data .= $funcao[\'funcao\'].\"\\n\\n\";\r\n		}\r\n		$data .= \'}\';\r\n\r\n		if (is_null($controller->diretorio)){\r\n			$dir_controller = FCPATH.\"/application/controllers/{$controller->nome_controller}.php\";\r\n		} else {\r\n			$dir_controller = FCPATH.\"/application/controllers/{$controller->diretorio}/{$controller->nome_controller}.php\";\r\n		}\r\n\r\n		if (write_file($dir_controller, $data) == FALSE)\r\n		{\r\n			$this->data[\'msg_file_create\'] = \'Unable to write the file\';\r\n		} else {\r\n			$this->data[\'msg_file_create\'] = \'File written!\';                           \r\n		}\r\n\r\n		$this->_example_output((object)array(\'output\' => \'\' , \'js_files\' => array() , \'css_files\' => array()));\r\n	}'),(21,1,'menu','	public function menu()\r\n	{\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_menu\');\r\n		$crud->set_subject(\'Cadastro de Menu\');\r\n		$crud->columns(\'nome_menu\',\'menu_titulo\', \'order\', \'ativo\');\r\n		$crud->fields(\'nome_menu\',\'menu_titulo\',\'tag_i\', \'order\', \'ativo\');\r\n		\r\n		$crud->display_as(\'menu_id\',\'Id Menu\');\r\n		$crud->display_as(\'nome_menu\',\'Nome do Menu\');\r\n		$crud->display_as(\'menu_titulo\',\'Titulo\');\r\n		$crud->display_as(\'tag_i\',\'Tag Img\');\r\n		$crud->display_as(\'order\',\'N° Ordenação\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativado\', \'d\' => \'Desativado\'));\r\n\r\n		$crud->order_by(\'order\',\'asc\');\r\n\r\n		$crud->required_fields(\'nome_menu\');\r\n\r\n	 	$crud->add_action(\'Sub Menu\', \'\', __CLASS__.\'/submenu\', \'ui-icon-plus\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(22,1,'submenu','	public function submenu($menu_id)\r\n	{\r\n		$this->data[\'navigation_back\'] = \"<a href=\'\".base_url(__CLASS__.\"/menu\").\"\'>Voltar ao Menu</a>\";\r\n\r\n		$crud = new grocery_CRUD();\r\n		$crud->set_table(\'tbl_submenu\');\r\n		$crud->where(\'tbl_submenu.menu_id\', $menu_id);\r\n		$crud->set_subject(\'Cadastro do Sub Menu\');\r\n		$crud->columns(\'menu_id\',\'nome_submenu\',\'arquivo_controller_id\', \'function_controller_id\',\'order\', \'ativo\');\r\n		$crud->fields(\'menu_id\',\'nome_submenu\',\'arquivo_controller_id\', \'function_controller_id\',\'order\', \'ativo\');\r\n		\r\n		$crud->display_as(\'submenu_id\',\'Id Sub Menu\');\r\n		$crud->display_as(\'menu_id\',\'Menu\');\r\n		$crud->display_as(\'nome_submenu\',\'Nome Sub Menu\');\r\n		$crud->display_as(\'arquivo_controller_id\',\'Nome Controller\');\r\n		$crud->display_as(\'function_controller_id\',\'Nome Function\');\r\n		$crud->display_as(\'order\',\'N° Ordenação\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		\r\n		$crud->set_relation(\'arquivo_controller_id\', \'tbl_arquivo_controller\', \'nome_controller\');\r\n		$crud->set_relation(\'function_controller_id\', \'tbl_function_controller\', \'nome_function\');\r\n\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativado\', \'d\' => \'Desativado\'));\r\n		$crud->field_type(\'menu_id\', \'hidden\', $menu_id);\r\n\r\n		$crud->required_fields(\'nome_submenu\',\'arquivo_controller_id\',\'function_controller_id\');\r\n\r\n		$this->load->library(\'gc_dependent_select\');\r\n\r\n		$fields = array(\r\n			// first field:\r\n			\'arquivo_controller_id\' => array( // first dropdown name\r\n			\'table_name\' => \'tbl_arquivo_controller\', // table of country\r\n			\'title\' => \'nome_controller\', // country title\r\n			\'relate\' => null // the first dropdown hasn\'t a relation\r\n			),\r\n			// second field\r\n			\'function_controller_id\' => array( // second dropdown name\r\n			\'table_name\' => \'tbl_function_controller\', // table of state\r\n			\'title\' => \'nome_function\', // state title\r\n			\'id_field\' => \'function_controller_id\', // table of state: primary key\r\n			\'relate\' => \'arquivo_controller_id\', // table of state:\r\n			\'data-placeholder\' => \'selecionar function\' //dropdown\'s data-placeholder:\r\n			)\r\n		);\r\n\r\n		$config = array(\r\n			\'main_table\' => \'tbl_submenu\',\r\n			\'main_table_primary\' => \'submenu_id\',\r\n			\"url\" => base_url() . \'index.php/\' . __CLASS__ . \'/\', //	.$id.\'/add\' //path to method\r\n			\'ajax_loader\' => base_url() . \'ajax-loader.gif\', // path to ajax-loader image. It\'s an optional parameter\r\n			\'segment_name\' =>\'get_functionByIdController\' // It\'s an optional parameter. by default \"get_items\"\r\n		);\r\n\r\n		$mult = new gc_dependent_select($crud, $fields, $config);\r\n\r\n		// the second method:\r\n		$js = $mult->get_js();\r\n\r\n		$output = $crud->render();\r\n\r\n		$output->output.= $js;\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(23,1,'get_functionByIdController','	public function get_functionByIdController($id){\r\n		$functions = $this->Generico->getFunctionByIdController($id);\r\n		\r\n		$arr = array();\r\n		foreach ($functions as $item) {\r\n			array_push($arr, array(\'value\' => $item[\'function_controller_id\'], \'property\' => $item[\'nome_function\']));\r\n		}\r\n		\r\n		echo json_encode($arr);\r\n	}'),(24,1,'estoque','	public function estoque(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_estoque\');\r\n		$crud->set_subject(\'Consulta de Estoque\');\r\n		$crud->columns(\'id_loja\',\'id_produto\', \'qtde_minima\', \'qtde_total\');\r\n		$crud->edit_fields(\'qtde_minima\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'qtde_minima\',\'Qtde Estoque Minimo\');\r\n		$crud->display_as(\'qtde_total\',\'Qtde Disponível\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\'));\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->required_fields(\'id_loja\',\'id_produto\', \'movimentacao\', \'qtde_minima\', \'qtde_movimento\');\r\n\r\n		$output = $crud->render();\r\n		 \r\n		$this->_example_output($output);\r\n	}'),(25,1,'movimentacao_estoque','	public function movimentacao_estoque(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_movimentacao_estoque\');\r\n		$crud->set_subject(\'Movimentação de Estoque\');\r\n		$crud->columns(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\', \'id_item_pedido\');\r\n		$crud->fields(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'tipo_movimentacao\',\'Movimentação de\');\r\n		$crud->display_as(\'qtde_movimentacao\',\'Qtde Movimentação\');\r\n		$crud->display_as(\'data_movimentacao\',\'Data Movimentação\');\r\n		$crud->display_as(\'id_item_pedido\',\'Id Item Pedido\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'data_movimentacao\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		\r\n		$crud->required_fields(\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'qtde_movimentacao\');\r\n\r\n		$crud->unset_delete();\r\n		$crud->unset_edit();\r\n\r\n		$crud->callback_after_insert(array($this, \'after_insert_update_mov_estoque\'));\r\n		$crud->callback_after_update(array($this, \'after_insert_update_mov_estoque\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(26,1,'after_insert_update_mov_estoque','	public function after_insert_update_mov_estoque($post_array,$primary_key){\r\n		$this->Generico->geraEstoque($post_array[\'id_loja\'], $post_array[\'id_produto\'], $post_array[\'tipo_movimentacao\'], $post_array[\'qtde_movimentacao\']);\r\n		$this->Generico->geraFichaKardex($post_array[\'id_loja\'], $post_array[\'id_produto\'], $post_array[\'tipo_movimentacao\'], \'me\', $post_array[\'qtde_movimentacao\']);\r\n	}'),(27,1,'ficha_kardex','	public function ficha_kardex(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_ficha_kardex\');\r\n		$crud->set_subject(\'Ficha Kardex\');\r\n		$crud->columns(\'id_ficha_kerdex\', \'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'origem_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		$crud->fields(\'id_ficha_kerdex\',\'id_loja\', \'id_produto\', \'tipo_movimentacao\', \'origem_movimentacao\', \'qtde_movimentacao\', \'data_movimentacao\');\r\n		\r\n		$crud->display_as(\'id_loja\',\'Loja\');\r\n		$crud->display_as(\'id_produto\',\'Produto\');\r\n		$crud->display_as(\'origem_movimentacao\',\'Origem da Movimentação\');\r\n		$crud->display_as(\'tipo_movimentacao\',\'Movimentação de\');\r\n		$crud->display_as(\'qtde_movimentacao\',\'Qtde Movimentação\');\r\n		$crud->display_as(\'data_movimentacao\',\'Data Movimentação\');\r\n\r\n		$crud->set_relation(\'id_loja\', \'tbl_loja\', \'nome_fantasia\');\r\n		$crud->set_relation(\'id_produto\', \'tbl_produto\', \'nome\');\r\n\r\n		$crud->field_type(\'tipo_movimentacao\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\', \'a\' => \'Ajuste\', \'t\' => \'Transferência\', \'c\' => \'Cancelado\'));\r\n		$crud->field_type(\'origem_movimentacao\',\'dropdown\', array(\'me\' => \'Movimentação Estoque\', \'nfs\' => \'Nf Saída\', \'nfe\' => \'Nf Entrada\', \'ps\' => \'Pedido no Site\'));\r\n\r\n		$crud->unset_delete();\r\n		$crud->unset_edit();\r\n		$crud->unset_add();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(28,1,'postMoviEstoque','	public function postMoviEstoque(){\r\n		if($_POST){\r\n			$this->Generico->gerarMovimentacao($_POST[\'id_loja\'], $_POST[\'id_produto\'], $_POST[\'tipo_movimentacao\'], $_POST[\'qtde_movimentacao\']);\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(29,1,'afazer','	public function afazer(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_afazer\');\r\n		$crud->set_subject(\'A Fazer\');\r\n		$crud->columns(\'id_afazer\', \'afazer\', \'dt_inicio\', \'dt_fim\', \'realizado\');\r\n		$crud->fields(\'afazer\', \'dt_inicio\', \'dt_fim\', \'realizado\');\r\n		\r\n		$crud->display_as(\'id_afazer\',\'Id A Fazer\');\r\n		$crud->display_as(\'afazer\',\'A Fazer\');\r\n		$crud->display_as(\'dt_inicio\',\'Data Inicio\');\r\n		$crud->display_as(\'dt_fim\',\'Data Fim\');\r\n		$crud->display_as(\'realizado\',\'Realizado\');\r\n\r\n		$crud->field_type(\'realizado\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n\r\n		$crud->required_fields(\'afazer\', \'dt_inicio\', \'realizado\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(30,1,'postAFazer','	public function postAFazer(){\r\n		if($_POST){\r\n			$this->Generico->AFazerRealizado($_POST[\'id_afazer\'], $_POST[\'realizado\']);\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(31,1,'postPedidoEntregue','	public function postPedidoEntregue(){\r\n		if($_POST){\r\n			$this->Generico->AlterarSituacaoPedido($_POST[\'id_pedido\'], \'e\');\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(32,1,'postCancelarPedido','	public function postCancelarPedido(){\r\n		if($_POST){\r\n			$pedido = $this->Generico->getPedidoSolicitados($_POST[\'id_pedido\']);\r\n			foreach ($pedido[0][\'itens\'] as $items) {\r\n				$this->Generico->gerarMovimentacao($pedido[0][\'id_cidade\'], $items[\'id_produto\'], \'c\', $items[\'qtde\'], $items[\'id_item_pedido\']);\r\n				$this->Generico->AlterarSituacaoPedido($_POST[\'id_pedido\'], \'c\');\r\n			}\r\n			redirect(__CLASS__.\'/index\');\r\n		}\r\n	}'),(33,1,'ContasAPagar','	public function ContasAPagar(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_apagar\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Cadastrar Contas A Pagar\');\r\n		$crud->columns(\'id_contas_apagar\', \'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\');\r\n		$crud->fields(\'id_conta_gerencial\',\'dt_cadastro\', \'id_fornecedor\', \'dt_venc\', \'valor_apagar\', \'conta_fixa\', \'nr_vezes\', \'obs\', \'situacao\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Pagar\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Vezes\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->field_type(\'dt_cadastro\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		$crud->field_type(\'situacao\',\'hidden\', \'a\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'nr_vezes\',\'dropdown\', \r\n			array(\'1\' => \'1x\', \'2\' => \'2x\', \'3\' => \'3x\', \'4\' => \'4x\', \'5\' => \'5x\', \'6\' => \'6x\', \'7\' => \'7x\', \'8\' => \'8x\',\r\n			\'9\' => \'9x\'  , \'10\' => \'10x\', \'11\' => \'11x\', \'12\' => \'12x\', \'13\' => \'13x\', \'14\' => \'14x\', \'15\' => \'15x\', \'16\' => \'16x\',\r\n			\'17\' => \'17x\', \'18\' => \'18x\', \'19\' => \'19x\', \'20\' => \'20x\', \'21\' => \'21x\', \'22\' => \'22x\', \'23\' => \'23x\', \'24\' => \'24x\',\r\n			\'25\' => \'25x\', \'26\' => \'26x\', \'27\' => \'27x\', \'28\' => \'28x\', \'29\' => \'29x\', \'30\' => \'30x\', \'31\' => \'31x\', \'32\' => \'32x\',\r\n			\'33\' => \'33x\', \'34\' => \'34x\', \'35\' => \'35x\', \'36\' => \'36x\'));\r\n\r\n		$crud->required_fields(\'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\', \'conta_fixa\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(34,1,'PagarAConta','	public function PagarAConta(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_apagar\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Pagar A Contas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\');\r\n		$crud->fields(\'id_contas_apagar\', \'tipo_pagamento\', \'dt_venc\', \'dt_pago\', \'id_conta_corrente\', \'valor_apagar\', \r\n			\'valor_pgto\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'nr_vezes\', \'situacao\', \'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Pagar\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Parcela\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_pago\',\'Data Pagamento\'); \r\n		$crud->display_as(\'id_conta_corrente\',\'Conta corrente\');\r\n		$crud->display_as(\'valor_pgto\',\'Valor Pago\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_pagamento\',\'Tipo Pagamento\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_pagamento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$crud->field_type(\'conta_fixa\',\'hidden\');\r\n		$crud->field_type(\'nr_vezes\',\'readonly\');\r\n		$crud->field_type(\'situacao\',\'hidden\', \'p\');\r\n		$crud->field_type(\'id_contas_apagar\',\'hidden\');\r\n		$crud->field_type(\'id_fornecedor\',\'readonly\');\r\n		$crud->field_type(\'id_conta_gerencial\',\'readonly\');\r\n		$crud->field_type(\'dt_venc\',\'readonly\');\r\n		$crud->field_type(\'valor_apagar\',\'readonly\');\r\n\r\n		$crud->required_fields(\'tipo_pagamento\', \'dt_pago\', \'valor_pgto\', \'id_conta_corrente\');\r\n\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->callback_after_update(array($this, \'after_update_contas_apagar\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(35,1,'after_update_contas_apagar','	public function after_update_contas_apagar($post_array,$primary_key){\r\n		if ($post_array[\'conta_fixa\'] == \'s\')\r\n			$this->Generico->geraProximaContaAPagarFixa($primary_key);\r\n		else \r\n			$this->Generico->geraProximaContaAPagarFixa($primary_key, TRUE);		\r\n	}'),(36,1,'ContasPagas','	public function ContasPagas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_apagar\');\r\n		$crud->where(\'situacao\', \'p\');\r\n		$crud->order_by(\'dt_pago\', \'desc\');\r\n		$crud->set_subject(\'Pagar A Contas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_apagar\', \'tipo_pagamento\', \'dt_pago\', \'valor_apagar\');\r\n		$crud->fields(\'id_contas_apagar\', \'tipo_pagamento\', \'dt_venc\', \'dt_pago\', \'id_conta_corrente\', \'valor_apagar\', \r\n			\'valor_pgto\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'nr_vezes\', \'situacao\', \'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Pagar\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Parcela\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_pago\',\'Data Pagamento\');\r\n		$crud->display_as(\'id_conta_corrente\',\'Conta Corrente\');\r\n		$crud->display_as(\'valor_pgto\',\'Valor Pago\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_pagamento\',\'Tipo Pagamento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n\r\n		$crud->field_type(\'nr_vezes\',\'readonly\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Aberto\', \'p\' => \'Pago\'));\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_pagamento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n		\r\n		$crud->unset_add();\r\n		$crud->unset_edit();\r\n		$crud->unset_delete();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(37,1,'conta_gerencial','	public function conta_gerencial(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_conta_gerencial\');\r\n		$crud->set_subject(\'Contas Gerenciais\');\r\n		$crud->columns(\'nome_conta_gerencial\', \'tipo_conta\', \'id_conta_dre\');\r\n		$crud->fields(\'nome_conta_gerencial\', \'tipo_conta\', \'id_conta_dre\',\r\n					  \'cc_debito\', \'cc_credito\', \'permite_compras\', \'ativo\');\r\n		\r\n		$crud->display_as(\'id_contas_apagar\',\'Id Conta Gerencial\');\r\n		$crud->display_as(\'nome_conta_gerencial\',\'Nome\');\r\n		$crud->display_as(\'tipo_conta\',\'Tipo\');\r\n		$crud->display_as(\'id_conta_dre\',\'Conta DRE\');\r\n		$crud->display_as(\'cc_debito\',\'Conta Débito\');\r\n		$crud->display_as(\'cc_credito\',\'Conta Crédito\');\r\n		$crud->display_as(\'permite_compras\',\'Permite Compra\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->required_fields(\'nome_conta_gerencial\', \'tipo_conta\', \'permite_compras\', \'ativo\');\r\n\r\n		$crud->field_type(\'tipo_conta\',\'dropdown\', array(\'e\' => \'Entrada\', \'s\' => \'Saída\'));\r\n		$crud->field_type(\'permite_compras\',\'dropdown\', array(\'S\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativo\', \'n\' => \'Desativado\'));\r\n\r\n		$crud->set_relation(\'id_conta_dre\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'id_conta_dre\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(38,1,'conta_corrente','	public function conta_corrente(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_conta_corrente\');\r\n		$crud->set_subject(\'Contas Corrente\');\r\n		$crud->columns(\'nome_conta_corrente\', \'interna\', \'banco\', \'principal\');\r\n		$crud->fields(\'nome_conta_corrente\', \'interna\', \'banco\', \'agencia\', \'digito_ag\', \r\n			\'conta_corrente\', \'digito_cc\', \'principal\', \'ativo\');\r\n		\r\n		$crud->display_as(\'id_conta_corrente\',\'Id Conta Corrente\');\r\n		$crud->display_as(\'nome_conta_corrente\',\'Nome\');\r\n		$crud->display_as(\'interna\',\'Interna\');\r\n		$crud->display_as(\'banco\',\'Banco\');\r\n		$crud->display_as(\'agencia\',\'Nr. Agência\');\r\n		$crud->display_as(\'digito_ag\',\'Digito Ag\');\r\n		$crud->display_as(\'conta_corrente\',\'Nr. Conta Corrente\');\r\n		$crud->display_as(\'digito_cc\',\'Digíto Cc\');\r\n		$crud->display_as(\'principal\',\'Principal\');\r\n		$crud->display_as(\'ativo\',\'Ativo\');\r\n\r\n		$crud->required_fields(\'nome_conta_corrente\', \'interna\');\r\n\r\n		$crud->field_type(\'interna\',\'dropdown\', array(\'S\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'ativo\',\'dropdown\', array(\'a\' => \'Ativo\', \'n\' => \'Desativado\'));\r\n		$crud->field_type(\'principal\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		\r\n		$crud->set_relation(\'banco\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'banco\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(39,1,'ContasAReceber','	public function ContasAReceber(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_areceber\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Cadastrar Contas A Receber\');\r\n		$crud->columns(\'id_contas_areceber\', \'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\');\r\n		$crud->fields(\'id_conta_gerencial\',\'dt_cadastro\', \'id_fornecedor\', \'dt_venc\', \'valor_areceber\', \'conta_fixa\', \'nr_vezes\', \'obs\', \'situacao\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_areceber\',\'Valor A Receber\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Vezes\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->field_type(\'dt_cadastro\',\'hidden\', date(\"Y-m-d H:i:s\"));\r\n		$crud->field_type(\'situacao\',\'hidden\', \'a\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'nr_vezes\',\'dropdown\', \r\n			array(\'1\' => \'1x\', \'2\' => \'2x\', \'3\' => \'3x\', \'4\' => \'4x\', \'5\' => \'5x\', \'6\' => \'6x\', \'7\' => \'7x\', \'8\' => \'8x\',\r\n			\'9\' => \'9x\'  , \'10\' => \'10x\', \'11\' => \'11x\', \'12\' => \'12x\', \'13\' => \'13x\', \'14\' => \'14x\', \'15\' => \'15x\', \'16\' => \'16x\',\r\n			\'17\' => \'17x\', \'18\' => \'18x\', \'19\' => \'19x\', \'20\' => \'20x\', \'21\' => \'21x\', \'22\' => \'22x\', \'23\' => \'23x\', \'24\' => \'24x\',\r\n			\'25\' => \'25x\', \'26\' => \'26x\', \'27\' => \'27x\', \'28\' => \'28x\', \'29\' => \'29x\', \'30\' => \'30x\', \'31\' => \'31x\', \'32\' => \'32x\',\r\n			\'33\' => \'33x\', \'34\' => \'34x\', \'35\' => \'35x\', \'36\' => \'36x\'));\r\n\r\n		$crud->required_fields(\'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\', \'conta_fixa\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(40,1,'ReceberAConta','	public function ReceberAConta(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_areceber\');\r\n		$crud->where(\'situacao\', \'a\');\r\n		$crud->set_subject(\'Receber A Contas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\');\r\n		$crud->fields(\'id_contas_areceber\', \'tipo_recebimento\', \'dt_venc\', \'dt_recebido\', \'id_conta_corrente\', \r\n			\'valor_areceber\', \'valor_recebido\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'nr_vezes\', \'situacao\', \r\n			\'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_areceber\',\'Valor A Receber\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Parcela\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_recebido\',\'Data Recebimento\'); \r\n		$crud->display_as(\'id_conta_corrente\',\'Conta corrente\');\r\n		$crud->display_as(\'valor_recebido\',\'Valor Recebido\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_recebimento\',\'Tipo Recebimento\');\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_recebimento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n\r\n		$crud->field_type(\'conta_fixa\',\'hidden\');\r\n		$crud->field_type(\'nr_vezes\',\'readonly\');\r\n		$crud->field_type(\'situacao\',\'hidden\', \'r\');\r\n		$crud->field_type(\'id_contas_areceber\',\'hidden\');\r\n		$crud->field_type(\'id_fornecedor\',\'readonly\');\r\n		$crud->field_type(\'id_conta_gerencial\',\'readonly\');\r\n		$crud->field_type(\'dt_venc\',\'readonly\');\r\n		$crud->field_type(\'valor_areceber\',\'readonly\');\r\n\r\n		$crud->required_fields(\'tipo_recebimento\', \'dt_recebido\', \'valor_recebido\', \'id_conta_corrente\');\r\n\r\n\r\n		$crud->unset_add();\r\n		$crud->unset_delete();\r\n\r\n		$crud->callback_after_update(array($this, \'after_update_contas_areceber\'));\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}'),(41,1,'after_update_contas_areceber','	public function after_update_contas_areceber($post_array,$primary_key){\r\n		if ($post_array[\'conta_fixa\'] == \'s\')\r\n			$this->Generico->geraProximaContaAReceberFixa($primary_key);\r\n		else \r\n			$this->Generico->geraProximaContaAReceberFixa($primary_key, TRUE);\r\n	}'),(42,1,'ContasRecebidas','	public function ContasRecebidas(){\r\n		$crud = new grocery_CRUD();\r\n \r\n		$crud->set_table(\'tbl_contas_areceber\');\r\n		$crud->where(\'situacao\', \'r\');\r\n		$crud->order_by(\'dt_recebido\', \'desc\');\r\n		$crud->set_subject(\'Contas Recebidas\');\r\n		$crud->columns(\'id_fornecedor\', \'id_conta_gerencial\', \'dt_venc\', \'valor_areceber\', \'tipo_recebimento\', \'dt_recebido\', \'valor_recebido\');\r\n		$crud->fields(\'id_contas_apagar\', \'tipo_recebimento\', \'dt_venc\', \'dt_recebido\', \'id_conta_corrente\', \'valor_apagar\', \r\n			\'valor_pgto\', \'valor_desconto\', \'valor_juros\', \'conta_fixa\', \'nr_vezes\', \'situacao\', \'id_fornecedor\', \'id_conta_gerencial\');\r\n		\r\n		$crud->display_as(\'id_conta_gerencial\',\'Conta Gerencial\');\r\n		$crud->display_as(\'id_fornecedor\',\'Fornecedor\');\r\n		$crud->display_as(\'dt_venc\',\'Data Vencimento\');\r\n		$crud->display_as(\'valor_apagar\',\'Valor A Receber\');\r\n		$crud->display_as(\'conta_fixa\',\'Conta Fixa\');\r\n		$crud->display_as(\'nr_vezes\',\'Nr. Parcela\');\r\n		$crud->display_as(\'obs\',\'Observação\');\r\n\r\n		$crud->display_as(\'dt_recebido\',\'Data Recebimento\');\r\n		$crud->display_as(\'id_conta_corrente\',\'Conta Corrente\');\r\n		$crud->display_as(\'valor_pgto\',\'Valor Pago\');\r\n		$crud->display_as(\'valor_desconto\',\'Valor Desconto\');\r\n		$crud->display_as(\'valor_juros\',\'Valor Juros\');\r\n		$crud->display_as(\'tipo_recebimento\',\'Tipo Recebimento\');\r\n		$crud->display_as(\'situacao\',\'Situação\');\r\n\r\n		$crud->field_type(\'nr_vezes\',\'readonly\');\r\n		$crud->field_type(\'conta_fixa\',\'dropdown\', array(\'s\' => \'Sim\', \'n\' => \'Não\'));\r\n		$crud->field_type(\'situacao\',\'dropdown\', array(\'a\' => \'Aberto\', \'r\' => \'Recebido\'));\r\n\r\n		$crud->set_relation(\'id_conta_gerencial\',\'tbl_conta_gerencial\',\'nome_conta_gerencial\');\r\n		$crud->set_relation(\'id_conta_corrente\',\'tbl_conta_corrente\',\'nome_conta_corrente\');\r\n		$crud->set_relation(\'tipo_recebimento\',\'tbl_tipo\',\'descricao\', array(\'campo\' => \'tipo_pagamento\'));\r\n		$crud->set_relation(\'id_fornecedor\',\'tbl_fornecedor\',\'apelido\');\r\n		\r\n		$crud->unset_add();\r\n		$crud->unset_edit();\r\n		$crud->unset_delete();\r\n\r\n		$output = $crud->render();\r\n \r\n		$this->_example_output($output);\r\n	}');

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_item_pedido` */

LOCK TABLES `tbl_item_pedido` WRITE;

insert  into `tbl_item_pedido`(`id_item_pedido`,`id_pedido`,`id_produto`,`id_categoria_produto`,`qtde`,`valor_unitario`) values (66,75,39,0,10,0.45),(67,75,14,0,40,0.40),(68,76,14,0,10,0.45),(69,77,14,0,10,0.45),(70,78,14,0,10,0.45),(71,79,14,0,10,0.45),(72,80,14,0,20,0.45),(73,81,14,0,50,0.45),(74,82,14,0,20,0.45),(75,83,14,0,10,0.45),(76,83,14,0,10,0.40),(77,84,14,3,10,0.45),(78,84,15,3,10,0.45),(79,84,14,4,10,0.40),(80,85,14,3,10,0.45),(81,86,14,3,10,0.45),(82,87,16,3,10,0.45),(83,87,18,3,10,0.45),(84,88,14,3,10,0.45),(85,88,16,3,10,0.45),(86,89,14,3,10,0.45),(87,90,14,3,10,0.45),(88,90,15,3,10,0.45),(89,90,16,3,10,0.45),(90,90,18,3,10,0.45);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_menu` */

LOCK TABLES `tbl_menu` WRITE;

insert  into `tbl_menu`(`menu_id`,`nome_menu`,`menu_titulo`,`tag_i`,`order`,`ativo`) values (1,'Painel de Controle','Principal','ti-panel',1.000,'a'),(2,'Configurações','Configurações','ti-settings',2.000,'a'),(3,'Manutenção','Cadastro Básico','ti-view-list-alt',3.000,'a'),(4,'Estoque','Movimentação','ti-layers-alt',4.000,'a'),(5,'Produtos',NULL,'ti-files',3.100,'a'),(6,'Pedidos',NULL,'ti-book',4.100,'a'),(7,'A Fazer','Meta','ti-bookmark',6.000,'a'),(8,'Pagamento','Financeiro','ti-receipt',5.000,'a'),(10,'Cadastro de Conta',NULL,'ti-archive',5.200,'a'),(11,'Recebimento',NULL,'ti-pencil-alt',5.100,'a');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_movimentacao_estoque` */

LOCK TABLES `tbl_movimentacao_estoque` WRITE;

insert  into `tbl_movimentacao_estoque`(`id_movimentacao_estoque`,`id_loja`,`id_produto`,`tipo_movimentacao`,`qtde_movimentacao`,`data_movimentacao`,`id_item_pedido`) values (27,1,14,'s',10,'2018-07-17 15:47:27',80),(28,1,14,'c',20,'2018-07-17 22:13:17',74),(29,1,14,'c',20,'2018-07-17 22:16:27',74),(30,1,14,'c',20,'2018-07-17 22:17:19',74),(31,1,14,'s',10,'2018-07-24 14:36:28',81),(32,1,16,'s',10,'2018-07-24 14:42:28',82),(33,1,18,'s',10,'2018-07-24 14:42:28',83),(34,1,14,'s',10,'2018-07-24 14:47:40',84),(35,1,16,'s',10,'2018-07-24 14:47:41',85),(36,1,14,'s',10,'2018-07-24 16:30:20',86),(37,1,14,'s',10,'2018-07-24 17:03:23',87),(38,1,15,'s',10,'2018-07-24 17:03:23',88),(39,1,16,'s',10,'2018-07-24 17:03:24',89),(40,1,18,'s',10,'2018-07-24 17:03:24',90);

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Pedido do Salgado';

/*Data for the table `tbl_pedido` */

LOCK TABLES `tbl_pedido` WRITE;

insert  into `tbl_pedido`(`id_pedido`,`id_cliente`,`id_cidade`,`situacao`,`data_pedido`,`valor`,`valor_total`,`forma_pgto`,`forma_entrega`,`taxa_entrega`,`data_entrega`,`hora_entrega`,`end_entrega`,`cidade_entrega`,`num_entrega`,`bairro_entrega`,`comp_entrega`,`data_pagamento`) values (15,10,1,'e','2017-11-04 00:00:00',22.50,25.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,11,1,'e','2017-11-09 00:00:00',31.50,34.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,12,1,'e','2017-11-09 00:00:00',24.00,27.00,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,13,1,'e','2017-11-29 15:57:57',40.00,43.00,'d','',3.00,'2017-12-01','13:30h',NULL,NULL,NULL,NULL,NULL,NULL),(26,11,1,'e','2018-01-11 08:28:24',45.00,48.00,'d','',3.00,'2018-01-13','19:30h',NULL,NULL,NULL,NULL,NULL,NULL),(27,14,1,'e','2018-06-04 11:29:29',13.50,16.50,'cd','',3.00,'2018-06-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,15,2,'e','2018-06-07 21:20:21',45.00,48.00,'cd','',3.00,'2018-06-09','13:30h',NULL,NULL,NULL,NULL,NULL,NULL),(74,22,1,'e','2018-07-13 19:30:17',9.00,9.00,'d','r',7.00,'2018-07-14','11:00',NULL,NULL,NULL,NULL,NULL,NULL),(75,22,1,'e','2018-07-14 09:51:17',20.50,20.50,'d','r',7.00,'2018-07-14','14:00',NULL,NULL,NULL,NULL,NULL,NULL),(76,22,1,'e','2018-07-16 12:55:53',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL,NULL),(77,22,1,'e','2018-07-16 12:55:53',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL,NULL),(78,22,1,'e','2018-07-16 13:19:42',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL,NULL),(79,22,1,'e','2018-07-16 13:21:48',4.50,4.50,'d','r',7.00,'2018-07-16','16:00',NULL,NULL,NULL,NULL,NULL,NULL),(80,22,1,'e','2018-07-16 16:20:44',9.00,9.00,'d','r',7.00,'2018-07-17','11:00',NULL,NULL,NULL,NULL,NULL,NULL),(81,22,1,'e','2018-07-16 17:15:54',22.50,22.50,'d','r',7.00,'2018-07-17','11:00',NULL,NULL,NULL,NULL,NULL,NULL),(82,22,1,'c','2018-07-16 17:16:50',9.00,9.00,'d','r',7.00,'2018-07-17','11:00',NULL,NULL,NULL,NULL,NULL,NULL),(83,22,1,'s','2018-07-17 12:51:05',8.50,15.50,'d','e',7.00,'2018-07-17','16:00',NULL,NULL,NULL,NULL,NULL,NULL),(84,22,1,'s','2018-07-17 13:10:08',13.00,13.00,'cd','r',7.00,'2018-07-18','12:00',NULL,NULL,NULL,NULL,NULL,NULL),(85,22,1,'s','2018-07-17 15:47:18',4.50,4.50,'d','r',7.00,'2018-07-18','11:00',NULL,NULL,NULL,NULL,NULL,NULL),(86,22,1,'s','2018-07-24 14:35:20',4.50,4.50,'d','r',7.00,'2018-07-25','14:00','Rua Álvares Cabral, 1351, Ap 51',NULL,'532','jardim paulista',NULL,NULL),(87,22,1,'s','2018-07-24 14:42:10',9.00,16.00,'cc','e',7.00,'2018-07-25','12:00','Av. Plínio Castro Prado ',NULL,'431','jardim paulista','apt 33',NULL),(88,28,1,'s','2018-07-24 14:47:32',9.00,9.00,'d','r',7.00,'2018-07-25','16:00','Av. Plínio Castro Prado 431, Apto 33',NULL,'532','Centro','apto 51',NULL),(89,28,1,'s','2018-07-24 16:30:12',4.50,4.50,'cc','r',7.00,'2018-07-25','15:00','Av. Plínio Castro Prado','Ribeirão Preto','431','jd paulista','431',NULL),(90,28,1,'s','2018-07-24 17:03:04',18.00,25.00,'cd','e',7.00,'2018-07-25','12:00','Rua Álvares Cabral, 1351, Ap 51','Ribeirão Preto','431','Centro',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_submenu` */

LOCK TABLES `tbl_submenu` WRITE;

insert  into `tbl_submenu`(`submenu_id`,`menu_id`,`nome_submenu`,`arquivo_controller_id`,`function_controller_id`,`order`,`ativo`) values (1,1,'Inicio',1,5,1,'a'),(2,2,'Cadastrar Tipo',1,10,1,'a'),(3,2,'Cadastrar Menus',1,21,2,'a'),(4,2,'Cadastrar Arquivo Controller',1,18,3,'a'),(5,3,'Cadastrar Clientes',1,7,1,'a'),(6,3,'Cadastrar Cidades',1,8,2,'a'),(7,3,'Cadastrar Fornecedores',1,9,3,'a'),(9,3,'Cadastrar Lojas',1,17,4,'a'),(10,5,'Cadastrar Categorias',1,11,1,'a'),(11,5,'Cadastrar Produtos',1,12,2,'a'),(12,4,'Movimentação de Estoque',1,25,1,'a'),(13,4,'Consulta de Estoque',1,24,2,'a'),(14,6,'Pedidos Solicitados',1,14,1,'a'),(15,4,'Ficha Kardex',1,27,3,'a'),(16,7,'A Fazer',1,29,1,'a'),(17,8,'Cadastrar Conta a Pagar',1,33,1,'a'),(18,8,'Pagar A Conta',1,34,2,'a'),(19,8,'Contas Pagas',1,36,3,'a'),(20,10,'Conta Corrente',1,38,1,'a'),(21,10,'Conta Gerencial',1,37,2,'a'),(22,11,'Cadastrar Conta a Receber',1,39,1,'a'),(23,11,'Receber A Conta',1,40,2,'a'),(24,11,'Contas Recebidas',1,42,3,NULL);

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

insert  into `tbl_tipo`(`campo`,`tipo`,`descricao`,`id_tipo`) values ('forma_pgto','d','Dinheiro',1),('forma_pgto','cd','Cartão de Débito',2),('forma_pgto','cc','Cartão de Crédito',3),('hora_entrega','11:00','11:00h',4),('hora_entrega','12:00','12:00h',5),('hora_entrega','13:00','13:00h',6),('hora_entrega','14:00','14:00h',7),('hora_entrega','15:00','15:00h',8),('hora_entrega','16:00','16:00h',9),('hora_entrega','17:00','17:00h',10),('hora_entrega','18:00','18:00h',11),('hora_entrega','19:00','19:00h',12),('banco','001','001 - Banco do Brasil S.A.',13),('banco','003','003 - Banco da Amazônia S.A.',14),('banco','004','004 - Banco do Nordeste do Brasil S.A.',15),('banco','012','012 - Banco Standard de Investimentos S.A.',16),('banco','021','021 - BANESTES S.A. Banco do Estado do Espírito Santo',17),('banco','024','024 - Banco de Pernambuco S.A. - BANDEPE',18),('banco','025','025 - Banco Alfa S.A.',19),('banco','029','029 - Banco Banerj S.A.',20),('banco','031','031 - Banco Beg S.A.',21),('banco','033','033 - Banco Santander (Brasil) S.A.',22),('banco','036','036 - Banco Bradesco BBI S.A.',23),('banco','037','037 - Banco do Estado do Pará S.A.',24),('banco','040','040 - Banco Cargill S.A.',25),('banco','041','041 - Banco do Estado do Rio Grande do Sul S.A.',26),('banco','044','044 - Banco BVA S.A.',27),('banco','045','045 - Banco Opportunity S.A.',28),('banco','047','047 - Banco do Estado de Sergipe S.A.',29),('banco','062','062 - Hipercard Banco Múltiplo S.A.',30),('banco','063','063 - Banco Ibi S.A. Banco Múltiplo',31),('banco','064','064 - Goldman Sachs do Brasil Banco Múltiplo S.A.',32),('banco','069','069 - BPN Brasil Banco Múltiplo S.A.',33),('banco','070','070 - BRB - Banco de Brasília S.A.',34),('banco','072','072 - Banco Rural Mais S.A.',35),('banco','073','073 - BB Banco Popular do Brasil S.A.',36),('banco','074','074 - Banco J. Safra S.A.',37),('banco','077','077 - Banco Intermedium S.A.',38),('banco','078','078 - BES Investimento do Brasil S.A.-Banco de Investimento',39),('banco','079','079 - Banco Original do Agronegócio S.A.',40),('banco','085','085 - Cooperativa Central de Crédito Urbano - Cecred',41),('banco','096','096 - Banco BM&amp;F de Serviços de Liquidação e Custódia S.A',42),('banco','099','099 - Uniprime Cooperativa de Crédito',43),('banco','102','102 - XP Investimentos Corretora de Câmbio Títulos e Valores Mobiliários S.A',44),('banco','104','104 - Caixa Econômica Federal',45),('banco','107','107 - Banco BBM S.A.',46),('banco','119','119 - Banco Western Union do Brasil S.A.',47),('banco','121','121 - Banco Agiplan S.A.',48),('banco','184','184 - Banco Itaú BBA S.A.',49),('banco','204','204 - Banco Bradesco Cartões S.A.',50),('banco','208','208 - Banco BTG Pactual S.A.',51),('banco','212','212 - Banco Original S.A.',52),('banco','214','214 - Banco Dibens S.A.',53),('banco','215','215 - Banco Comercial e de Investimento Sudameris S.A.',54),('banco','217','217 - Banco John Deere S.A.',55),('banco','218','218 - Banco Bonsucesso S.A.',56),('banco','222','222 - Banco Credit Agricole Brasil S.A.',57),('banco','224','224 - Banco Fibra S.A.',58),('banco','225','225 - Banco Brascan S.A.',59),('banco','229','229 - Banco Cruzeiro do Sul S.A.',60),('banco','230','230 - Unicard Banco Múltiplo S.A.',61),('banco','233','233 - Banco Cifra S.A.',62),('banco','237','237 - Banco Bradesco S.A.',63),('banco','246','246 - Banco ABC Brasil S.A.',64),('banco','248','248 - Banco Boavista Interatlântico S.A.',65),('banco','249','249 - Banco Investcred Unibanco S.A.',66),('banco','250','250 - BCV - Banco de Crédito e Varejo S.A.',67),('banco','260','260 - Nu Pagamentos S.A Nubank',68),('banco','263','263 - Banco Cacique S.A.',69),('banco','265','265 - Banco Fator S.A.',70),('banco','318','318 - Banco BMG S.A.',71),('banco','320','320 - Banco Industrial e Comercial S.A.',72),('banco','341','341 - Itaú Unibanco S.A.',73),('banco','356','356 - Banco Real S.A.',74),('banco','366','366 - Banco Société Générale Brasil S.A.',75),('banco','370','370 - Banco WestLB do Brasil S.A.',76),('banco','376','376 - Banco J. P. Morgan S.A.',77),('banco','389','389 - Banco Mercantil do Brasil S.A.',78),('banco','394','394 - Banco Bradesco Financiamentos S.A.',79),('banco','394','394 - Banco Finasa BMC S.A.',80),('banco','399','399 - HSBC Bank Brasil S.A. - Banco Múltiplo',81),('banco','409','409 - UNIBANCO - União de Bancos Brasileiros S.A.',82),('banco','422','422 - Banco Safra S.A.',83),('banco','453','453 - Banco Rural S.A.',84),('banco','456','456 - Banco de Tokyo-Mitsubishi UFJ Brasil S.A.',85),('banco','464','464 - Banco Sumitomo Mitsui Brasileiro S.A.',86),('banco','473','473 - Banco Caixa Geral - Brasil S.A.',87),('banco','477','477 - Citibank S.A.',88),('banco','479','479 - Banco ItaúBank S.A',89),('banco','487','487 - Deutsche Bank S.A. - Banco Alemão',90),('banco','488','488 - JPMorgan Chase Bank',91),('banco','492','492 - ING Bank N.V.',92),('banco','505','505 - Banco Credit Suisse (Brasil) S.A.',93),('banco','600','600 - Banco Luso Brasileiro S.A.',94),('banco','604','604 - Banco Industrial do Brasil S.A.',95),('banco','610','610 - Banco VR S.A.',96),('banco','611','611 - Banco Paulista S.A.',97),('banco','612','612 - Banco Guanabara S.A.',98),('banco','623','623 - Banco Panamericano S.A.',99),('banco','626','626 - Banco Ficsa S.A.',100),('banco','633','633 - Banco Rendimento S.A.',101),('banco','634','634 - Banco Triângulo S.A.',102),('banco','637','637 - Banco Sofisa S.A.',103),('banco','638','638 - Banco Prosper S.A.',104),('banco','641','641 - Banco Alvorada S.A.',105),('banco','643','643 - Banco Pine S.A.',106),('banco','652','652 - Itaú Unibanco Holding S.A.',107),('banco','653','653 - Banco Indusval S.A.',108),('banco','655','655 - Banco Votorantim S.A.',109),('banco','707','707 - Banco Daycoval S.A.',110),('banco','719','719 - Banif-Banco Internacional do Funchal (Brasil)S.A.',111),('banco','735','735 - Banco Neon S.A.',112),('banco','739','739 - Banco BGN S.A.',113),('banco','40','40 - Banco Barclays S.A.',114),('banco','745','745 - Banco Citibank S.A.',115),('banco','746','746 - Banco Modal S.A.',116),('banco','747','747 - Banco Rabobank International Brasil S.A.',117),('banco','748','748 - Banco Cooperativo Sicredi S.A.',118),('banco','749','749 - Banco Simples S.A.',119),('banco','751','751 - Scotiabank Brasil S.A. Banco Múltiplo',120),('banco','752','752 - Banco BNP Paribas Brasil S.A.',121),('banco','755','755 - Bank of America Merrill Lynch Banco Múltiplo S.A.',122),('banco','756','756 - Banco Cooperativo do Brasil S.A. - BANCOOB – SICOOB',123),('tipo_ie','1','Contribuinte do ICMS',124),('tipo_ie','2','Contribuinte Isento de Inscrição',125),('tipo_ie','3','Não Contribuinte',126),('id_classificacao','1','Abatimentos',127),('id_classificacao','2','Água',128),('id_classificacao','3','Aluguel',129),('id_classificacao','4','Aluguel de Equipamentos',130),('id_classificacao','5','Amortização de Empréstimos',131),('id_classificacao','6','Ativos e Equipamentos Próprios',132),('id_classificacao','7','Benefícios Salariais',133),('id_classificacao','8','Brindes',134),('id_classificacao','9','Combustível e Pedágios',135),('id_classificacao','10','Comissão de Vendas',136),('id_classificacao','11','Condomínio',137),('id_classificacao','12','Contabilidade',138),('id_classificacao','13','Devoluções',139),('id_classificacao','14','Embalagem',140),('id_classificacao','15','Encargos Salariais',141),('id_classificacao','16','Eventos',142),('id_classificacao','17','Frete',143),('id_classificacao','18','Honorários Advocatícios',144),('id_classificacao','19','Impostos',145),('id_classificacao','20','Internet',146),('id_classificacao','21','IPTU',147),('id_classificacao','22','Juros de Empréstimos',148),('id_classificacao','23','Limpeza',149),('id_classificacao','24','Luz',150),('id_classificacao','25','Manutenção',151),('id_classificacao','26','Material de Escritório',152),('id_classificacao','27','Matéria-Prima',153),('id_classificacao','28','Mercadoria para Revenda',154),('id_classificacao','29','Outras Despesas',155),('id_classificacao','30','PAGAMENTO A FORNECEDOR',156),('id_classificacao','31','Pro labore',157),('id_classificacao','32','Propaganda',158),('id_classificacao','33','Salários',159),('id_classificacao','35','Segurança',161),('id_classificacao','36','Seguros em Geral',162),('id_classificacao','37','Serviços de Entrega',163),('id_classificacao','38','Tarifas Bancárias',164),('id_classificacao','39','Telefone Celular',165),('id_classificacao','40','Telefone Fixo',166),('id_classificacao','41','Transferência',167),('id_classificacao','42','TV a Cabo',168),('id_classificacao','43','Viagem e Hospedagem',169),('tipo_pagamento','1','BOLETO',170),('tipo_pagamento','2','CARTÃO BENEFÍCIO',171),('tipo_pagamento','3','CARTÃO DE CRÉDITO',172),('tipo_pagamento','4','CARTÃO DE DÉBITO',173),('tipo_pagamento','5','CHEQUE',174),('tipo_pagamento','6','DEPÓSITO',175),('tipo_pagamento','7','DINHEIRO',176),('tipo_pagamento','8','IMPORTADO NF',177),('tipo_pagamento','9','PAGAMENTO DIGITAL',178),('tipo_pagamento','10','TEF',179),('tipo_pagamento','11','TRANSFERÊNCIA',180),('tipo_pagamento','12','VALE',181),('id_conta_dre','s','Aluguel, Condomínio e IPTU',182),('id_conta_dre','s','Custo da Mercadoria',183),('id_conta_dre','s','Despesas Financeirasv',184),('id_conta_dre','s','Gerais e Administrativas',185),('id_conta_dre','s','Impostos e Devoluções',186),('id_conta_dre','s','Pessoal',187),('id_conta_dre','s','Pro labore',188),('id_conta_dre','s','Propaganda e Marketing',189),('id_conta_dre','s','Utilidades',190),('id_conta_dre','e','Receitas Financeiras',191),('id_conta_dre','e','Entradas',192);

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
