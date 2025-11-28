CREATE DATABASE LojaInformatica;
USE LojaInformatica;

-- 1. Tabelas Principais
CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  email VARCHAR(100),
  PRIMARY KEY (id_cliente)
);

CREATE TABLE categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_categoria)
);

CREATE TABLE fornecedor (
  id_fornecedor INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cnpj VARCHAR(20) UNIQUE,
  PRIMARY KEY (id_fornecedor)
);

-- 2. Tabelas com Chave Estrangeira (Filhas)
CREATE TABLE produto (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT DEFAULT 0,
  id_categoria INT NOT NULL,
  id_fornecedor INT NOT NULL,
  PRIMARY KEY (id_produto),
  FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
  FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor)
);

CREATE TABLE pedido (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
  valor_total DECIMAL(10,2),
  id_cliente INT NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

-- 3. Tabela de Ligação (Itens do Pedido)
CREATE TABLE itens_pedido (
  id_item INT NOT NULL AUTO_INCREMENT,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_item),
  FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);