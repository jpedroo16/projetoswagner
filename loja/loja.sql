

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `codProdutos` INT NOT NULL AUTO_INCREMENT,
  `descricao_ec` VARCHAR(50) NULL,
  `categoria_ec` VARCHAR(30) NULL,
  `classificacao_ec` VARCHAR(20) NULL,
  `numeracao_ec` VARCHAR(10) NULL,
  `modelo_ec` VARCHAR(20) NULL,
  `cor_ec` VARCHAR(10) NULL,
  PRIMARY KEY (`codProdutos`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`fornecedores` (
  `cnpj_ec` DECIMAL(14,0) NOT NULL,
  `razaosocial_ec` VARCHAR(50) NULL,
  `endereco_ec` VARCHAR(60) NULL,
  `bairro_ec` VARCHAR(30) NULL,
  `cidade_ec` VARCHAR(45) NULL,
  `estado_ec` CHAR(2) NULL,
  `telefone_ec` VARCHAR(20) NULL,
  `email_ec` VARCHAR(60) NULL,
  `site_ec` VARCHAR(50) NULL,
  `produtos_codProdutos` INT NOT NULL,
  PRIMARY KEY (`cnpj_ec`, `produtos_codProdutos`),
  INDEX `fk_fornecedores_produtos_idx` (`produtos_codProdutos` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedores_produtos`
    FOREIGN KEY (`produtos_codProdutos`)
    REFERENCES `mydb`.`produtos` (`codProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `cpf_ec` DECIMAL(11,0) NOT NULL,
  `nome_ec` VARCHAR(30) NULL,
  `endereco_ec` VARCHAR(60) NULL,
  `bairro_ec` VARCHAR(30) NULL,
  `estado_ec` CHAR(2) NULL,
  `telefone_ec` VARCHAR(20) NULL,
  `datanasc_ec` VARCHAR(10) NULL,
  `email_ec` VARCHAR(60) NULL,
  PRIMARY KEY (`cpf_ec`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `idPedido` VARCHAR(20) NOT NULL,
  `quantidade` INT NULL,
  `data` VARCHAR(10) NULL,
  `preco` DECIMAL(10,0) NULL,
  `cliente_cpf` VARCHAR(11) NULL,
  `` INT NULL,
  `produtos_codProdutos` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `produtos_codProdutos`),
  INDEX `fk_pedidos_produtos1_idx` (`produtos_codProdutos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_produtos1`
    FOREIGN KEY (`produtos_codProdutos`)
    REFERENCES `mydb`.`produtos` (`codProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`vendas` (
  `nota_fiscal` VARCHAR(20) NOT NULL,
  `comprovante` VARCHAR(20) NULL,
  `pedidos_id_pedidos` VARCHAR(20) NULL,
  `` VARCHAR(45) NULL,
  `pedidos_idPedido` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nota_fiscal`, `pedidos_idPedido`),
  INDEX `fk_vendas_pedidos1_idx` (`pedidos_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_vendas_pedidos1`
    FOREIGN KEY (`pedidos_idPedido`)
    REFERENCES `mydb`.`pedidos` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
