ALTER TABLE `miste872_prod`.`tbl_contas_apagar`   
  ADD COLUMN `nr_vezes` CHAR(4) NULL  COMMENT '1x/2x/3x/4x ...' AFTER `tipo_pagamento`;

CREATE TABLE `miste872_prod`.`tbl_contas_areceber`(  
  `id_contas_areceber` INT(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` DATE NOT NULL,
  `id_conta_gerencial` INT(11) NOT NULL,
  `id_fornecedor` INT(11) NOT NULL,
  `id_documento` INT COMMENT 'deixar desativado',
  `dt_venc` DATE NOT NULL,
  `valor_areceber` DECIMAL(7,2) NOT NULL,
  `dt_recebido` DATE,
  `id_conta_corrente` INT(11),
  `valor_recebido` DECIMAL(7,2),
  `valor_desconto` DECIMAL(7,2),
  `valor_juros` DECIMAL(7,2),
  `obs` VARCHAR(255),
  `conta_fixa` CHAR(1) COMMENT 's - sim / n - não',
  `situacao` CHAR(1) COMMENT 'a - aberto / r - recebido',
  `tipo_recebimento` VARCHAR(11),
  `nr_vezes` CHAR(4) COMMENT '1x/2x/3x/4x ...',
  PRIMARY KEY (`id_contas_areceber`),
  CONSTRAINT `FK_CONTAS_ARECEBER_CONTA_CORRENTE` FOREIGN KEY (`id_conta_corrente`) REFERENCES `miste872_prod`.`tbl_conta_corrente`(`id_conta_corrente`),
  CONSTRAINT `FK_CONTAS_ARECEBER_CONTA_GERENECIAL` FOREIGN KEY (`id_conta_gerencial`) REFERENCES `miste872_prod`.`tbl_conta_gerencial`(`id_conta_gerencial`),
  CONSTRAINT `FK_CONTAS_ARECEBER_FORNECEDOR` FOREIGN KEY (`id_fornecedor`) REFERENCES `miste872_prod`.`tbl_fornecedor`(`id_fornecedor`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;
