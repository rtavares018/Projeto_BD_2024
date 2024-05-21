
--Stored procedure que cria um evento--------------------------------
CREATE PROCEDURE CriarEvento (
    @nomeEvento VARCHAR(50),
    @data_hora DATETIME,
    @localEvento VARCHAR(50), 
    @descricaoEvento VARCHAR(100),
    @lotacao_max INT,
    @custo_previsto DECIMAL(10,2)
)
AS 
BEGIN 
    DECLARE @novo_id INT;
    DECLARE @erro VARCHAR(100);

    BEGIN TRY
        -- Calcular o próximo id_evento
        SELECT @novo_id = ISNULL(MAX(id), 0) + 1 FROM EventPro.Evento;

         -- Verificar se o nome do evento já existe
        IF EXISTS (SELECT 1 FROM EventPro.Evento WHERE nome = @nomeEvento)
        BEGIN
            RAISERROR('O nome do evento já existe', 16, 1);
            RETURN;
        END

        -- Inserir o evento na tabela Evento
        INSERT INTO EventPro.Evento (id, nome, descrição, custo_previsto, localização, lotação_máx, data_hora)
        VALUES (@novo_id, @nomeEvento, @descricaoEvento, @custo_previsto, @localEvento, @lotacao_max, @data_hora);

    END TRY
    BEGIN CATCH
        SET @erro = ERROR_MESSAGE();
        RAISERROR(@erro, 16, 1);
    END CATCH
END;

-----inacabado----------------------------------------------




---Ficheiros de stored procedures eliminados: 
-------Adicionar_Trab.sql 
------pagamento_colab.sql
------ pagamento_part.sql 
