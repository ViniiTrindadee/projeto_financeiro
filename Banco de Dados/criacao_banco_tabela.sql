CREATE DATABASE bd_financeiro;
GO

USE bd_financeiro;
GO

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    email NVARCHAR(150) NULL,
    cpf NVARCHAR(20) NULL
);

CREATE TABLE empresas (
    id_empresa INT PRIMARY KEY,
    nome_fantasia NVARCHAR(150) NOT NULL,
    cnpj NVARCHAR(20) NULL,
    data_fundacao DATE NULL
);

CREATE TABLE despesas (
    id_despesa INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    id_cliente INT NOT NULL,
    categoria NVARCHAR(100) NULL,
    valor DECIMAL(18,2) NULL,
    data DATE NULL,
    descricao NVARCHAR(255) NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE orcamentos (
    id_orcamento INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    ano INT NOT NULL,
    mes INT NOT NULL,
    tipo NVARCHAR(100) NULL,
    valor_estimado DECIMAL(18,2) NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

CREATE TABLE receitas (
    id_receita INT PRIMARY KEY,
    id_empresa INT NOT NULL,
    id_cliente INT NOT NULL,
    categoria NVARCHAR(100) NULL,
    valor DECIMAL(18,2) NULL,
    data DATE NULL,
    descricao NVARCHAR(255) NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE transferencias (
    id_transferencia INT PRIMARY KEY,
    id_empresa_origem INT NOT NULL,
    id_empresa_destino INT NOT NULL,
    tipo NVARCHAR(100) NULL,
    valor DECIMAL(18,2) NULL,
    data DATE NULL,
    descricao NVARCHAR(255) NULL,
    FOREIGN KEY (id_empresa_origem) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_empresa_destino) REFERENCES empresas(id_empresa)
);
