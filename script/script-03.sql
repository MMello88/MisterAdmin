ALTER TABLE `miste872_prod`.`tbl_fornecedor`   
  CHANGE `ramo` `apelido` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NULL,
  ADD COLUMN `email` VARCHAR(200) NULL AFTER `whatsapp`,
  ADD COLUMN `site` VARCHAR(50) NULL AFTER `email`,
  CHANGE `descricao` `observacao` TEXT CHARSET utf8 COLLATE utf8_general_ci NULL  AFTER `site`,
  ADD COLUMN `tipo_pessoa` CHAR(1) NULL  COMMENT 'f - fisica / j - juridica' AFTER `observacao`,
  ADD COLUMN `cpf_cnpj` VARCHAR(14) NULL AFTER `tipo_pessoa`,
  ADD COLUMN `rg` VARCHAR(14) NULL AFTER `cpf_cnpj`,
  ADD COLUMN `inscr_municipal` VARCHAR(20) NULL AFTER `rg`,
  ADD COLUMN `inscr_estadual` VARCHAR(25) NULL AFTER `inscr_municipal`,
  ADD COLUMN `tipo_ie` CHAR(1) NULL AFTER `inscr_estadual`,
  ADD COLUMN `cep` VARCHAR(10) NULL AFTER `tipo_ie`,
  ADD COLUMN `endereco` VARCHAR(150) NULL AFTER `cep`,
  ADD COLUMN `numero` VARCHAR(10) NULL AFTER `endereco`,
  ADD COLUMN `bairro` VARCHAR(150) NULL AFTER `numero`,
  ADD COLUMN `complemento` VARCHAR(100) NULL AFTER `bairro`,
  ADD COLUMN `banco` VARCHAR(250) NULL AFTER `complemento`,
  ADD COLUMN `agencia` VARCHAR(10) NULL AFTER `banco`,
  ADD COLUMN `digito_ag` VARCHAR(5) NULL AFTER `agencia`,
  ADD COLUMN `conta_corrente` VARCHAR(15) NULL AFTER `digito_ag`,
  ADD COLUMN `digito_cc` VARCHAR(5) NULL AFTER `conta_corrente`;

ALTER TABLE `miste872_prod`.`tbl_fornecedor`   
  CHANGE `tipo_ie` `tipo_ie` CHAR(11) CHARSET utf8 COLLATE utf8_general_ci NULL;


