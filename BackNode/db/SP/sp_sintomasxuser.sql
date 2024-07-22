create PROCEDURE `sp_sintomasxuser`()
BEGIN
    INSERT INTO sintomasxuser (id_user, id_sintomas)
    SELECT 
        d.id_user,
        d.id_sintomas
    FROM 
        diagnostico d;
        -- Mostrar el contenido de la tabla sintomasxuser
    SELECT * FROM sintomasxuser;
END