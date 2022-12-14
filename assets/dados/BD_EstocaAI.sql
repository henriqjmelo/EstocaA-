CREATE DATABASE  IF NOT EXISTS `estocaai` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estocaai`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: estocaai
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_CLIENTE` int NOT NULL,
  `NOME_CLIENTE` varchar(45) DEFAULT NULL,
  `EMAIL_CLIENTE` varchar(45) DEFAULT NULL,
  `CPF_CLIENTE` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `ID_COMPRA` int NOT NULL,
  `ID_FORNECEDOR` int DEFAULT NULL,
  `ID_NOTA_FISCAL` int DEFAULT NULL,
  `ID_SOLICITACAO` int DEFAULT NULL,
  PRIMARY KEY (`ID_COMPRA`),
  KEY `ID_FORNECEDOR_COMPRA_idx` (`ID_FORNECEDOR`),
  KEY `ID_NOTA_FISCAL_COMPRA_idx` (`ID_NOTA_FISCAL`),
  KEY `ID_SOLICITACAO_COMPRA_idx` (`ID_SOLICITACAO`),
  CONSTRAINT `ID_FORNECEDOR_COMPRA` FOREIGN KEY (`ID_FORNECEDOR`) REFERENCES `fornecedor` (`ID_FORNECEDOR`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_NOTA_FISCAL_COMPRA` FOREIGN KEY (`ID_NOTA_FISCAL`) REFERENCES `nota_fiscal` (`ID_NOTA_FISCAL`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_SOLICITACAO_COMPRA` FOREIGN KEY (`ID_SOLICITACAO`) REFERENCES `solicitacoes_compra` (`ID_SOLICITACAO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `ID_EMPRESA` int NOT NULL,
  `NOME_EMPRESA` varchar(45) DEFAULT NULL,
  `CNPJ_EMPRESA` varchar(14) DEFAULT NULL,
  `EMAIL_EMPRESA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRESA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco_empresa`
--

DROP TABLE IF EXISTS `endereco_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_empresa` (
  `ID_EMPRESA` int NOT NULL,
  `CEP_EMPRESA` int NOT NULL,
  `LOGRADOURO_EMPRESA` varchar(45) DEFAULT NULL,
  `NUMERO_EMPRESA` varchar(45) DEFAULT NULL,
  `BAIRRO_EMPRESA` varchar(45) DEFAULT NULL,
  `CIDADE_EMPRESA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRESA`,`CEP_EMPRESA`),
  CONSTRAINT `ID_EMPRESA_ENDERECO` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco_fornecedor`
--

DROP TABLE IF EXISTS `endereco_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_fornecedor` (
  `ID_FORNECEDOR` int NOT NULL,
  `CEP_FORNECEDOR` int NOT NULL,
  `LOGRADOURO_FORNECEDOR` varchar(45) DEFAULT NULL,
  `NUMERO_FORNECEDOR` smallint DEFAULT NULL,
  `BAIRRO_FORNECEDOR` varchar(45) DEFAULT NULL,
  `CIDADE_FORNECEDOR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_FORNECEDOR`,`CEP_FORNECEDOR`),
  CONSTRAINT `ID_FORNECEDOR_ENDERECO` FOREIGN KEY (`ID_FORNECEDOR`) REFERENCES `fornecedor` (`ID_FORNECEDOR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco_funcionario`
--

DROP TABLE IF EXISTS `endereco_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_funcionario` (
  `ID_FUNCIONARIO` int NOT NULL,
  `CEP_FUNCIONARIO` int NOT NULL,
  `LOGRADOURO_FUNCIONARIO` varchar(45) DEFAULT NULL,
  `NUMERO_FUNCIONARIO` smallint DEFAULT NULL,
  `BAIRRO_FUNCIONARIO` varchar(45) DEFAULT NULL,
  `CIDADE_FUNCIONARIO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`,`CEP_FUNCIONARIO`),
  KEY `ID_FUNCIONARIO_ENDERECO_idx` (`ID_FUNCIONARIO`),
  CONSTRAINT `ID_FUNCIONARIO_ENDERECO` FOREIGN KEY (`ID_FUNCIONARIO`) REFERENCES `funcionario` (`ID_FUNCIONARIO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `ID_FORNECEDOR` int NOT NULL,
  `NOME_FORNECEDOR` varchar(45) DEFAULT NULL,
  `CNPJ_FORNECEDOR` varchar(14) DEFAULT NULL,
  `EMAIL_FORNECEDOR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_FORNECEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `ID_FUNCIONARIO` int NOT NULL,
  `ID_EMPRESA` int DEFAULT NULL,
  `ID_TIPO` binary(4) DEFAULT NULL,
  `NOME_FUNCIONARIO` varchar(45) DEFAULT NULL,
  `CPF_FUNCIONARIO` varchar(45) DEFAULT NULL,
  `SENHA_FUNCIONARIO` varchar(45) DEFAULT NULL,
  `EMAIL_FUNCIONARIO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`),
  KEY `ID_TIPO_FUNCIONARIO_idx` (`ID_TIPO`),
  KEY `ID_EMPRESA_FUNCIONARIO_idx` (`ID_EMPRESA`),
  CONSTRAINT `ID_EMPRESA_FUNCIONARIO` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ID_TIPO_FUNCIONARIO` FOREIGN KEY (`ID_TIPO`) REFERENCES `tipo_funcionario` (`ID_TIPO`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_nota`
--

DROP TABLE IF EXISTS `item_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_nota` (
  `ID_ITEM_NOTA` int NOT NULL,
  `ID_PRODUTO` int DEFAULT NULL,
  `QUANTIDADE_DE_ITENS` smallint DEFAULT NULL,
  PRIMARY KEY (`ID_ITEM_NOTA`),
  KEY `ID_PRODUTO_ITEM_NOTA_idx` (`ID_PRODUTO`),
  CONSTRAINT `ID_PRODUTO_ITEM_NOTA` FOREIGN KEY (`ID_PRODUTO`) REFERENCES `produto` (`ID_PRODUTO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal` (
  `ID_NOTA_FISCAL` int NOT NULL,
  `ID_EMPRESA` int DEFAULT NULL,
  `VALOR_NOTA` double DEFAULT NULL,
  `DATA_NOTA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_NOTA_FISCAL`),
  KEY `ID_EMPRESA_NF_idx` (`ID_EMPRESA`),
  CONSTRAINT `ID_EMPRESA_NF` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `ID_PRODUTO` int NOT NULL,
  `ID_EMPRESA` int DEFAULT NULL,
  `NOME_PRODUTO` varchar(45) DEFAULT NULL,
  `QUANTIDADE_EM_ESTOQUE` smallint DEFAULT NULL,
  `QTD_MINIMA_EM_ESTOQUE` tinyint DEFAULT NULL,
  `DESCRICAO_PRODUTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUTO`),
  KEY `ID_EMPRESA_PRODUTO_idx` (`ID_EMPRESA`),
  CONSTRAINT `ID_EMPRESA_PRODUTO` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto_unitario`
--

DROP TABLE IF EXISTS `produto_unitario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_unitario` (
  `ID_PROD_UNITARIO` int NOT NULL,
  `ID_FORNECEDOR` int DEFAULT NULL,
  `ID_PRODUTO` int DEFAULT NULL,
  `ID_FUNCIONARIO` int DEFAULT NULL,
  `LOTE_PRODUTO` smallint DEFAULT NULL,
  `DATA_VALIDADE` date DEFAULT NULL,
  `DATA_FABRICACAO` date DEFAULT NULL,
  PRIMARY KEY (`ID_PROD_UNITARIO`),
  KEY `ID_FORNECEDOR_PU_idx` (`ID_FORNECEDOR`),
  KEY `ID_PRODUTO_PU_idX` (`ID_PRODUTO`),
  KEY `ID_FUNCIONARIO_PU_idx` (`ID_FUNCIONARIO`),
  CONSTRAINT `ID_FORNECEDOR_PU` FOREIGN KEY (`ID_FORNECEDOR`) REFERENCES `fornecedor` (`ID_FORNECEDOR`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_FUNCIONARIO_PU` FOREIGN KEY (`ID_FUNCIONARIO`) REFERENCES `funcionario` (`ID_FUNCIONARIO`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_PRODUTO_PU` FOREIGN KEY (`ID_PRODUTO`) REFERENCES `produto` (`ID_PRODUTO`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitacoes_compra`
--

DROP TABLE IF EXISTS `solicitacoes_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitacoes_compra` (
  `ID_SOLICITACAO` int NOT NULL,
  `ID_FUNCIONARIO` int DEFAULT NULL,
  `STATUS_SOLICITACAO` varchar(9) DEFAULT NULL,
  `DATA_SOLICITACAO` date DEFAULT NULL,
  `DESCRICAO_SOLICITACAO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_SOLICITACAO`),
  KEY `ID_FUNCIONARIO_SOLICITACAO_idx` (`ID_FUNCIONARIO`),
  CONSTRAINT `ID_FUNCIONARIO_SOLICITACAO` FOREIGN KEY (`ID_FUNCIONARIO`) REFERENCES `funcionario` (`ID_FUNCIONARIO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_cliente`
--

DROP TABLE IF EXISTS `telefone_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_cliente` (
  `ID_CLIENTE` int NOT NULL,
  `TELEFONE_CLIENTE` int NOT NULL,
  `DESCRICAO_TEL_CLIENTE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`,`TELEFONE_CLIENTE`),
  CONSTRAINT `ID_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_empresa`
--

DROP TABLE IF EXISTS `telefone_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_empresa` (
  `ID_EMPRESA` int NOT NULL,
  `TELEFONE_EMPRESA` int NOT NULL,
  `DESCRICAO_TEL_EMPRESA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRESA`,`TELEFONE_EMPRESA`),
  CONSTRAINT `ID_EMPRESA_TELEFONE` FOREIGN KEY (`ID_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_fornecedor`
--

DROP TABLE IF EXISTS `telefone_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_fornecedor` (
  `ID_FORNECEDOR` int NOT NULL,
  `TELEFONE_FORNECEDOR` int NOT NULL,
  `DESCRICAO_TEL_FORNECEDOR` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_FORNECEDOR`,`TELEFONE_FORNECEDOR`),
  CONSTRAINT `ID_FORNECEDOR_TELEFONE` FOREIGN KEY (`ID_FORNECEDOR`) REFERENCES `fornecedor` (`ID_FORNECEDOR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_funcionario`
--

DROP TABLE IF EXISTS `telefone_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_funcionario` (
  `ID_FUNCIONARIO` int NOT NULL,
  `TELEFONE_FUNCIONARIO` int NOT NULL,
  `DESCRICAO_TEL_FUNCIONARIO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`,`TELEFONE_FUNCIONARIO`),
  KEY `ID_FUNCIONARIO_TELEFONE_idx` (`ID_FUNCIONARIO`),
  CONSTRAINT `ID_FUNCIONARIO_TELEFONE` FOREIGN KEY (`ID_FUNCIONARIO`) REFERENCES `funcionario` (`ID_FUNCIONARIO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_funcionario`
--

DROP TABLE IF EXISTS `tipo_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_funcionario` (
  `ID_TIPO` binary(4) NOT NULL,
  `DESCRICAO_TIPO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `ID_VENDA` int NOT NULL,
  `ID_CLIENTE` int DEFAULT NULL,
  `ID_NOTA_FISCAL` int DEFAULT NULL,
  PRIMARY KEY (`ID_VENDA`),
  KEY `ID_CLIENTE_VENDA_idx` (`ID_CLIENTE`),
  KEY `ID_NOTA_FISCAL_VENDA_idx` (`ID_NOTA_FISCAL`),
  CONSTRAINT `ID_CLIENTE_VENDA` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_NOTA_FISCAL_VENDA` FOREIGN KEY (`ID_NOTA_FISCAL`) REFERENCES `nota_fiscal` (`ID_NOTA_FISCAL`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 12:06:11