CREATE TABLE `miste872_prod`.`tbl_contas_apagar`(  
  `id_contas_apagar` INT(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` DATE NOT NULL,
  `id_fornecedor` INT(11) NOT NULL,
  `id_documento` INT(11) COMMENT 'deixar desativado',
  `dt_venc` DATE NOT NULL,
  `valor_apagar` NUMERIC(7,2) NOT NULL,
  `dt_pago` DATE,
  `valor_pgto` NUMERIC(7,2),
  `valor_desconto` NUMERIC(7,2),
  `valor_juros` NUMERIC(7,2),
  `obs` VARCHAR(255),
  `conta_fixa` CHAR(1) COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_contas_apagar`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `miste872_prod`.`tbl_contas_apagar`  
  ADD CONSTRAINT `FK_CONTAS_APAGAR_FORNECEDOR` FOREIGN KEY (`id_fornecedor`) REFERENCES `miste872_prod`.`tbl_fornecedor`(`id_fornecedor`);

ALTER TABLE `miste872_prod`.`tbl_contas_apagar`   
  ADD COLUMN `id_classificacao` VARCHAR(11) NULL AFTER `conta_fixa`,
  ADD COLUMN `situacao` CHAR(1) NULL  COMMENT 'a - aberto / p - pago' AFTER `id_classificacao`;

ALTER TABLE `miste872_prod`.`tbl_contas_apagar`   
  ADD COLUMN `tipo_pagamento` VARCHAR(11) NULL AFTER `situacao`;


CREATE TABLE `miste872_prod`.`tbl_conta_gerencial`(  
  `id_conta_gerencial` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_conta_gerencial` VARCHAR(150) NOT NULL,
  `tipo_conta` CHAR(1) NOT NULL COMMENT 'e - entrada / s - saída',
  `id_conta_dre` CHAR(10),
  `cc_debito` VARCHAR(15),
  `cc_credito` VARCHAR(15),
  `permite_compras` CHAR(1) COMMENT 's - sim / n - não',
  `ativo` CHAR(1) COMMENT 'a - ativo / d - desativado',
  PRIMARY KEY (`id_conta_gerencial`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tbl_tipo (id_tipo, campo, tipo, descricao) VALUES 
(NULL, 'id_conta_dre', 's', 'Aluguel, Condomínio e IPTU'),
(NULL, 'id_conta_dre', 's', 'Custo da Mercadoria'),
(NULL, 'id_conta_dre', 's', 'Despesas Financeirasv'),
(NULL, 'id_conta_dre', 's', 'Gerais e Administrativas'),
(NULL, 'id_conta_dre', 's', 'Impostos e Devoluções'),
(NULL, 'id_conta_dre', 's', 'Pessoal'),
(NULL, 'id_conta_dre', 's', 'Pro labore'),
(NULL, 'id_conta_dre', 's', 'Propaganda e Marketing'),
(NULL, 'id_conta_dre', 's', 'Utilidades');

INSERT INTO tbl_tipo (id_tipo, campo, tipo, descricao) VALUES 
(NULL, 'id_conta_dre', 'e', 'Receitas Financeiras'),
(NULL, 'id_conta_dre', 'e', 'Entradas');

INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Abatimentos','s','','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Água','s','190','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Aluguel','s','182','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Aluguel de Equipamentos','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Amortização de Empréstimos','s','184','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'as e Equipamentos Próprios','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Benefícios Salariais','s','187','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Brindes','s','189','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Combustível e Pedágios','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Comissão de Vendas','s','187','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Condomínio','s','182','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Contabilidade','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Devoluções','s','186','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Embalagem','s','183','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Encargos Salariais','s','187','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Eventos','s','189','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Frete','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Honorários Advocatícios','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Impostos','s','186','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Internet','s','190','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'IPTU','s','182','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Juros de Empréstimos','s','184','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Limpeza','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Luz','s','190','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Manutenção','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Material de Escritório','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Matéria-Prima','s','183','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Mercadoria para Revenda','s','183','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Outras Despesas','s','','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Outras Despesas','s','','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'PAGAMENTO A FORNECEDOR','s','183','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Propaganda','s','189','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Salários','s','187','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'SALGADERIA CASTRO','s','183','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Segurança','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Seguros em Geral','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Serviços de Entrega','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Tarifas Bancárias','s','184','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Telefone Celular','s','190','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Telefone Fixo','s','190','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Transferência','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'TV a Cabo','s','190','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Viagem e Hospedagem','s','185','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Aportes ou Empréstimos','Entrada','191','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Outras Receitas','Entrada','','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Outras Receitas','Entrada','','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Rendimentos de Aplicação Bancária','Entrada','191','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Transferência','Entrada','192','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Vendas via Loja Virtual','Entrada','192','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Vendas via PDV','Entrada','192','','','n','a');
INSERT INTO tbl_conta_gerencial(id_conta_gerencial, nome_conta_gerencial, tipo_conta, id_conta_dre, cc_debito, cc_credito, permite_compras, ativo) VALUES (NULL,'Vendas via Pedido','Entrada','192','','','n','a');


CREATE TABLE `miste872_prod`.`tbl_conta_corrente`(  
  `id_conta_corrente` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_conta_corrente` VARCHAR(150) NOT NULL,
  `interna` CHAR(1) NOT NULL,
  `banco` VARCHAR(10),
  `agencia` VARCHAR(10),
  `digito_ag` VARCHAR(5),
  `conta_corrente` VARCHAR(15),
  `digito_cc` VARCHAR(5),
  `principal` CHAR(1) COMMENT 's - sim / n - não',
  `ativo` CHAR(1) COMMENT 's - sim / n - não',
  PRIMARY KEY (`id_conta_corrente`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `miste872_prod`.`tbl_contas_apagar`   
  CHANGE `id_classificacao` `id_conta_gerencial` INT(11) NOT NULL  AFTER `dt_cadastro`,
  CHANGE `id_fornecedor` `id_fornecedor` INT(11) NOT NULL  AFTER `id_conta_gerencial`,
  ADD COLUMN `id_conta_corrente` INT(11) NULL AFTER `dt_pago`,
  CHANGE `situacao` `situacao` CHAR(1) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'a - aberto / p - pago'  AFTER `conta_fixa`;
ALTER TABLE `miste872_prod`.`tbl_contas_apagar`  
  ADD CONSTRAINT `FK_CONTAS_APAGAR_CONTA_GERENECIAL` FOREIGN KEY (`id_conta_gerencial`) REFERENCES `miste872_prod`.`tbl_conta_gerencial`(`id_conta_gerencial`),
  ADD CONSTRAINT `FK_CONTAS_APAGAR_CONTA_CORRENTE` FOREIGN KEY (`id_conta_corrente`) REFERENCES `miste872_prod`.`tbl_conta_corrente`(`id_conta_corrente`);

ALTER TABLE `miste872_prod`.`tbl_cliente`   
  ADD COLUMN `id_cidade` INT(11) NULL AFTER `ativo`,
  ADD COLUMN `dt_cadastro` DATE NULL AFTER `id_cidade`, 
  ADD CONSTRAINT `FK_CIENTE_CIDADE` FOREIGN KEY (`id_cidade`) REFERENCES `miste872_prod`.`tbl_cidade`(`id_cidade`);
