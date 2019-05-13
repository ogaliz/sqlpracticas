--Ejercicios PL1_1
-- 1
create procedure  primer_procedimiento () 
	select * from city limit 10;
-- 2
 -- capítulo 22 
 ------------------------------------
--Ejercicios PL1_2
-- 1
	call primer_procedimiento;
-- 2
delimiter //
create procedure  segundoC_procedimiento () 
	begin 
		select * from city limit 10; 
		select * from city limit 10; 
	end//
-- 3


create procedure ejercicio123(parametro int) 
	select parametro;
	
call ejercicio123(3);


-- Ejercicio 1-5 ---
-- 2 (Insertar cliente)
-- Para cambiar el modo de operación hacemos:
-- set sql_mode=''; (Así evitamos operar en modo 
-- STRICT_TRANS_TABLES)
create procedure ejercicio152(codigoCliente int, nombreCliente varchar(45))
	insert into cliente(cliente_cod,nombre) 
		values (codigoCliente,nombreCliente);

-- 4
delimiter //
create procedure ejercicio154(fecha date)
begin
	declare var int;
	select datediff(fecha,curdate()) into var;
	select date_format(fecha,'%W %d/%m/%Y');
	select var;
end//
delimiter ;

-- 5
delimiter //
create procedure ejercicio155 (var1 varchar(25),var2 varchar(25))
begin
	DECLARE registros int unsigned;
	
	create table if not exists prueba_tabla_1(campo1 int unsigned 
					auto_increment primary key, 
					campo2 varchar(50)) charset utf8;
	insert into prueba_tabla_1 values (0,
					upper(concat(var1,var2)));
	select count(*) into registros from prueba_tabla_1;
	select concat('Inserción correcta. El número de 
			registros es ', registros) RESULTADO;
end//
delimiter ;

-- 6
delimiter //
create procedure ejercicio156(inout var int)
begin 
	set var = var+1;
	select var; 
end//
delimiter ;


	













 