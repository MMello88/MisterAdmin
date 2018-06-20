CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `miste872_prod`.`tbl_tipo`   
  ADD COLUMN `id_tipo` INT NOT NULL AFTER `descricao`;

ALTER TABLE `miste872_prod`.`tbl_tipo`   
  CHANGE `id_tipo` `id_tipo` INT(11) NOT NULL AUTO_INCREMENT, 
  ADD PRIMARY KEY (`id_tipo`);
