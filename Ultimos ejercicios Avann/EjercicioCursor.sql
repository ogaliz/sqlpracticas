SELECT * FROM classicmodels.employees;

DELIMITER $$

CREATE PROCEDURE build_email_list (INOUT email_list varchar(4000))
BEGIN
 DECLARE v_finished INTEGER DEFAULT 0;
 DECLARE v_email varchar(100) DEFAULT "";
 -- declare cursor for employee email
 DECLARE email_cursor CURSOR FOR SELECT email FROM employees;
 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

 OPEN email_cursor;

 get_email: LOOP
 FETCH email_cursor INTO v_email;
 IF v_finished = 1 THEN 
	LEAVE get_email;
 END IF;

 -- build email list
 SET email_list = CONCAT(v_email,";",email_list);

 END LOOP get_email;

 CLOSE email_cursor;

END$$

DELIMITER ;

SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;

-- Escribe un procedimiento que imprima por pantalla todos los usuarios del
-- sistema pero utilizando un variable de cursor.
select User from mysql.user;

delimiter $$
create procedure lista_usuarios_sistema() 
begin
declare finalizado int default 0;
declare usuario varchar(50);
declare resultado varchar(1000) default "";
declare miCursor cursor for select User from mysql.user;
declare continue handler for not found set finalizado = 1; 
open miCursor;

iterador: loop 
fetch miCursor into usuario; 
if finalizado = 1 then 
	leave iterador;
end if;
set resultado = concat(usuario, ", ", resultado);
end loop iterador;
close miCursor;
select concat("La lista de usuarios es: ", resultado);
end$$
delimiter ;

drop procedure if exists lista_usuarios_sistema;
call lista_usuarios_sistema();