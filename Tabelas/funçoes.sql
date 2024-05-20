
--eventos que vao ocorrer numa certa localidade
--para testar
--SELECT *
--FROM GetEventosPorLocalizacao('Porto');


CREATE FUNCTION GetEventosPorLocalizacao
(
    @localizacao VARCHAR(255)
)
RETURNS TABLE
AS
RETURN
(
    SELECT id, nome, descrição, custo_previsto, localização, lotação_máx, data_hora
    FROM Evento
    WHERE localização = @localizacao
      AND data_hora > GETDATE() -- Considera apenas eventos futuros
);
GO

-- Contar Colaboradores em um Evento
--SELECT dbo.QuantidadeDeColaboradoresPorEvento(1) AS NumColaboradores;  -- Assumindo que o ID do evento seja 1

CREATE FUNCTION QuantidadeDeColaboradoresPorEvento
(
    @id_evento INT
)
RETURNS INT
AS
BEGIN
    DECLARE @quantidade INT;

    SELECT @quantidade = COUNT(*)
    FROM Colaborador
    WHERE id_evento = @id_evento;

    RETURN @quantidade;
END;
GO

--Contar Colaboradores de um Tipo Específico em um Evento
--SELECT dbo.QuantidadeDeColaboradoresPorTipoEmEvento(1, 'COMIDA') AS NumColaboradoresComida;  


CREATE FUNCTION QuantidadeDeColaboradoresPorTipoEmEvento
(
    @id_evento INT,
    @tipo VARCHAR(255)
)
RETURNS INT
AS
BEGIN
    DECLARE @quantidade INT;

    SELECT @quantidade = COUNT(*)
    FROM Colaborador
    WHERE id_evento = @id_evento
      AND tipo = @tipo;

    RETURN @quantidade;
END;
GO


--Calcular o Valor Total dos Bilhetes de um Evento
--SELECT dbo.ValorTotalBilhetesPorEvento(1) AS ValorTotalBilhetes;  -- Assumindo que o ID do evento seja 1


CREATE FUNCTION ValorTotalBilhetesPorEvento
(
    @id_evento INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @valor_total DECIMAL(10,2);

    SELECT @valor_total = ISNULL(SUM(preço), 0)
    FROM Bilhete
    WHERE id_evento = @id_evento;

    RETURN @valor_total;
END;
