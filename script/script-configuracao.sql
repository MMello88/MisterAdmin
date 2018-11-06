ALTER TABLE `miste872_prod`.`tbl_arquivo_controller`   
  CHANGE `arquivo_controller_id` `arquivo_controller_id` INT(11) NOT NULL AUTO_INCREMENT  COMMENT 'display_column:Id',
  CHANGE `nome_controller` `nome_controller` VARCHAR(80) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Nome da Controler',
  CHANGE `diretorio` `diretorio` VARCHAR(80) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'display_column:Diretório',
COMMENT='nome:Arquivo de Controler';

ALTER TABLE `miste872_prod`.`tbl_arquivo_controller`   
  ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário' AFTER `diretorio`,
  ADD CONSTRAINT `FK_ARQ_CTRL_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`);

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `id_cart` `id_cart` INT(11) NOT NULL AUTO_INCREMENT  COMMENT 'display_column:Id',
  CHANGE `id_session` `id_session` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Id Session',
  CHANGE `id_categoria_produto` `id_categoria_produto` INT(11) NOT NULL  COMMENT 'display_column:Id Categ. Produto',
  CHANGE `id_produto` `id_produto` INT(11) NOT NULL  COMMENT 'display_column:Id Produto',
  CHANGE `id_cidade` `id_cidade` INT(11) NULL  COMMENT 'display_column:Id Cidade',
  CHANGE `qtde` `qtde` DECIMAL(6,0) NOT NULL  COMMENT 'display_column:Qtde',
  CHANGE `valor_unitario` `valor_unitario` DECIMAL(6,2) NOT NULL  COMMENT 'display_column:Valor Unitário',
  CHANGE `situacao` `situacao` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Situação:select:\'a\' => \'Aberto\', \'f\' => \'Fechado\'',
  CHANGE `cod_promo` `cod_promo` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '0'   NULL  COMMENT 'display_column:SN Cod. Promo:select:\'1\' => \'True\', \'0\' => \'False\'',
  ADD COLUMN `id_usuario` INT(11) NULL AFTER `cod_promo`,
  ADD CONSTRAINT `FK_CART_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`),
COMMENT='nome:Carrinho';

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `id_usuario` `id_usuario` INT(11) NULL  COMMENT 'display_column:Id Usuário';

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `situacao` `situacao` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Situação:select:\'a\' => \'Ativo\', \'d\' => \'Desativado\'';

