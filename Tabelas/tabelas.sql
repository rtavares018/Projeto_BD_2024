-- Creating the Pessoa table
CREATE TABLE Pessoa (
    num_CC CHAR(9) PRIMARY KEY,
    nome VARCHAR(100),
    morada VARCHAR(255),
    telemovel VARCHAR(255),
    data_nasci DATE,
    email VARCHAR(100)
);

-- Creating the Trabalhador table
CREATE TABLE Trabalhador (
    num_CC CHAR(9),
    função VARCHAR(255),
    id INT PRIMARY KEY,
    FOREIGN KEY (num_CC) REFERENCES Pessoa(num_CC)
);

-- Creating the Participante table
CREATE TABLE Participante (
    num_CC CHAR(9),
    id INT PRIMARY KEY,
    FOREIGN KEY (num_CC) REFERENCES Pessoa(num_CC)
);

-- Creating the Organizador table
CREATE TABLE Organizador (
    num_CC CHAR(9),
    id INT PRIMARY KEY,
    FOREIGN KEY (num_CC) REFERENCES Pessoa(num_CC)
);
-- Creating the Evento table
CREATE TABLE Evento (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    descrição VARCHAR(255),
    custo_previsto DECIMAL(10,2),
    localização VARCHAR(255),
    lotação_máx INT,
    data_hora DATETIME
);

-- Criar um índice clusterizado na coluna data_hora
CREATE INDEX idx_evento_data_hora ON Evento(data_hora);

-- Índice para agrupamento por localização em Evento
CREATE INDEX idx_evento_localizacao ON Evento(localização);

-- Creating the Bilhete table
CREATE TABLE Bilhete (
    id INT PRIMARY KEY,
    tipo VARCHAR(255),
    preço DECIMAL(10,2),
    id_evento INT,
    id_participa INT,
    FOREIGN KEY (id_evento) REFERENCES Evento(id),
    FOREIGN KEY (id_participa) REFERENCES Participante(id)
);

-- Índice para ordenação e agrupamento por preço em Bilhete
CREATE INDEX idx_bilhete_preco ON Bilhete(preço);


-- Creating the Colaborador table
CREATE TABLE Colaborador (
    id INT PRIMARY KEY,
    nome_loja VARCHAR(255),
    tipo VARCHAR(255),
    custo_participação DECIMAL(10,2),
    id_evento INT,
    FOREIGN KEY (id_evento) REFERENCES Evento(id)
);
-- Índice para agrupamento por tipo em Colaborador
CREATE INDEX idx_colaborador_tipo ON Colaborador(tipo);


-- Creating the Pagamento table
CREATE TABLE Pagamento (
    id INT  PRIMARY KEY,
    data DATE,
    valor DECIMAL(10,2),
    tipo VARCHAR(255),
    id_colabo INT,
    id_participa INT,
    FOREIGN KEY (id_colabo) REFERENCES Colaborador(id),
    FOREIGN KEY (id_participa) REFERENCES Participante(id)
);
-- Índice para ordenação por data em Pagamento
CREATE INDEX idx_pagamento_data ON Pagamento(data);

-- Índice para agrupamento por tipo de pagamento em Pagamento
CREATE INDEX idx_pagamento_tipo ON Pagamento(tipo);

-- Creating the Tem table
CREATE TABLE Tem (
    id_evento INT,
    id_colaboradores INT,
    FOREIGN KEY (id_evento) REFERENCES Evento(id),
    FOREIGN KEY (id_colaboradores) REFERENCES Colaborador(id)
);
