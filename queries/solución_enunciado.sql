--Primer punto 
--Agrega columnas denormaizadas a pais
ALTER TABLE Pais
ADD COLUMN MonedaNombre VARCHAR(50),
ADD COLUMN MonedaSigla VARCHAR(10),
ADD COLUMN MonedaImagen VARCHAR(255);
--Compiar los datos desde monedas a pais
UPDATE Pais p
SET 
    MonedaNombre = m.Moneda,
    MonedaSigla = m.Sigla,
    MonedaImagen = m.Imagen
FROM Moneda m
WHERE p.IdMoneda = m.Id;

SELECT *
FROM Pais;





--Segundo punto:
-- Script para agregar campos de URL de imagen del Mapa y la Bandera a la tabla PAIS

-- Agrega la columna MapaURL a la tabla PAIS
ALTER TABLE Pais
ADD COLUMN MapaURL VARCHAR(255) NULL;

-- Agrega la columna BanderaURL a la tabla PAIS
ALTER TABLE Pais
ADD COLUMN BanderaURL VARCHAR(255) NULL;

--Consulta tabla pais:
SELECT *
FROM Pais;