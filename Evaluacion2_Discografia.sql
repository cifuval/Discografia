-- A:
SELECT Cancion.Titulo AS 'Titulo',
       Cancion.Id
FROM Cancion
INNER JOIN Compositor ON Cancion.Id = Compositor.Id
WHERE CHARINDEX('JUANES', Compositor.Nombre) > 0

--B:
SELECT Cancion.Titulo AS 'Nombre',
	   Interpretacion.Duracion AS 'Duracion',
	   Interprete.Nombre AS 'Interprete',
	   Ritmo.Ritmo AS 'Ritmo'
FROM Cancion
INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
INNER JOIN Ritmo ON Interpretacion.IdRitmo = Ritmo.Id
INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
Where Cancion.Titulo = 'Lluvia'

--C:
SELECT Cancion.Titulo AS 'Nombre',
		  Interprete.Nombre AS 'Interprete',
		  Ritmo.Ritmo AS 'Ritmo'
	FROM Cancion
	INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
	INNER JOIN Ritmo ON Interpretacion.IdRitmo=Ritmo.Id
	INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
	Where Ritmo.Ritmo = 'Balada'
	AND Interprete.Nombre IN (
		Select Interprete.Nombre
		FROM Cancion
		INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
		INNER JOIN Ritmo ON Interpretacion.IdRitmo=Ritmo.Id
		INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
		Where Ritmo.Ritmo = 'Balada'
		Group BY Interprete.Nombre
		HAVING COUNT (DISTINCT Cancion.Titulo)>1
	)

--D:
Select Ritmo.Ritmo AS 'Ritmo',
	   Pais.Pais AS 'Pais',
	   COUNT(DISTINCT Cancion.Titulo) AS '#'
FROM Cancion
INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
INNER JOIN Ritmo ON Interpretacion.IdRitmo = Ritmo.Id
INNER JOIN Pais ON Interprete.IdPais = Pais.Id
Where Ritmo.Ritmo = 'Salsa'
GROUP BY Ritmo.Ritmo,Pais.Pais
HAVING COUNT ( DISTINCT Cancion.Titulo)>1

--E:
Select Cancion.Titulo AS 'Titulo',
		Interprete.Nombre AS 'Interprete'
from Cancion
INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
Where Cancion.Titulo = 'Candilejas' 

UNION

Select Cancion.Titulo AS 'Titulo',
		Interprete.Nombre AS 'Interprete'
from Cancion
INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
Where Cancion.Titulo = 'Malaguena' 

--F:
SELECT Interprete.Nombre AS 'Cantautor',
	   Cancion.Titulo AS 'Cancion'
FROM Cancion
INNER JOIN Compositor ON Cancion.Id = Compositor.Id
INNER JOIN Interpretacion ON Cancion.Id = Interpretacion.IdCancion
INNER JOIN Interprete ON Interpretacion.IdInterprete = Interprete.Id
WHERE Interprete.Id = Compositor.Id