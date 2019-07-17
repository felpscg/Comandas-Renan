
CREATE DATABASE IF NOT EXISTS `comanda`;
USE `comanda`;

CREATE TABLE IF NOT EXISTS `atendentes` (
  `pkatendente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `datacadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `senha` varchar(50) NOT NULL,
  `fkendereco` int(11) NOT NULL,
  `fktelefone` int(11) NOT NULL,
  PRIMARY KEY (`pkatendente`),
  KEY `fk_aten_endereco` (`fkendereco`),
  KEY `fk_aten_telefone` (`fktelefone`),
  CONSTRAINT `fk_aten_endereco` FOREIGN KEY (`fkendereco`) REFERENCES `enderecos` (`pkendereco`),
  CONSTRAINT `fk_aten_telefone` FOREIGN KEY (`fktelefone`) REFERENCES `telefones` (`pktelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `comandas` (
  `pkcomanda` int(11) NOT NULL AUTO_INCREMENT,
  `numerocomanda` int(11) DEFAULT NULL,
  `quantidadeproduto` int(11) NOT NULL,
  `datacadastrado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fkproduto` int(11) NOT NULL,
  `fkusuario` int(11) NOT NULL,
  PRIMARY KEY (`pkcomanda`),
  KEY `fk_produto` (`fkproduto`),
  KEY `fk_usuario` (`fkusuario`),
  CONSTRAINT `fk_produto` FOREIGN KEY (`fkproduto`) REFERENCES `produtos` (`pkproduto`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`fkusuario`) REFERENCES `usuarios` (`pkusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `empresas` (
  `pkempresa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cnpj` varchar(50) NOT NULL,
  `datacadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `senha` varchar(50) NOT NULL,
  `fkendereco` int(11) NOT NULL,
  `fktelefone` int(11) NOT NULL,
  PRIMARY KEY (`pkempresa`),
  KEY `fk_emp_endereco` (`fkendereco`),
  KEY `fk_emp_telefone` (`fktelefone`),
  CONSTRAINT `fk_emp_endereco` FOREIGN KEY (`fkendereco`) REFERENCES `enderecos` (`pkendereco`),
  CONSTRAINT `fk_emp_telefone` FOREIGN KEY (`fktelefone`) REFERENCES `telefones` (`pktelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `enderecos` (
  `pkendereco` int(11) NOT NULL AUTO_INCREMENT,
  `cep` char(50) NOT NULL,
  `rua` char(50) NOT NULL,
  `numero` char(50) NOT NULL,
  `bairro` char(50) NOT NULL,
  `cidade` char(50) NOT NULL,
  `estado` char(50) NOT NULL,
  PRIMARY KEY (`pkendereco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `mesas` (
  `pkmesa` int(11) NOT NULL AUTO_INCREMENT,
  `numeromesa` int(11) NOT NULL,
  `fkcomanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkmesa`),
  KEY `fk_mesa_comanda` (`fkcomanda`),
  CONSTRAINT `fk_mesa_comanda` FOREIGN KEY (`fkcomanda`) REFERENCES `comandas` (`pkcomanda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `produtos` (
  `pkproduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `estoque` int(11) NOT NULL,
  `preco` double NOT NULL,
  PRIMARY KEY (`pkproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `telefones` (
  `pktelefone` int(11) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(50) NOT NULL,
  PRIMARY KEY (`pktelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `pkusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `rg` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `datanascimento` date NOT NULL,
  `datacadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `senha` varchar(50) NOT NULL,
  `fktelefone` int(11) NOT NULL,
  `fkendereco` int(11) NOT NULL,
  PRIMARY KEY (`pkusuario`),
  KEY `fk_user_endereco` (`fkendereco`),
  KEY `fk_user_telefone` (`fktelefone`),
  CONSTRAINT `fk_user_endereco` FOREIGN KEY (`fkendereco`) REFERENCES `enderecos` (`pkendereco`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_telefone` FOREIGN KEY (`fktelefone`) REFERENCES `telefones` (`pktelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
