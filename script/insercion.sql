use resto;

insert into tipoempleado (descripcionEmpleado)
                        values ('administrador'),
                                ('recepcionista'),
                                ('mesero');

insert into empleado (nombreEmpleado, apePaterno, telefonoEmpleado, edadEmpleado, cveTipo, cve)
                      values( 'Erick', 'Camacho',4612754592,22,1,'11dpr2474d'),
                            ( 'Francisco', 'Tierrablanca',4611234567,22,3,'123'),
                            ( 'Ruben', 'Ortega',4617654321,25,3,'1234'),
                            ( 'Yareli', 'Martinez',4611982034,21,3,'12345'),
                            ( 'Aranza', 'Lopez',4612004440,21,3,'123456'),
                            ( 'Yunuen', 'Gomez', 4614614611,23,2,'305279');

insert into mesa ( capacidad, estado, cveEmpleado)
                 values (5,1,2),
                        (6,1,2),
                        (7,1,3),
                        (8,1,4),
                        (9,1,5),
                        (10,1,5);

insert into reservacion (nombreCliente, correoCliente,Telefono, fechaReservacion, fecha, noAcompa, noMesa, cveEmpleado)
                        values  ( 'Mariana','mariana@gmail.com',4612027346,"2020-10-27 13:08:22", "2020-11-20 15:15:00", 5, 1, 2),
                                ( 'Alex','alex@gmail.com',4613125654,"2020-10-28 14:09:23", "2020-11-21 16:16:00", 2,2,3),
                                ( 'Jazmin','jazmin@gmail.com',4617845687,"2020-10-29 15:10:24", "2020-11-22 17:17:00", 1,3,3),
                                ( 'Frida','frida@gmail.com',4617905089,"2020-10-30 16:11:25", "2020-11-23 18:18:00", 4,4,4),
                                ( 'Yunuen','yunuen@gmail.com',46111153003,"2020-10-31 17:12:26", "2020-11-24 19:19:00", 2,5,5);

insert into orden (fechaOrden) values ( "2020-10-31 15:30:00"),
                            ( "2020-10-31 15:35:00"),
                            ( "2020-11-01 14:10:00"),
                            ( "2020-11-05 09:33:00"),
                            ( "2020-11-07 10:32:00");

insert into tiene values ( 1,2),
                            ( 2,1),
                            ( 3,4),
                            ( 4,3),
                            ( 5,5);

insert into ingrediente (nombreIngrediente, precioIngrediente, Existente)
                         values ( 'Jitomate',4.0,50),
                                ( 'Cebolla',5.0,55),
                                ( 'Ajo',10.0,20),
                                ( 'Cilantro',5.0,10),
                                ( 'Calabaza',3.0,40),
                                ( 'Chayote',5.0,35),
                                ( 'Pimienta',15.0,20),
                                ( 'Sal',12.0,25),
                                ( 'Zanahoria',6.0,50),
                                ( 'Papa',6.50,44),
                                ( 'Arugula',3.0,20),
                                ( 'Brocoli',4.50,33),
                                ( 'Pollo',25.0,20),
                                ( 'Arroz',18.50,29),
                                ( 'Aceite',25.0,14),
                                ( 'Mantequilla',21.50,30),
                                ( 'Queso',4.0,50);

insert into inventario (cveIngrediente, cveEmpleado, fechaInventario,existente)
                        values ( 1,2,"2020-10-01",10),
                                ( 2,2,"2020-10-01",11),
                                ( 3,3,"2020-10-01",12),
                                ( 4,3,"2020-10-03",13),
                                ( 5,4,"2020-10-03",14),
                                ( 6,4,"2020-10-03",15),
                                ( 7,5,"2020-10-03",16);

insert into menu (categoria)
                values ( 'ensaladas'),
                        ( 'Pollo'),
                        ( 'Vegano'),
                        ( 'Bebidas'),
                        ( 'Bebidas c/Alcohol');

insert into plato (nombrePlatillo, precioPlatillo, Categoria, Foto)
                    values ( 'Pollo a la plancha',149.0,2,null),
                            ( 'Pollo relleno',139.0,2,null),
                            ( 'Ensalada Cesar',99.0,1,null),
                            ( 'Ensalda con pollo',129.00,2,null),
                            ( 'Ensalda con arroz',89.00,3,null),
                            ( 'Pollo con mantequilla',139.00,2,null);

insert into lleva values ( 1,13),
                            ( 1,12),
                            ( 1,14),
                            ( 1,15),
                            ( 1,3),
                            ( 1,7),
                            ( 1,8),
                            ( 5,14),
                            ( 5,9),
                            ( 5,12),
                            ( 5,15),
                            ( 5,1),
                            ( 5,2),
                            ( 5,3),
                            ( 5,4),
                            ( 5,5),
                            ( 5,6);

insert into cuenta (cveCuenta, noPlatillos, Subtotal, Total, ticket, noOrden, cvePlatillo)
                            values ( 1, 2, 298.0, 342.7, null, 1, 1),
                            ( 1, 1, 99.0, 113.85, null, 2, 3),
                            ( 1, 1, 129.0, 148.35, null, 3, 4),
                            ( 2, 3, 139.0, 479.55, null, 4, 2),
                            ( 3, 1, 89.0, 102.35, null, 5, 5);
