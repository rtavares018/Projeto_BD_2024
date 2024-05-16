-- Insert data into Pessoa table
INSERT INTO Pessoa (num_CC, nome, morada, telemovel, data_nasci, email, password_) VALUES
('123456789', 'João Silva', 'Rua A, 123', '912345678', '1980-05-21', 'joao.silva@example.com', 'password123'),
('987654321', 'Maria Santos', 'Avenida B, 456', '919876543', '1990-08-15', 'maria.santos@example.com', 'password456'),
('234567890', 'Ana Pereira', 'Rua C, 789', '915678234', '1985-11-30', 'ana.pereira@example.com', 'password789'),
('345678901', 'Carlos Lima', 'Avenida D, 321', '913456789', '1975-02-10', 'carlos.lima@example.com', 'password101'),
('456789012', 'Pedro Almeida', 'Rua E, 987', '916789345', '1982-09-18', 'pedro.almeida@example.com', 'password102'),
('567890123', 'Luis Matos', 'Rua F, 654', '917890456', '1983-03-22', 'luis.matos@example.com', 'password103');

-- Insert data into Trabalhador table
INSERT INTO Trabalhador (num_CC, função, id) VALUES
('234567890', 'Cantor', 1),
('456789012', 'Segurança', 2);

-- Insert data into Participante table
INSERT INTO Participante (num_CC, id) VALUES
('987654321', 1),
('345678901', 2);

-- Insert data into Organizador table
INSERT INTO Organizador (num_CC, id, id_evento) VALUES
('123456789', 1, 1),
('567890123', 2, 2);

-- Insert data into Evento table
INSERT INTO Evento (id, nome, descrição, custo_previsto, localização, lotação_máx, data_hora) VALUES
(1, 'Concerto de Verão', 'Concerto ao ar livre com várias bandas.', 1500.00, 'Parque Central', 500, '2024-07-15 20:00:00'),
(2, 'Feira de Inverno', 'Feira com diversas barraquinhas e atividades.', 2000.00, 'Centro da Cidade', 1000, '2024-12-05 10:00:00');

-- Insert data into Bilhete table
INSERT INTO Bilhete (id, tipo, preço, id_evento, id_participa) VALUES
(1, 'VIP', 50.00, 1, 1),
(2, 'Regular', 20.00, 1, 2);

-- Insert data into Colaborador table
INSERT INTO Colaborador (id, nome_loja, tipo, custo_participação, id_evento) VALUES
(1, 'Loja A', 'Vendedor', 100.00, 1),
(2, 'Loja B', 'Patrocinador', 500.00, 2);

-- Insert data into Pagamento_Bilhete table
INSERT INTO Pagamento_Bilhete (id, data, valor, tipo, id_bilhete, id_participa) VALUES
(1, '2024-06-01', 50.00, 'Transferência', 1, 1),
(2, '2024-06-15', 20.00, 'Cartão de Crédito', 2, 2);

-- Insert data into Pagamento_Colaborador table
INSERT INTO Pagamento_Colaborador (id, data, valor, tipo, id_colabo) VALUES
(1, '2024-06-01', 100.00, 'Transferência', 1),
(2, '2024-06-15', 500.00, 'Cartão de Crédito', 2);

-- Insert data into Tem table
INSERT INTO Tem (id_evento, id_colaboradores) VALUES
(1, 1),
(2, 2);
