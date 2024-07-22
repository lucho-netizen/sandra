DELIMITER $$

CREATE PROCEDURE `ps_diagnostico` ()
BEGIN
SELECT 
    u.nombre,
    d.edad,
    d.id_role,
	r.nombre_resultado,
    s.sintoma,
    d.id_estado,
    d.fecha_examen
FROM 
    diagnostico d
INNER JOIN 
    resultados r ON d.id_resultado = r.id_resultado INNER join sintomas s on s.id_sintomas = d.id_sintomas inner join usuario u on u.id_user = d.id_user;

END $$

DELIMITER ;
