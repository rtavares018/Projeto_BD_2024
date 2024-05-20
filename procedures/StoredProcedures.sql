
--Stored procedure que cria um evento--------------------------------
CREATE PROCEDURE CriarEvento (
    @id_evento INT,
    @nomeEvento VARCHAR(50),
    data_hora DATETIME
    @localEvento VARCHAR(50), 
    @descricaoEvento VARCHAR(100))
    @lotação_máx INT,
    @custo_previsto DECIMAL(10,2)

AS 
BEGIN 

    DECLARE @verification INT;
    DECLARE @erro VARCHAR(100);

    SET @verification = (SELECT dbo.checkId_evento(@id_evento))
    IF (@verification >= 1)
        RAISEERROR('O id do evento já existe', 16, 1)
    ELSE
        BEGIN 
            DECLARE @id_evento INT; 
                SET @id_evento = (SELECT dbo.BuscarId_evento(@nomeEvento))

                BEGIN TRY 
                    INSERT INTO Evento (id, nome, descrição, custo_previsto, localização, lotação_máx, data_hora)
                    VALUES (@id_evento, @nomeEvento, @descricaoEvento, @custo_previsto, @localEvento, @lotação_máx, @data_hora);
                END TRY
                BEGIN CATCH
                    SET @erro = ERROR_MESSAGE();
                    RAISEERROR(@erro, 16, 1) 
                END CATCH 
-----inacabado----------------------------------------------




---Ficheiros de stored procedures eliminados: 
-------Adicionar_Trab.sql 
------pagamento_colab.sql
------ pagamento_part.sql 
