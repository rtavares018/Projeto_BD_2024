CREATE TRIGGER trgHashPassword
ON EventPro.Pessoa
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inserção de novos registros com hash de senha
    INSERT INTO EventPro.Pessoa (num_CC, nome, morada, telemovel, data_nasci, email, password_)
    SELECT 
        num_CC, 
        nome, 
        morada, 
        telemovel, 
        data_nasci, 
        email, 
        CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', password_), 2)
    FROM inserted;
END;
GO


CREATE TRIGGER trgHashCodigo
ON EventPro.Colaborador
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inserção de novos registros com hash do código
    INSERT INTO EventPro.Colaborador (id, nome_loja, tipo, custo_participação, id_evento, codigo)
    SELECT 
        id,
        nome_loja,
        tipo,
        custo_participação,
        id_evento,
        CONVERT(VARCHAR(255), HASHBYTES('SHA2_256', codigo), 2)
    FROM inserted;
END;
GO