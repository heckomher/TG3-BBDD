SELECT * FROM telovendo.clientes;
-- A
INSERT INTO vendedores (run, nombres, primer_ape, segundo_ape, fecha_nac, seccion, salario) VALUES
    ('98765433-2', 'Juan', 'Pérez', 'Gómez', '1990-05-15', 'Electrónica', 250000),
    ('98765422-1', 'María', 'López', 'González', '1985-08-20', 'Ropa', 300000),
    ('45678912-3', 'Pedro', 'Martínez', 'Rodríguez', '1992-02-10', 'Hogar', 280000),
    ('78912345-6', 'Laura', 'Sánchez', 'Fernández', '1998-11-28', 'Electrónica', 270000),
    ('23456789-0', 'Carlos', 'García', 'Hernández', '1994-07-03', 'Ropa', 320000);
-- C
INSERT INTO productos (id ,nombres, categorias, fabricantes, inventario, precio)
VALUES
    (111, 'iPhone 13', 'Electrónica', 'Apple Inc.', 50, 15000),
    (112, 'Samsung Galaxy S21', 'Electrónica', 'Samsung Electronics', 30, 12000),
    (113 ,'MacBook Pro', 'Informática', 'Apple Inc.', 20, 3000000),
    (114 ,'Sony Bravia 4K TV', 'Electrónica', 'Sony Corporation', 15, 20000),
    (115, 'Nike Air Max 270', 'Calzado', 'Nike, Inc.', 100, 1500),
    (116, 'Canon EOS R5', 'Fotografía', 'Canon Inc.', 10, 45000),
    (117, 'Samsung 55" QLED TV', 'Electrónica', 'Samsung Electronics', 25, 18000),
    (118 ,'HP Pavilion Laptop', 'Informática', 'HP Inc.', 40, 10000),
    (119, 'Adidas Ultraboost', 'Calzado', 'Adidas AG', 80, 12000),
    (120, 'Nikon D850', 'Fotografía', 'Nikon Corporation', 5, 40000);

-- D
    SELECT MIN(salario) AS salario_minimo FROM vendedores;
-- E
SELECT MAX(salario) AS salario_maximo FROM vendedores;
-- F
UPDATE vendedores AS v
JOIN (SELECT MIN(salario) AS min_salario FROM vendedores) AS s
SET v.salario = v.salario + s.min_salario;

-- G
DELETE FROM productos
WHERE precio = (
    SELECT max_precio
    FROM (
        SELECT MAX(precio) AS max_precio
        FROM productos
    ) AS t
);
-- H
CREATE TABLE pagos_clientes AS
SELECT *
FROM clientes
WHERE id IN (
  SELECT id
  FROM clientes
  GROUP BY id
  HAVING SUM(total_pagado) > (SELECT AVG(total_pagado) FROM clientes)
);

-- I 

UPDATE `telovendo`.`productos` SET `nombres` = 'Pelota de fútbol blanca' WHERE (`id` = '108');
UPDATE `telovendo`.`productos` SET `categorias` = 'Equipaje deportivo' WHERE (`id` = '107');
UPDATE `telovendo`.`productos` SET `inventario` = '45' WHERE (`id` = '106');

-- J
UPDATE `telovendo`.`vendedores` SET `fecha_nac` = '1992-02-11', `seccion` = 'Línea blanca' WHERE (`run` = '45678912-3');
UPDATE `telovendo`.`vendedores` SET `nombres` = 'Macarena' WHERE (`run` = '55443322-1');
UPDATE `telovendo`.`vendedores` SET `nombres` = 'Carla' WHERE (`run` = '23456789-0');

-- K 
UPDATE `telovendo`.`clientes` SET `nombres` = 'Esteban', `telefono` = '123256789', `email` = 'juan.perezmilla@email.com', `total_pagado` = '5843' WHERE (`id` = '1');

-- L 
SELECT nombres, primer_ape
FROM vendedores
WHERE salario > (SELECT AVG(salario) FROM vendedores);

-- M
SELECT id , nombres, primer_ape , segundo_ape
FROM clientes
WHERE total_pagado in (SELECT max(total_pagado) FROM clientes);
