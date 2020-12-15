CREATE DATABASE resto;
USE resto;
CREATE TABLE tipoempleado ( cveTipo INT NOT NULL AUTO_INCREMENT,
                            descripcionEmpleado CHAR(25),
                            CONSTRAINT PKtipoempleado PRIMARY KEY(cveTipo) );

CREATE TABLE empleado ( cveEmpleado BIGINT NOT NULL AUTO_INCREMENT,
                        nombreEmpleado CHAR(35) NOT NULL,
                        apePaterno CHAR(50) NOT NULL,
                        telefonoEmpleado BIGINT NOT NULL UNIQUE,
                        edadEmpleado INT NOT NULL,
                        cveTipo INT,
                        cve CHAR(50) NOT NULL,
                        foto CHAR(5),
                        CONSTRAINT PKempleado PRIMARY KEY(cveEmpleado),
                        CONSTRAINT FK1empleado FOREIGN KEY(cveTipo) REFERENCES tipoempleado(cvetipo));

CREATE TABLE mesa ( noMesa BIGINT NOT NULL AUTO_INCREMENT ,
                    capacidad INT NOT NULL,
                    estado BOOLEAN,
                    cveEmpleado BIGINT,
                    CONSTRAINT PKmesa PRIMARY KEY(noMesa),
                    CONSTRAINT FK1mesa FOREIGN KEY(cveEmpleado) REFERENCES empleado(cveEmpleado),
                    CONSTRAINT CK1mesa check (estado="1" or estado="0"));

CREATE TABLE reservacion ( noReservacion BIGINT NOT NULL AUTO_INCREMENT,
                            nombreCliente CHAR(35),
                            correoCliente CHAR(50) NOT NULL,
                            Telefono BIGINT UNIQUE,
                            fechaReservacion DATETIME,
                            fecha DATETIME DEFAULT (NOW()),
                            noAcompa INT,
                            noMesa BIGINT,
                            cveEmpleado BIGINT NOT NULL,
                            CONSTRAINT PKreservacion PRIMARY KEY(noReservacion),
                            CONSTRAINT FK1reservacion FOREIGN KEY(noMesa) REFERENCES mesa(noMesa)
                            ,
                            CONSTRAINT FK2reservacion FOREIGN KEY(cveEmpleado) REFERENCES empleado(cveEmpleado));

CREATE TABLE orden (noOrden BIGINT NOT NULL AUTO_INCREMENT,
                    fechaOrden DATETIME,
                    CONSTRAINT PKorden PRIMARY KEY(noOrden));

CREATE TABLE tiene ( noMesa BIGINT NOT NULL,
                    noOrden BIGINT NOT NULL,
                    CONSTRAINT PKtiene PRIMARY KEY(noMesa,noOrden),
                    CONSTRAINT FK1tiene FOREIGN KEY(noMesa) REFERENCES mesa(noMesa)
                   ,
                    CONSTRAINT FK2tiene FOREIGN KEY(noOrden) REFERENCES orden(noOrden)
                    );

CREATE TABLE ingrediente ( cveIngrediente BIGINT NOT NULL AUTO_INCREMENT,
                            nombreIngrediente CHAR(35),
                            precioIngrediente FLOAT,
                            Existente INT,
                            CONSTRAINT PKingrediente PRIMARY KEY (cveIngrediente));

CREATE TABLE inventario ( cveIngrediente BIGINT NOT NULL,
                            cveEmpleado BIGINT NOT NULL,
                            fechaInventario DATE,
                            existente INT (3),
                            CONSTRAINT PKinventario PRIMARY KEY(cveIngrediente,cveEmpleado),
                            CONSTRAINT FK1inventario FOREIGN KEY(cveIngrediente) REFERENCES ingrediente(cveIngrediente)
                            ,
                            CONSTRAINT FK2inventario FOREIGN KEY(cveEmpleado) REFERENCES empleado(cveEmpleado)
                            );

CREATE TABLE menu ( cveCategoria INT NOT NULL AUTO_INCREMENT,
                    categoria CHAR(35) NOT NULL,
                    CONSTRAINT PKmenu PRIMARY KEY(cveCategoria));

CREATE TABLE plato ( cvePlatillo BIGINT NOT NULL AUTO_INCREMENT,
                    nombrePlatillo CHAR(50),
                    precioPlatillo FLOAT,
                    Categoria INT,
                    Foto CHAR(40),
                    CONSTRAINT PKplato PRIMARY KEY(cvePlatillo),
                    CONSTRAINT FK1plato FOREIGN KEY(Categoria) REFERENCES menu(cveCategoria)
                    );

CREATE TABLE lleva ( cvePlatillo BIGINT NOT NULL,
                    cveIngrediente BIGINT NOT NULL,
                    CONSTRAINT PKlleva PRIMARY KEY(cvePlatillo,cveIngrediente),
                    CONSTRAINT FK1lleva FOREIGN KEY(cvePlatillo) REFERENCES plato(cvePlatillo)
                    ,
                    CONSTRAINT FK2lleva FOREIGN KEY(cveIngrediente) REFERENCES ingrediente(cveIngrediente)
                    );

CREATE TABLE cuenta ( cveCuenta BIGINT NOT NULL,
                        noPlatillos int NOT NULL,
                        Subtotal FLOAT NOT NULL,
                        Total FLOAT NOT NULL,
                        ticket char(40),
                        noOrden BIGINT NOT NULL,
                        cvePlatillo BIGINT NOT NULL,
                        CONSTRAINT PKcuenta PRIMARY KEY(cveCuenta, noOrden, cvePlatillo),
                        CONSTRAINT FK1cuenta FOREIGN KEY(noOrden) REFERENCES orden(noOrden)
                        ,
                        CONSTRAINT FK2cuenta FOREIGN KEY(cvePlatillo) REFERENCES plato(cvePlatillo)
                        ,
                        CONSTRAINT CK1cuenta check (Subtotal>=0));
