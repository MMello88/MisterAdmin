CREATE TABLE `miste872_prod`.`tbl_usuario`(  
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `email` VARCHAR(250) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  `hash` VARCHAR(255) NULL,
  `ativo` CHAR(1) NOT NULL COMMENT 'a - ativo / d - desativado',
  `dt_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `miste872_prod`.`tbl_usuario`   
  ADD COLUMN `telefone` VARCHAR(30) NULL AFTER `dt_cadastro`,
  ADD COLUMN `end_completo` VARCHAR(150) NULL AFTER `telefone`;

CREATE TABLE `miste872_prod`.`tbl_empresa`(  
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `razao_social` VARCHAR(250) NOT NULL,
  `nome_fantasia` VARCHAR(250) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `nr_inscricao_muni` VARCHAR(20),
  `cnae` VARCHAR(250),
  `data_nascimento` DATE,
  `data_abertura` DATE,
  `endereco` VARCHAR(200) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `complemento` VARCHAR(50),
  `bairro` VARCHAR(150) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `municipio` VARCHAR(100) NOT NULL,
  `uf` VARCHAR(10) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`)
);

ALTER TABLE `miste872_prod`.`tbl_empresa`   
  ADD COLUMN `id_tipo` INT(11) NULL AFTER `id_usuario`,
  ADD CONSTRAINT `fk_empresa_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `miste872_prod`.`tbl_tipo`(`id_tipo`);

ALTER TABLE `miste872_prod`.`tbl_empresa`   
  ADD COLUMN `sn_filial` CHAR(1) NULL  COMMENT 's - é filial / n - não é filial' AFTER `id_tipo`;

CREATE TABLE `miste872_prod`.`tbl_teste`(  
  `id_teste` INT(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` INT(11) NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_teste`),
  CONSTRAINT `fk_teste_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `miste872_prod`.`tbl_empresa`(`id_empresa`),
  CONSTRAINT `fk_teste_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `miste872_prod`.`tbl_cliente`   
  ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'id do usuário' AFTER `dt_cadastro`;

ALTER TABLE `miste872_prod`.`tbl_cliente`  
  ADD CONSTRAINT `FK_CLIENTE_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`);

ALTER TABLE `miste872_prod`.`tbl_cidade`   
  ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'id do usuário';

ALTER TABLE `miste872_prod`.`tbl_cidade`  
  ADD CONSTRAINT `FK_CIDADE_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`);

ALTER TABLE `miste872_prod`.`tbl_fornecedor`   
  ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'id do usuário';

ALTER TABLE `miste872_prod`.`tbl_fornecedor`  
  ADD CONSTRAINT `FK_FORNECEDOR_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_usuario`(`id_usuario`);

RENAME TABLE `miste872_prod`.`tbl_categoria_produto` TO `miste872_prod`.`tbl_categoria`;

ALTER TABLE `miste872_prod`.`tbl_categoria`   
  CHANGE `id_categoria_produto` `id_categoria` INT(11) NOT NULL AUTO_INCREMENT  COMMENT 'CategoriasProduto';

ALTER TABLE `miste872_prod`.`tbl_cidade_categoria`   
  CHANGE `id_categoria_produto` `id_categoria` INT(11) NOT NULL;

ALTER TABLE `miste872_prod`.`tbl_item_pedido`   
  CHANGE `id_categoria_produto` `id_categoria` INT(11) NOT NULL  COMMENT 'categoria';



ALTER TABLE `miste872_prod`.`tbl_afazer`  
COMMENT='nome:A Fazeres';

ALTER TABLE `miste872_prod`.`tbl_afazer`   
  CHANGE `id_afazer` `id_afazer` INT(11) NOT NULL AUTO_INCREMENT  COMMENT 'display_column:Id',
  CHANGE `afazer` `afazer` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NOT NULL  COMMENT 'display_column:Descrição a Fazer',
  CHANGE `dt_inicio` `dt_inicio` DATE NOT NULL  COMMENT 'display_column:Dt. Inicio',
  CHANGE `dt_fim` `dt_fim` DATE NULL  COMMENT 'display_column:Dt. Fim',
  CHANGE `realizado` `realizado` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'display_column:Realizado:select:\'s\' => \'Sim\', \'n\' => \'Não\'';

ALTER TABLE `miste872_prod`.`tbl_afazer`   
  ADD COLUMN `id_usuario` INT(11) NULL  COMMENT 'display_column:Usuário' AFTER `realizado`,
  ADD CONSTRAINT `FK_AFAZER_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `miste872_prod`.`tbl_afazer`(`id_afazer`);
