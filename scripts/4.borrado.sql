--tipo producto sin productos
DELETE FROM TiposProducto WHERE id = 3;


--CASCADA

--usuario cliente
DELETE FROM Usuarios WHERE id = 3;

--cliente con pedidos
DELETE FROM Clientes WHERE id = 1;

--empleado con pedidos
DELETE FROM Empleados WHERE id = 1;