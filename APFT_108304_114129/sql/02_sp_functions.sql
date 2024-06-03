CREATE PROCEDURE sp_GetTotalColaboradoresPrice
    @EventId INT
AS
BEGIN
    SELECT SUM(c.custo_participação) AS TotalColaboradores
    FROM EventPro.Colaborador c
    WHERE c.id_evento = @EventId;
END
GO

CREATE PROCEDURE sp_GetTotalBilhetesPrice
    @EventId INT
AS
BEGIN
    SELECT SUM(pb.valor) AS TotalBilhetes
    FROM EventPro.Pagamento_Bilhete pb
    INNER JOIN EventPro.Bilhete b ON pb.id_bilhete = b.id
    WHERE b.id_evento = @EventId;
END
GO

CREATE PROCEDURE sp_GetEventLotacao
    @EventId INT
AS
BEGIN
    SELECT e.lotação_máx, COUNT(DISTINCT pb.id_participa) AS TotalParticipantes
    FROM EventPro.Evento e
    LEFT JOIN EventPro.Bilhete b ON e.id = b.id_evento
    LEFT JOIN EventPro.Pagamento_Bilhete pb ON b.id = pb.id_bilhete
    WHERE e.id = @EventId
    GROUP BY e.lotação_máx;
END
GO