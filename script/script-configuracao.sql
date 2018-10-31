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
