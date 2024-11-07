--4 usuarios válidos
INSERT INTO Usuarios SET nombre = 'Andrea', email = 'andrea@gmail.com', contraseña = '123456789';
INSERT INTO Usuarios SET nombre = 'Alejandro', email = 'alejandro@gmail.com', contraseña = '123456789';
INSERT INTO Usuarios SET nombre = 'David', email = 'david@gmail.com', contraseña = '123456789';
INSERT INTO Usuarios SET nombre = 'Jose', email = 'jose@gmail.com', contraseña = '123456789';

--cliente +14
INSERT INTO Clientes (usuarioId, direccionEnvio, codigoPostal, fechaNacimiento) VALUES (
    (SELECT id FROM Usuarios WHERE email = "andrea@gmail.com"),
    "calle reina mercedes",
    "41010",
    "2005-10-18"
);

--cliente +14 -18
INSERT INTO Clientes (usuarioId, direccionEnvio, codigoPostal, fechaNacimiento) VALUES (
    (SELECT id FROM Usuarios WHERE email = "alejandro@gmail.com"),
    "calle pueblo",
    "41250",
    "2008-12-22"
);

--cliente sin pedidos
INSERT INTO Clientes (usuarioId, direccionEnvio, codigoPostal, fechaNacimiento) VALUES (
    (SELECT id FROM Usuarios WHERE email = "david@gmail.com"),
    "calle sin pedidos",
    "20918",
    "2000-01-08"
);

--empleado
INSERT INTO Empleados (usuarioId, salario) VALUES (
    (SELECT id FROM Usuarios WHERE email = "jose@gmail.com"),
    2000.00
);

--tipos producto
INSERT INTO TiposProducto (nombre) VALUES ("Electrónica");
INSERT INTO TiposProducto (nombre) VALUES ("Alimentos");
INSERT INTO TiposProducto (nombre) VALUES ("Droguería");

--productos
INSERT INTO Productos (nombre, tipoProductoId, precio, puedeVenderseAMenores) VALUES (
    "Auriculares",
    (SELECT id FROM TiposProducto WHERE nombre = "Electrónica"),
    25.00,
    TRUE
);
INSERT INTO Productos (nombre, tipoProductoId, precio, puedeVenderseAMenores) VALUES (
    "Vino tinto",
    (SELECT id FROM TiposProducto WHERE nombre = "Alimentos"),
    15.00,
    FALSE
);
INSERT INTO Productos (nombre, tipoProductoId, precio, puedeVenderseAMenores) VALUES (
    "Chocolate",
    (SELECT id FROM TiposProducto WHERE nombre = "Alimentos"),
    3.50,
    TRUE
);
INSERT INTO Productos (nombre, tipoProductoId, precio, puedeVenderseAMenores) VALUES (
    "Cargador USB",
    (SELECT id FROM TiposProducto WHERE nombre = "Electrónica"),
    10.00,
    TRUE
);
INSERT INTO Productos (nombre, tipoProductoId, precio, puedeVenderseAMenores) VALUES (
    "Whisky",
    (SELECT id FROM TiposProducto WHERE nombre = "Alimentos"),
    45.00,
    FALSE
);

--pedido
INSERT INTO Pedidos (fechaRealizacion, fechaEnvio, direccionEntrega, comentarios, clienteId, empleadoId) VALUES (
    "2024-10-31",
    NULL,
    "Calle Ejemplo 45",
    "entrega urgente"
    (SELECT id FROM Clientes WHERE id = 1),
    NULL
);

--lineas de pedido
INSERT INTO LineasPedido (pedidoId, productoId, unidades, precio) VALUES (
    (SELECT id FROM Pedidos WHERE id = 1),
    (SELECT id FROM Productos WHERE id = 1),
    3,
    10.00
);
INSERT INTO LineasPedido (pedidoId, productoId, unidades, precio) VALUES (
    (SELECT id FROM Pedidos WHERE id = 1),
    (SELECT id FROM Productos WHERE id = 2),
    5,
    15.00
);


--FALLOS

--linea pedido - unidades
INSERT INTO LineasPedido (pedidoId, productoId, unidades, precio) VALUES (
    (SELECT id FROM Pedidos WHERE id = 1),
    (SELECT id FROM Productos WHERE id = 3),
    150,
    20.00
);

--linea pedido - precio
INSERT INTO LineasPedido (pedidoId, productoId, unidades, precio) VALUES (
    (SELECT id FROM Pedidos WHERE id = 1),
    (SELECT id FROM Productos WHERE id = 4),
    10,
    -16.00
);

--pedido - edad
INSERT INTO Pedidos (fechaRealizacion, fechaEnvio, direccionEntrega, comentarios, clienteId, empleadoId) VALUES (
    "2024-10-31",
    NULL,
    (SELECT direccionEnvio FROM Clientes WHERE id = 2),
    "entrega lo antes posible"
    (SELECT id FROM Clientes WHERE id = 2),
    (SELECT id FROM Clientes WHERE id = 4)
);
INSERT INTO LineasPedido (pedidoId, productoId, unidades, precio) VALUES (
    (SELECT id FROM Pedidos WHERE id = 2),
    (SELECT id FROM Productos WHERE puedeVenderseAMenores=FALSE),
    5,
    10.00
);

--linea pedido - unique
INSERT INTO LineasPedido (pedidoId, productoId, unidades, precio) VALUES (
    (SELECT id FROM Pedidos WHERE id = 1),
    (SELECT id FROM Productos WHERE id = 2),
    2,
    15.00
);

-- usuario - contraseña
INSERT INTO Usuarios SET nombre = 'Pepito', email = 'pepito@gmail.com', contraseña = '123';

--cliente -14
INSERT INTO Usuarios SET nombre = 'Alvaro', email = 'alvaro@gmail.com', contraseña = '123456789';
INSERT INTO Clientes (usuarioId, direccionEnvio, codigoPostal, fechaNacimiento) VALUES (
    (SELECT id FROM Usuarios WHERE email = "alvaro@gmail.com"),
    "calle menor",
    "41250",
    "2020-03-29"
);

--producto - precio
INSERT INTO Productos (nombre, tipoProductoId, precio, puedeVenderseAMenores) VALUES (
    "Autoestima",
    (SELECT id FROM TiposProducto WHERE nombre = "Alimento"),
    -17.00,
    TRUE
);