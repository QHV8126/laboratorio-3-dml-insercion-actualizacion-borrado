-- nombre usuario
UPDATE Usuarios 
SET email = 'andreaandrea@gmail.com' 
WHERE nombre = 'Andrea';

-- alario empleado
UPDATE Empleados 
SET salario = 3000.00 
WHERE usuarioId = (SELECT id FROM Usuarios WHERE nombre = 'Jose');

-- precio producto
UPDATE Productos 
SET precio = 10.00 
WHERE nombre = 'Auriculares';

-- fecha envio = fecha actual pedido
UPDATE Pedidos 
SET fechaEnvio = CURDATE() 
WHERE id = 1;

-- empleado pedido
UPDATE Pedidos 
SET empleadoId = (SELECT id FROM Empleados WHERE usuarioId = (SELECT id FROM Usuarios WHERE nombre = 'Jose'))
WHERE id = 1;


-- FALLOS

-- contraseña usuario <8 caracteres
UPDATE Usuarios 
SET contraseña = '1234' 
WHERE nombre = 'Alejandro';

-- precio producto precio mínimo
UPDATE Productos 
SET precio = -2.00 
WHERE nombre = 'Whisky';

-- unidades linea pedido >100
UPDATE LineasPedido 
SET unidades = 300 
WHERE id = 1;