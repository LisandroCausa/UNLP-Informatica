

/*
1. Listar datos personales de clientes cuyo apellido comience con el string ‘Pe’. Ordenar por
DNI
*/
SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente
WHERE apellido LIKE "Pe%"
ORDER BY DNI

/*
2. Listar nombre, apellido, DNI, teléfono y dirección de clientes que realizaron compras
solamente durante 2017.
*/
SELECT DISTINCT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c NATURAL JOIN Factura f
WHERE YEAR(f.fecha) = "2017"
EXCEPT
SELECT DISTINCT nombre, apellido, DNI, telefono, direccion
FROM Cliente c NATURAL JOIN Factura f
WHERE YEAR(f.fecha) <> "2017"

/*
3. Listar nombre, descripción, precio y stock de productos vendidos al cliente con
DNI:45789456, pero que no fueron vendidos a clientes de apellido ‘Garcia’.
*/

SELECT nombre, descripcion, precio, stock
FROM Cliente c 
INNER JOIN Factura f  ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d  ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE c.DNI = "45789456" AND p.idProducto NOT IN (SELECT p.idProducto
                                                  FROM Cliente c 
                                                  INNER JOIN Factura f  ON (c.idCliente = f.idCliente)
                                                  INNER JOIN Detalle d  ON (f.nroTicket = d.nroTicket)
                                                  INNER JOIN Producto p ON (d.idProducto = p.idProducto)
                                                  WHERE c.apellido = "Garcia")

/*
4. Listar nombre, descripción, precio y stock de productos no vendidos a clientes que
tengan teléfono con característica: 221 (La característica está al comienzo del teléfono).
Ordenar por nombre.
*/

SELECT nombreP as nombre, descripcion, precio, stock
FROM Producto
WHERE idProducto NOT IN (SELECT p.idProducto
                           FROM Cliente c
                           INNER JOIN Factura f ON (c.idCliente = f.idCliente)
                           INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
                           INNER JOIN Producto p ON (d.idProducto = p.idProducto)
                           WHERE c.telefono LIKE "221%"
                            )
ORDER BY nombreP

/*
5. Listar para cada producto: nombre, descripción, precio y cuantas veces fué vendido.
Tenga en cuenta que puede no haberse vendido nunca el producto.
*/
SELECT p.nombreP, p.descripcion, p.precio, SUM(d.cantidad) AS ventas
FROM Producto p LEFT JOIN Detalle d ON (p.idProducto = d.idProducto)
GROUP BY p.idProducto

/*
6. Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los
productos con nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre
‘prod3’.
*/
SELECT DISTINCT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = "prod1" AND c.idCliente IN (SELECT c.idCliente
                                           FROM Cliente c
                                           INNER JOIN Factura f ON (c.idCliente = f.idCliente)
                                           INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
                                           INNER JOIN Producto p ON (d.idProducto = p.idProducto)
                                           WHERE p.nombreP = "prod2")
EXCEPT
SELECT DISTINCT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = "prod3"


/*
7. Listar nroTicket, total, fecha, hora y DNI del cliente, de aquellas facturas donde se haya
comprado el producto ‘prod38’ o la factura tenga fecha de 2019.
*/
SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = "prod38" OR YEAR(f.fecha) = "2019"

/*
8. Agregar un cliente con los siguientes datos: nombre:’Jorge Luis’, apellido:’Castor’,
DNI:40578999, teléfono:221-4400789, dirección:’11 entre 500 y 501 nro:2587’ y el id de
cliente: 500002. Se supone que el idCliente 500002 no existe.
*/
INSERT INTO Cliente (idCliente, nombre, apellido, DNI, telefono, direccion)
VALUES (500002, "Jorge Luis", "Castor", 40578999, "221-4400789", "11 entre 500 y 501 nro:2587")


/*
9. Listar nroTicket, total, fecha, hora para las facturas del cliente  ́Jorge Pérez ́ donde no
haya comprado el producto  ́Z ́.
*/
SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE c.nombre = "Jorge Perez" AND d.nroTicket NOT IN (SELECT d.nroTicket
                                                       FROM Detalle d INNER JOIN Producto p ON (d.nroTicket = p.nroTicket)
                                                       WHERE p.nombreP = "Z"
                                                      )

/*
10. Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en
cuenta todas sus facturas, supere $10.000.000.
*/

SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
GROUP BY c.idCliente
HAVING sum(f.total) > 10000000