
/* punto 1 */ 

SELECT *
FROM Cliente c 
where apellido LIKE "pe%"

/* punto 2 */

SELECT c.DNI, c.apellido, c.nombre, c.telefono, c.direccion
FROM Cliente c INNER JOIN Factura f ON Factura.idCliente = Cliente.idCliente
WHERE c.idCliente NOT IN (
    SELECT c.idCliente
    FROM Cliente c INNER JOIN Factura f ON f.idCliente = c.idCliente
    WHERE (f.fecha < 01/01/2017 and f.fecha > 31/12/2017)
)

/* punto 3 */

SELECT p.nombre, p.descripcion, p.precio, p.stock
FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket 
INNER JOIN Producto p ON d.idProducto = p.idProducto 
WHERE c.DNI = "45789456" and c.DNI NOT IN (
    SELECT c.DNI
    FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
    INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
    INNER JOIN Producto p ON d.idProducto = p.idProducto
    WHERE c.apellido = "Garcia"
)

/* punto 4 */

SELECT p.nombre, p.descripcion, p.precio, p.stock
FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
INNER JOIN Producto p ON d.idProducto = p.idProducto
WHERE c.telefono NOT LIKE "221%"
ORDER BY p.nombre

/* punto 5 */ 

SELECT p.nombre, p.descripcion, p.precio, SUM(d.cantidad) 
FROM Producto p INNER JOIN Detalle d ON p.idProducto = d.idProducto
GROUP BY p.nombre, p.descripcion, p.precio 



/* punto 6 */

SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion 
FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
INNER JOIN Producto p ON d.idProducto = p.idProducto
WHERE p.nombre = 'prod1' AND EXISTS(

    SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
    FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
    INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
    INNER JOIN Producto p ON d.idProducto = p.idProducto
    WHERE p.nombre = 'prod2'


)AND NOT EXISTS (
    SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
    FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
    INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
    INNER JOIN Producto p ON d.idProducto = p.idProducto
    WHERE p.nombre = 'prod3'
)

/* PUNTO 7 */

SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI 
FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket 
INNER JOIN Producto p ON d.idProducto = p.idProducto
WHERE nombreP = 'prod38' OR  (fecha < 1/1/2020 and fecha > 31/12/2018) 


/* punto 8 */

INSERT INTO Cliente (idCliente, nombre, apellido, DNI, telfono, direccion)
VALUES (500002,'JORGE LUIS','CASTOR',40578999,2214400789,'11 entre 500 y 501 nro: 2587')


/* punto 9 */

SELECT nroTicket, total, fecha, hora
FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
INNER JOIN Producto p ON d.idProducto = p.idProducto
WHERE nombre = 'Jorge' and apellido ='Perez' and NOT EXISTS (
    SELECT * 
    FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
    INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
    INNER JOIN Producto p ON d.idProducto = p.idProducto
    WHERE nombreP = 'Z'
)

/* punto 10 */

SELECT DNI, apellido, nombre
FROM Cliente c INNER JOIN Factura f ON c.idCliente = f.idCliente
GROUP BY DNI, apellido, nombre 
HAVING SUM(total) > 10000000

