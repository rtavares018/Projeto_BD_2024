CREATE SCHEMA EventPro;
GO

-- Creating the Pessoa table with a password column
CREATE TABLE EventPro.Pessoa (
    num_CC CHAR(9) PRIMARY KEY,
    nome VARCHAR(100),
    morada VARCHAR(255),
    telemovel VARCHAR(255),
    data_nasci DATE,
    email VARCHAR(100),
    password_ VARCHAR(255)
);


-- Creating the Trabalhador table
CREATE TABLE EventPro.Trabalhador (
    num_CC CHAR(9),
    função VARCHAR(255),
    id INT PRIMARY KEY,
    id_evento INT,
    FOREIGN KEY (num_CC) REFERENCES EventPro.Pessoa(num_CC)
);

-- Creating the Participante table
CREATE TABLE EventPro.Participante (
    num_CC CHAR(9),
    id INT PRIMARY KEY,
    id_evento INT,
    FOREIGN KEY (num_CC) REFERENCES EventPro.Pessoa(num_CC)
);

-- Creating the Evento table
CREATE TABLE EventPro.Evento (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    descrição VARCHAR(255),
    localização VARCHAR(255),
    lotação_máx INT,
    data_hora DATETIME,
    id_organizador INT UNIQUE
    FOREIGN KEY (id_organizador) REFERENCES EventPro.Organizador(id),

);

-- Creating the Organizador table with event reference
CREATE TABLE EventPro.Organizador (
    num_CC CHAR(9),
    id INT PRIMARY KEY,
    FOREIGN KEY (num_CC) REFERENCES EventPro.Pessoa(num_CC),
);

-- Criar um índice clusterizado na coluna data_hora
CREATE INDEX idx_evento_data_hora ON EventPro.Evento(data_hora);

-- Índice para agrupamento por localização em Evento
CREATE INDEX idx_evento_localizacao ON EventPro.Evento(localização);

-- Creating the Bilhete table
CREATE TABLE EventPro.Bilhete (
    id INT PRIMARY KEY,
    tipo VARCHAR(255),
    preço DECIMAL(10,2),
    id_evento INT,
    id_participa INT,
    FOREIGN KEY (id_evento) REFERENCES EventPro.Evento(id),
    FOREIGN KEY (id_participa) REFERENCES EventPro.Participante(id)
);

-- Índice para ordenação e agrupamento por preço em Bilhete
CREATE INDEX idx_bilhete_preco ON EventPro.Bilhete(preço);


-- Creating the Colaborador table
CREATE TABLE EventPro.Colaborador (
    id INT PRIMARY KEY,
    nome_loja VARCHAR(255),
    tipo VARCHAR(255),
    custo_participação DECIMAL(10,2),
    id_evento INT,
    FOREIGN KEY (id_evento) REFERENCES EventPro.Evento(id)
);

-- Índice para agrupamento por tipo em Colaborador
CREATE INDEX idx_colaborador_tipo ON EventPro.Colaborador(tipo);




-- Creating the Pagamento_Bilhete table
CREATE TABLE EventPro.Pagamento_Bilhete (
    id INT PRIMARY KEY,
    data DATE,
    valor DECIMAL(10,2),
    tipo VARCHAR(255),
    id_bilhete INT,
    id_participa INT,
    FOREIGN KEY (id_bilhete) REFERENCES EventPro.Bilhete(id),
    FOREIGN KEY (id_participa) REFERENCES EventPro.Participante(id)
);
-- Creating the Pagamento_Colaborador table
CREATE TABLE EventPro.Pagamento_Colaborador (
    id INT PRIMARY KEY,
    data DATE,
    valor DECIMAL(10,2),
    tipo VARCHAR(255),
    id_colabo INT,
    FOREIGN KEY (id_colabo) REFERENCES EventPro.Colaborador(id)
);


-- Creating the Tem table
CREATE TABLE EventPro.Tem (
    id_evento INT,
    id_colaboradores INT,
    FOREIGN KEY (id_evento) REFERENCES EventPro.Evento(id),
    FOREIGN KEY (id_colaboradores) REFERENCES EventPro.Colaboradoro(id) 
);
