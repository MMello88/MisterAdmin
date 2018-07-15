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

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('12juuj1lvm9kevmrh5o3v2cia86cairq','::1',1531518597,''),('7usivnkfch4ttha20v7sc5p7go1a9pl9','::1',1531512173,''),('c3nq6cq1ns6k7tm5tq88imraeddac13u','::1',1531517487,''),('osve0o9q7d3cn0lq448ink448f1a5e6v','::1',1531518417,'');

/*Table structure for table `tbl_arquivo_controller` */

DROP TABLE IF EXISTS `tbl_arquivo_controller`;

CREATE TABLE `tbl_arquivo_controller` (
  `arquivo_controller_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_controller` varchar(80) NOT NULL,
  `diretorio` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`arquivo_controller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_arquivo_controller` */

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_cart` */

insert  into `tbl_cart`(`id_cart`,`id_session`,`id_categoria_produto`,`id_produto`,`id_cidade`,`qtde`,`valor_unitario`,`situacao`,`cod_promo`) values (2,'76abb1d174afe90b48403c9b98fa8eba',3,15,1,10,0.45,'d','0'),(3,'76abb1d174afe90b48403c9b98fa8eba',3,15,1,10,0.45,'d','0'),(4,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,14,1,40,0.45,'a','0'),(5,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,15,1,30,0.45,'a','0'),(6,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,16,1,30,0.45,'a','0'),(7,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,16,1,10,0.45,'a','0'),(8,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,18,1,20,0.45,'a','0'),(9,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,18,1,40,0.45,'a','0'),(10,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,18,1,10,0.45,'a','0'),(11,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,18,1,10,0.45,'a','0'),(12,'7a6846d4abe8c1d217cb0eb21fbe3d6a',3,17,1,30,0.45,'a','0'),(13,'7a6846d4abe8c1d217cb0eb21fbe3d6a',4,17,1,20,0.45,'a','0'),(15,'4d48895e978f7e285b9ce37ad43ebde3',4,14,1,30,0.40,'d','0'),(16,'4d48895e978f7e285b9ce37ad43ebde3',4,14,1,10,0.40,'d','0'),(17,'4d48895e978f7e285b9ce37ad43ebde3',3,39,1,10,0.45,'d','0');

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

insert  into `tbl_categoria_produto`(`id_categoria_produto`,`nome`,`situacao`,`cssClass`,`controla_estoque`) values (1,'Salgados','d','frito',''),(2,'Congelados','d','congelado',''),(3,'Mini Salgados','a','mini-frito',''),(4,'Mini Congelado','a','mini-congelado',''),(5,'Refrigerante','d','refrigerante',''),(6,'Sucos','d','suco',''),(7,'Doces','d','doce',''),(8,'Promoções','d','promocao',''),(9,'Festa','d','festa',''),(10,'Bandeja','d','bandeja','');

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

insert  into `tbl_cidade`(`id_cidade`,`nome`,`uf`,`link`) values (1,'Ribeirão Preto','SP','ribeirao-preto'),(2,'Pontal','SP','pontal'),(3,'Vitrine','','');

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

insert  into `tbl_cidade_categoria`(`id_cidade_categoria`,`id_cidade`,`id_categoria_produto`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,3),(6,2,4),(7,3,1),(8,3,2),(9,3,3),(10,3,4);

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

insert  into `tbl_cliente`(`id_cliente`,`nome`,`email`,`senha`,`telefone`,`endereco`,`numero`,`bairro`,`complemento`,`situacao`,`tipo`,`ganho_unitario`,`cpf_cnpj`,`hash`,`ativo`) values (10,'Fernanda Lujan Torolio gonzalez','ferlujangom@hotmail.com','','11988775176','Av do café 1149 bl B ap 103','','',NULL,'a','c',NULL,NULL,NULL,'0'),(11,'Juliana Roberta Verissimo','julianarverissimo@gmail.com','','16992155377','Rua Monte Santo, 324','','',NULL,'a','c',NULL,NULL,NULL,'0'),(12,'ANA CAROLINA TASCHETI','taschetty@hotmail.com','','16 99247-4154','macario da silva ribeiro 99','','',NULL,'a','c',NULL,NULL,NULL,'0'),(13,'Carol','carolynebrito3@gmail.com','','16 99161-2326','Rua Paraguaçu Paulista 137','','',NULL,'a','c',NULL,NULL,NULL,'0'),(14,'Alfredo souza','alfredosouza2012@bol.com.br','','16992839989','Rua Antônio Martinez, 222','','',NULL,'a','c',NULL,NULL,NULL,'0'),(15,'Jessica','jessicamylove47@hotmail.com','','16991676217','Macir ramazini 2462','','',NULL,'a','c',NULL,NULL,NULL,'0'),(22,'MATHEUS DE MELLO','matheus.gnu@gmail.com','e3bcdf1347b79080238afbe758cf103d','16991838523','Av. Plínio Castro Prado 431, Apto 33','1000','centro',NULL,'a','c',0.00,NULL,NULL,'1'),(23,'valeria loppi simoes de abreu oliveira','valeria.loppi26@gmail.com','6464248e8460c1f803c4ea1d8867652b','199971156160','av presidente vargs','1617','JARDIM IRAJA','loja 02 -loja mais natural','a','c',0.00,NULL,NULL,'1'),(24,'Leonardo Patricio','nosferaturaiu@gmail.com','dad96e9e0dfe82c0deda5673e539b96f','16993758806','Vicente Della Ricci','30','Geraldo de Carvalho','30','a','c',0.00,NULL,'1ff1de774005f8da13f42943881c655f',NULL),(25,'Micael Monteiro','Mica__pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo Horizonte',NULL,'a','c',0.00,NULL,'8e296a067a37563370ded05f5a3bf3ec',NULL),(26,'Micael monteiro','mica_pontal@hotmail.com','b159b68dcd6ee6eb3002f48112e16cf6','16 992374185','Expedicionário Osvaldo lellis','115','Novo horizonte',NULL,'a','c',0.00,NULL,NULL,'1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_estoque` */

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

/*Table structure for table `tbl_ficha_kerdex` */

DROP TABLE IF EXISTS `tbl_ficha_kerdex`;

CREATE TABLE `tbl_ficha_kerdex` (
  `id_ficha_kerdex` int(11) NOT NULL AUTO_INCREMENT COMMENT 'FichaKerdexs',
  `id_loja` int(11) NOT NULL COMMENT 'Lojas',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `movimento` char(2) NOT NULL COMMENT 'e-entrada / s-saida / a - ajuste',
  `origem_movimento` char(3) NOT NULL COMMENT 'me - movimentacao estoque / nfs - nota fiscal sainda / nfe nota fiscal entrada / ps - pedido site',
  `data_movimento` date NOT NULL,
  `qtde_movimento` decimal(6,0) NOT NULL,
  PRIMARY KEY (`id_ficha_kerdex`),
  KEY `id_loja` (`id_loja`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `tbl_ficha_kerdex_ibfk_1` FOREIGN KEY (`id_loja`) REFERENCES `tbl_loja` (`id_loja`),
  CONSTRAINT `tbl_ficha_kerdex_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de movimentação de produto';

/*Data for the table `tbl_ficha_kerdex` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_function_controller` */

/*Table structure for table `tbl_item_pedido` */

DROP TABLE IF EXISTS `tbl_item_pedido`;

CREATE TABLE `tbl_item_pedido` (
  `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ItensPedido',
  `id_pedido` int(11) NOT NULL COMMENT 'Pedidos',
  `id_produto` int(11) NOT NULL COMMENT 'Produtos',
  `qtde` decimal(6,0) NOT NULL,
  `valor_unitario` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `tbl_item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`),
  CONSTRAINT `tbl_item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='Cadastro dos itens do pedido para salgado';

/*Data for the table `tbl_item_pedido` */

insert  into `tbl_item_pedido`(`id_item_pedido`,`id_pedido`,`id_produto`,`qtde`,`valor_unitario`) values (66,75,39,10,0.45),(67,75,14,40,0.40);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de cadastro das lojas filiais';

/*Data for the table `tbl_loja` */

/*Table structure for table `tbl_menu` */

DROP TABLE IF EXISTS `tbl_menu`;

CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_menu` varchar(80) NOT NULL,
  `menu_titulo` varchar(80) DEFAULT NULL,
  `tag_i` varchar(50) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `ativo` char(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_menu` */

/*Table structure for table `tbl_movimentacao_estoque` */

DROP TABLE IF EXISTS `tbl_movimentacao_estoque`;

CREATE TABLE `tbl_movimentacao_estoque` (
  `id_movimentacao_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `tipo_movimentacao` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'e - entrada / s - sainda / a - ajuste',
  `qtde_movimentacao` decimal(6,0) DEFAULT NULL,
  `data_movimentacao` datetime DEFAULT NULL,
  `id_categoria_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_movimentacao_estoque`),
  KEY `FK_MOV_ESTQ_LOJA` (`id_loja`),
  KEY `FK_MOV_ESTQ_PROD` (`id_produto`),
  KEY `FK_MOV_ESTQ_CATG` (`id_categoria_produto`),
  CONSTRAINT `FK_MOV_ESTQ_CATG` FOREIGN KEY (`id_categoria_produto`) REFERENCES `tbl_categoria_produto` (`id_categoria_produto`),
  CONSTRAINT `FK_MOV_ESTQ_LOJA` FOREIGN KEY (`id_loja`) REFERENCES `tbl_loja` (`id_loja`),
  CONSTRAINT `FK_MOV_ESTQ_PROD` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_movimentacao_estoque` */

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

/*Table structure for table `tbl_pedido` */

DROP TABLE IF EXISTS `tbl_pedido`;

CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pedidos',
  `id_cliente` int(11) NOT NULL COMMENT 'Clientes',
  `id_cidade` int(11) NOT NULL COMMENT 'Cidades',
  `situacao` char(1) NOT NULL COMMENT 's - solicitado / v - visualizado / p - produzindo / t - saiu entrega / e - entregue',
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='Cadastro de Pedido do Salgado';

/*Data for the table `tbl_pedido` */

insert  into `tbl_pedido`(`id_pedido`,`id_cliente`,`id_cidade`,`situacao`,`data_pedido`,`valor`,`valor_total`,`forma_pgto`,`forma_entrega`,`taxa_entrega`,`data_entrega`,`hora_entrega`,`end_entrega`,`num_entrega`,`bairro_entrega`,`comp_entrega`,`data_pagamento`) values (15,10,1,'e','2017-11-04 00:00:00',22.50,25.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,11,1,'e','2017-11-09 00:00:00',31.50,34.50,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,12,1,'e','2017-11-09 00:00:00',24.00,27.00,NULL,'',5.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,13,1,'e','2017-11-29 15:57:57',40.00,43.00,'d','',3.00,'2017-12-01','13:30h',NULL,NULL,NULL,NULL,NULL),(26,11,1,'e','2018-01-11 08:28:24',45.00,48.00,'d','',3.00,'2018-01-13','19:30h',NULL,NULL,NULL,NULL,NULL),(27,14,1,'e','2018-06-04 11:29:29',13.50,16.50,'cd','',3.00,'2018-06-06',NULL,NULL,NULL,NULL,NULL,NULL),(28,15,2,'e','2018-06-07 21:20:21',45.00,48.00,'cd','',3.00,'2018-06-09','13:30h',NULL,NULL,NULL,NULL,NULL),(74,22,1,'s','2018-07-13 19:30:17',9.00,9.00,'d','r',7.00,'2018-07-14','11:00',NULL,NULL,NULL,NULL,NULL),(75,22,1,'s','2018-07-14 09:51:17',20.50,20.50,'d','r',7.00,'2018-07-14','14:00',NULL,NULL,NULL,NULL,NULL);

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

insert  into `tbl_produto`(`id_produto`,`nome`,`situacao`,`controla_estoque`) values (1,'Croquete','a',''),(2,'Bolinho de Carne','a',''),(3,'Coxinha','a',''),(4,'Enroladinho','a',''),(5,'Salsicha','a',''),(6,'Kibe','a',''),(13,'Mini Croquete','d',''),(14,'Mini Bolinho de Carne','a',''),(15,'Mini Coxinha','a',''),(16,'Mini Enroladinho','a',''),(17,'Mini Salsicha','a',''),(18,'Mini Kibe','a',''),(39,'Mini Bolinha de Queijo','a','');

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

insert  into `tbl_produto_categoria`(`id_produto_categoria`,`id_produto`,`id_categoria_produto`,`imagem`) values (1,1,1,'frito_croquete.png'),(2,1,2,'congelado_croquete.png'),(3,13,3,'mini_cro.png'),(4,13,4,'mini_cro_sem.png'),(5,2,1,'frito_bolinho_carne.png'),(6,2,2,'congelado_bolinho_carne.png'),(7,14,3,'frito_mini_bolinho_carne.jpg'),(8,14,4,'congelado_mini_bolinho_carne.jpg'),(9,3,1,'frito_coxinha.png'),(10,3,2,'congelado_coxinha.png'),(11,15,3,'frito_mini_coxinha.jpg'),(12,15,4,'congelado_mini_coxinha.jpg'),(13,4,1,'frito_enroladinho.png'),(14,4,2,'congelado_enroladinho.png'),(15,16,3,'frito_mini_enroladinho.jpg'),(16,16,4,'congelado_mini_enroladinho.jpg'),(17,5,1,'frito_salsicha.png'),(18,5,2,'congelado_salsicha.png'),(19,17,3,'frito_mini_salsicha.jpg'),(20,17,4,'congelado_mini_salsicha.jpg'),(21,6,1,'frito_kibe.png'),(22,6,2,'congelado_kibe.png'),(23,18,3,'frito_mini_kibe.jpg'),(24,18,4,'congelado_mini_kibe.jpg'),(25,39,3,'frito_mini_bolinha_queijo.jpg'),(26,39,4,'congelado_mini_bolinha_queijo.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_submenu` */

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

insert  into `tbl_tipo`(`campo`,`tipo`,`descricao`,`id_tipo`) values ('forma_pgto','d','Dinheiro',1),('forma_pgto','cd','Cartão de Débito',2),('forma_pgto','cc','Cartão de Crédito',3),('hora_entrega','11:00','11:00h',4),('hora_entrega','12:00','12:00h',5),('hora_entrega','13:00','13:00h',6),('hora_entrega','14:00','14:00h',7),('hora_entrega','15:00','15:00h',8),('hora_entrega','16:00','16:00h',9),('hora_entrega','17:00','17:00h',10),('hora_entrega','18:00','18:00h',11),('hora_entrega','19:00','19:00h',12);

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

insert  into `tbl_valor_produto`(`id_valor_produto`,`id_produto`,`data_atualizacao`,`preco`,`tipo_cliente`,`id_categoria_produto`) values (170,1,'2018-01-01',3.00,'c',1),(171,1,'2018-01-01',3.00,'s',1),(172,1,'2018-01-01',2.20,'r',1),(173,2,'2018-01-01',3.00,'c',1),(174,2,'2018-01-01',3.00,'s',1),(175,2,'2018-01-01',2.20,'r',1),(176,3,'2018-01-01',3.00,'c',1),(177,3,'2018-01-01',3.00,'s',1),(178,3,'2018-01-01',2.20,'r',1),(179,4,'2018-01-01',3.00,'c',1),(180,4,'2018-01-01',3.00,'s',1),(181,4,'2018-01-01',2.20,'r',1),(182,5,'2018-01-01',3.00,'c',1),(183,5,'2018-01-01',3.00,'s',1),(184,5,'2018-01-01',2.20,'r',1),(185,6,'2018-01-01',3.00,'c',1),(186,6,'2018-01-01',3.00,'s',1),(187,6,'2018-01-01',2.20,'r',1),(188,1,'2018-01-01',2.25,'c',2),(189,1,'2018-01-01',2.50,'s',2),(190,1,'2018-01-01',1.90,'r',2),(191,2,'2018-01-01',2.25,'c',2),(192,2,'2018-01-01',2.50,'s',2),(193,2,'2018-01-01',1.90,'r',2),(194,3,'2018-01-01',2.25,'c',2),(195,3,'2018-01-01',2.50,'s',2),(196,3,'2018-01-01',1.90,'r',2),(197,4,'2018-01-01',2.25,'c',2),(198,4,'2018-01-01',2.50,'s',2),(199,4,'2018-01-01',1.90,'r',2),(200,5,'2018-01-01',2.25,'c',2),(201,5,'2018-01-01',2.50,'s',2),(202,5,'2018-01-01',1.90,'r',2),(203,6,'2018-01-01',2.25,'c',2),(204,6,'2018-01-01',2.50,'s',2),(205,6,'2018-01-01',1.90,'r',2),(206,13,'2018-01-01',0.45,'c',3),(207,13,'2018-01-01',0.45,'s',3),(208,13,'2018-01-01',0.36,'r',3),(209,14,'2018-01-01',0.45,'c',3),(210,14,'2018-01-01',0.45,'s',3),(211,14,'2018-01-01',0.36,'r',3),(212,15,'2018-01-01',0.45,'c',3),(213,15,'2018-01-01',0.45,'s',3),(214,15,'2018-01-01',0.36,'r',3),(215,16,'2018-01-01',0.45,'c',3),(216,16,'2018-01-01',0.45,'s',3),(217,16,'2018-01-01',0.36,'r',3),(218,17,'2018-01-01',0.45,'c',3),(219,17,'2018-01-01',0.45,'s',3),(220,17,'2018-01-01',0.36,'r',3),(221,18,'2018-01-01',0.45,'c',3),(222,18,'2018-01-01',0.45,'s',3),(223,18,'2018-01-01',0.36,'r',3),(224,39,'2018-01-01',0.45,'c',3),(225,39,'2018-01-01',0.45,'s',3),(226,39,'2018-01-01',0.36,'r',3),(227,13,'2018-01-01',0.40,'c',4),(228,13,'2018-01-01',0.40,'s',4),(229,13,'2018-01-01',0.35,'r',4),(230,14,'2018-01-01',0.40,'c',4),(231,14,'2018-01-01',0.40,'s',4),(232,14,'2018-01-01',0.35,'r',4),(233,15,'2018-01-01',0.40,'c',4),(234,15,'2018-01-01',0.40,'s',4),(235,15,'2018-01-01',0.35,'r',4),(236,16,'2018-01-01',0.40,'c',4),(237,16,'2018-01-01',0.40,'s',4),(238,16,'2018-01-01',0.35,'r',4),(239,17,'2018-01-01',0.40,'c',4),(240,17,'2018-01-01',0.40,'s',4),(241,17,'2018-01-01',0.35,'r',4),(242,18,'2018-01-01',0.40,'c',4),(243,18,'2018-01-01',0.40,'s',4),(244,18,'2018-01-01',0.35,'r',4),(245,39,'2018-01-01',0.40,'c',4),(246,39,'2018-01-01',0.40,'s',4),(247,39,'2018-01-01',0.35,'r',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
