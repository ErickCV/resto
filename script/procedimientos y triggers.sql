-- verificar usuario --
DROP PROCEDURE if EXISTS verificaEmpleado;
CREATE PROCEDURE verificaEmpleado( IN nombre CHAR(35), 
                                    IN pass CHAR(20), 
                                    OUT valor INT ) 
BEGIN 
    IF EXISTS (SELECT * FROM empleado WHERE nombreEmpleado = nombre)
        THEN 
            SET valor = 1;
    ELSE 
        SET valor = 0; 
    END IF;
END;
--comprobacion--
CALL verificaEmpleado('Erick','305279', @valor);
SELECT @valor;

-- cambiar estatus de mesa --
DROP PROCEDURE  IF EXISTS actualizaMesa;
CREATE PROCEDURE actualizaMesa (IN mesa BIGINT,
                                IN nuevoEstado BOOLEAN,
                                OUT valorMesa INT)
BEGIN
    IF EXISTS (SELECT * FROM mesa WHERE noMesa = mesa) AND nuevoEstado = 1 OR nuevoEstado = 0
    THEN
        UPDATE mesa SET estado = nuevoEstado WHERE noMesa = mesa;
        SET valorMesa = 1; 
    ELSE
        SET valorMesa = 0;                                       
    END IF;
 END;

--comprobacion--
 SELECT * FROM mesa;  
 SELECT @valorMesa;
 CALL actualizaMesa(2,1,@valorMesa);
 SELECT * FROM mesa;
 SELECT @valorMesa; 


--inserta acceso--
DROP PROCEDURE  IF EXISTS acceso;
CREATE PROCEDURE insertaAcceso( IN clave char(20))
DECLARE id int;
BEGIN
    id = (SELECT MAX(cveEmpleado) FROM empleado);
    INSERT INTO acceso ( cve, cveEmpleado) values  (SHA1 (clave), id);
END;

 --usuarios y roles--

CREATE ROLE administradores;
CREATE ROLE recepcionistas;
GRANT SELECT, UPDATE, DELETE, INSERT ON resto.inventario to administradores;
GRANT SELECT, UPDATE, DELETE, INSERT ON resto.reservacion to recepcionistas;

SELECT @@AUTOCOMMIT;

DROP TRIGGER  IF EXISTS creaSesionTrigger;
START TRANSACTION;
SET AUTOCOMMIT=0;
CREATE TRIGGER creaSesionTrigger
AFTER INSERT ON acceso 
FOR EACH ROW
BEGIN
    DECLARE nombre CHAR(35);
    SELECT nombreEmpleado INTO nombre FROM empleado WHERE cveEmpleado in (select max(cveEmpleado) from acceso);
    call creaSesionProcedure(nombre,NEW.cve);
END;
COMMIT;

call creaSesionProcedure('Profe','12345');

DROP PROCEDURE creaSesionProcedure;
CREATE PROCEDURE creaSesionProcedure (IN nombre CHAR(35), IN clave CHAR(20))
BEGIN 
declare nombreA char(35);
declare host char(30);
IF (SELECT cveTipo FROM empleado where cveEmpleado in (select cveEmpleado from acceso where cveEmpleado = (select MAX(cveEmpleado) from acceso)))=1 
    THEN
        SELECT cveTipo INTO nombreA FROM empleado where cveEmpleado in (select cveEmpleado from acceso where cveEmpleado = (select MAX(cveEmpleado) from acceso));
        CREATE USER CONCAT(nombreA,'@','localhost'); 
        SET PASSWORD FOR CONCAT(nombreA,'@','localhost') = PASSWORD('clave');
        GRANT administradores TO CONCAT(nombreA,'@','localhost'); 
/*ELSEIF(SELECT cveTipo FROM empleado where cveEmpleado in (select cveEmpleado from acceso where cveEmpleado = (select MAX(cveEmpleado) from acceso)))=2
    THEN
        CREATE USER nombreA@'localhost'; 
        SET PASSWORD FOR nombreA@'localhost' = PASSWORD('clave');
        GRANT recepcionistas TO nombreA@'localhost'; */
END IF;
END;