ALTER TABLE `miste872_prod`.`tbl_cart`   
  CHANGE `id_categoria_produto` `id_categoria_produto` INT(11) NOT NULL  COMMENT 'display_column:Categ. Produto',
  CHANGE `id_produto` `id_produto` INT(11) NOT NULL  COMMENT 'display_column:Produto',
  CHANGE `id_cidade` `id_cidade` INT(11) NULL  COMMENT 'display_column:Cidade',
  CHANGE `id_usuario` `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário';

/* begin_tbl_afazer */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_afazer SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_afazer` COMMENT='nome:A Fazeres'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `id_afazer` `id_afazer` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `afazer` `afazer` varchar(255) NOT NULL COMMENT 'display_column:Descrição a Fazer:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `dt_inicio` `dt_inicio` date NOT NULL COMMENT 'display_column:Dt. Inicio:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `dt_fim` `dt_fim` date NULL COMMENT 'display_column:Dt. Fim:select:'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `realizado` `realizado` char(1) NOT NULL COMMENT 'display_column:Realizado:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_afazer` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_afazer */ 
/* begin_tbl_arquivo_controller */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_arquivo_controller SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` COMMENT='nome:Arquivo de Controler'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `arquivo_controller_id` `arquivo_controller_id` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `nome_controller` `nome_controller` varchar(80) NOT NULL COMMENT 'display_column:Nome da Controler:select:'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `diretorio` `diretorio` varchar(80) NULL COMMENT 'display_column:Diretório:select:'; 
ALTER TABLE `miste872_prod`.`tbl_arquivo_controller` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_arquivo_controller */ 
/* begin_tbl_cart */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cart SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cart` COMMENT='nome:Carrinho'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_cart` `id_cart` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_session` `id_session` varchar(255) NOT NULL COMMENT 'display_column:Id Session:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_categoria_produto` `id_categoria_produto` int(11) NULL COMMENT 'display_column:Categ. Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_produto` `id_produto` int(11) NULL COMMENT 'display_column:Produto:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_cidade` `id_cidade` int(11) NULL COMMENT 'display_column:Cidade:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `qtde` `qtde` decimal(6,0) NULL COMMENT 'display_column:Qtde:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `valor_unitario` `valor_unitario` decimal(6,2) NOT NULL COMMENT 'display_column:Valor Unitário:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `situacao` `situacao` char(1) NOT NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `cod_promo` `cod_promo` char(1) NULL COMMENT 'display_column:SN Cod. Promo:select:"1" => "True", "0" => "False"'; 
ALTER TABLE `miste872_prod`.`tbl_cart` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cart */ 
/* begin_tbl_categoria */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_categoria SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_categoria` COMMENT='nome:Categoria'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `id_categoria` `id_categoria` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `nome` `nome` varchar(250) NOT NULL COMMENT 'display_column:Categoria:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `situacao` `situacao` char(1) NOT NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `cssClass` `cssClass` varchar(150) NOT NULL COMMENT 'display_column:Css:select:'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `controla_estoque` `controla_estoque` char(1) NOT NULL COMMENT 'display_column:SN Controla Estoque:select:"s" => "Sim", "n" => "Não"'; 
ALTER TABLE `miste872_prod`.`tbl_categoria` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column::select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_categoria */ 
/* begin_tbl_cidade */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cidade SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cidade` COMMENT='nome:Cidades'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `id_cidade` `id_cidade` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `nome` `nome` varchar(150) NOT NULL COMMENT 'display_column:Cidade:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `uf` `uf` varchar(2) NOT NULL COMMENT 'display_column:UF:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `link` `link` varchar(100) NOT NULL COMMENT 'display_column:Link:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cidade */ 
/* begin_tbl_cidade_categoria */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cidade_categoria SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` COMMENT='nome:Cidade por Categoria'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_cidade_categoria` `id_cidade_categoria` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_cidade` `id_cidade` int(11) NOT NULL COMMENT 'display_column:Cidade:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_categoria` `id_categoria` int(11) NOT NULL COMMENT 'display_column:Categoria:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cidade_categoria` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cidade_categoria */ 
/* begin_tbl_cliente */ 
SET FOREIGN_KEY_CHECKS = 0; 
UPDATE tbl_cliente SET id_usuario = 6; 
ALTER TABLE `miste872_prod`.`tbl_cliente` COMMENT='nome:Cliente'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `id_cliente` `id_cliente` int(11) NOT NULL COMMENT 'display_column:Id:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `nome` `nome` varchar(150) NOT NULL COMMENT 'display_column:Nome:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `email` `email` varchar(250) NOT NULL COMMENT 'display_column:E-mail:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `senha` `senha` varchar(64) NOT NULL COMMENT 'display_column:Senha:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `telefone` `telefone` varchar(30) NULL COMMENT 'display_column:Telefone:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `endereco` `endereco` varchar(250) NULL COMMENT 'display_column:Endereço:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `numero` `numero` varchar(10) NULL COMMENT 'display_column:Nr.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `bairro` `bairro` varchar(150) NULL COMMENT 'display_column:Bairro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `complemento` `complemento` varchar(100) NULL COMMENT 'display_column:Compl.:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `situacao` `situacao` char(1) NULL COMMENT 'display_column:Situação:select:"a" => "Ativo", "d" => "Desativado"'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `tipo` `tipo` char(1) NULL COMMENT 'display_column:Tipo:select:"c" => "Cliente", "r" => "Revendedor", "s" => "Representante", "p" => "Parceiro"'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `ganho_unitario` `ganho_unitario` decimal(2,2) NULL COMMENT 'display_column:% Ganho:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `cpf_cnpj` `cpf_cnpj` varchar(14) NULL COMMENT 'display_column:CPF/CNPJ:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `hash` `hash` varchar(255) NULL COMMENT 'display_column:Hash:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `ativo` `ativo` char(1) NULL COMMENT 'display_column:Ativo:select:"1" => "Frue", "0" => "False"'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `dt_cadastro` `dt_cadastro` datetime NULL COMMENT 'display_column:Dt. Cadastro:select:'; 
ALTER TABLE `miste872_prod`.`tbl_cliente` CHANGE `id_usuario` `id_usuario` int(11) NULL COMMENT 'display_column:Usuário:select:'; 
SET FOREIGN_KEY_CHECKS = 1; 
/* end_tbl_cliente */ 

