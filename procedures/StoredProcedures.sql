
--Stored procedure que cria um evento--------------------------------
CREATE PROCEDURE CriarEvento (
    @nomeEvento VARCHAR(50),
    @data_hora DATETIME,
    @localEvento VARCHAR(50), 
    @descricaoEvento VARCHAR(100),
    @lotacao_max INT,
    @id_organizador INT
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
        INSERT INTO EventPro.Evento (id, nome, descrição, localização, lotação_máx, data_hora, id_organizador)
        VALUES (@novo_id, @nomeEvento, @descricaoEvento, @localEvento, @lotacao_max, @data_hora,  @id_organizador);

    END TRY
    BEGIN CATCH
        SET @erro = ERROR_MESSAGE();
        RAISERROR(@erro, 16, 1);
    END CATCH
END;

-----inacabado----------------------------------------------


--Stored procedure que vai vê o email do organizador que efetuou login e procura o seu id
CREATE PROCEDURE OrganizadorID (
    @email VARCHAR(100)
)
AS
BEGIN
    DECLARE @id_organizador INT;
    DECLARE @erro VARCHAR(100);

    BEGIN TRY
        -- Verificar se o email existe
        IF NOT EXISTS (SELECT 1 FROM EventPro.Organizador WHERE num_CC = (SELECT num_CC FROM EventPro.Pessoa WHERE email = @email))
        BEGIN
            RAISERROR('O email não existe', 16, 1);
            RETURN;
        END

        -- Obter o id do organizador
        SELECT @id_organizador = id FROM EventPro.Organizador WHERE num_CC = (SELECT num_CC FROM EventPro.Pessoa WHERE email = @email);

        -- Retornar o id do organizador
        SELECT @id_organizador;

    END TRY
    BEGIN CATCH
        SET @erro = ERROR_MESSAGE();
        RAISERROR(@erro, 16, 1);
    END CATCH
END;



---Ficheiros de stored procedures eliminados: 
-------Adicionar_Trab.sql 
------pagamento_colab.sql
------ pagamento_part.sql 
