-- Genera un procedimiento que permita insertar nuevos clientes en la tabla Cliente. Debes considerar:
-- 1. Los parámetros de entrada son: DNI del cliente, Nombre del cliente, Ciudad del
-- cliente y el identificador de un concesionario.
-- 2. Se ejecutará con los permisos del que crea el procedimiento.
-- 3. Que el parámetro de entrada que se le pasa al procedimiento como identificador de un concesionario corresponde 
-- a un concesionario que está registrado en la tabla Concesionario. En caso de que esto no se cumpla, el procedimiento 
-- devolverá un mensaje del estilo “Identificador de concesionario incorrecto” y no realizará la inserción.

delimiter $$
create definer = current_user procedure inserta_cliente(
in dni char(9),
in nombre varchar(40),
in ciudad_cliente varchar(20),
in concesionario tinyint(3) unsigned
)
begin 
	-- VARIABLES
    DECLARE finalizado boolean default false;
	DECLARE mensaje_enviado varchar(30);
    DECLARE id_con tinyint(3);
    
    DECLARE miCursor cursor for select Id_Concesionario from concesionario;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finalizado = true;
    open miCursor;
    
	-- CUERPO
    comprobamos_id: loop
		fetch miCursor into id_con;
		if id_con = concesionario then 
			insert into cliente values ( dni, nombre, ciudad_cliente, concesionario);
            leave comprobamos_id;
		elseif finalizado then
			set @mensaje_enviado = 'No en la tabla';
			select @mensaje_enviado;
			leave comprobamos_id;
		end if;
    end loop comprobamos_id;
	close miCursor;
end$$
delimiter ;

insert into concesionario values (6, "Av. De los Angeles", "Montevideo");

call inserta_cliente("374847H", "Nerea", "Guadalajara", 6);
drop procedure inserta_cliente;
select @mensaje_enviado;

set @texto = 'Hola mundo';
select @texto;

-- Crea una función que devuelva el número de clientes que tiene cada concesionario. El argumento de la función 
-- es el Identificador (Id_Concesionario) del concesionario.
delimiter //
create function numero_clientes(id_con tinyint(3)) 
returns int 
begin
	declare num_clientes int;
    set @num_clientes = (select count(DNI) from cliente where concesionario=id_con );
	return (select @num_clientes);
end//
delimiter ;

-- Comprobamos
select numero_clientes(4);

-- PREGUNTA 4
-- Crea una tabla Estadisticas que tendrá tres campos: un identificador autoincremental, un
-- campo que llamarás Ciudad y que será un varchar de longitud máxima de 20 caracteres y
-- un campo numérico entero positivo cuyo valor oscilará entre 1 y 100.
create table Estadisticas(
id_est int primary key auto_increment,
Ciudad varchar(20),
numero_concesionarios int(100) unsigned);

-- En la tabla Estadisticas se almacenará para cada ciudad el número de concesionarios que
-- hay en ella. Así, por ejemplo, si en una fila tenemos los valores (45, “Roma”,7) significará
-- que en la ciudad de “Roma” hay 7 concesionarios.

-- A continuación diseña un disparador que por cada inserción en la tabla Concesionario
-- inserta o modifica la fila correspondiente en la tabla Estadisticas manteniendo de esta
-- manera, los valores actualizados.
delimiter $$
create trigger after_concesionario_insert 
	after insert ON examendam1a.concesionario for each row
begin
	insert into examendam1a.estadisticas 
    set action = 'insert', 
	Ciudad = new.Ciudad_Concesionario,
	numero_concesionarios = (select count(Id_Concesionario));
end$$
delimiter ;

drop trigger if exists after_concesionario_insert;
insert into concesionario values (5, 'Deep Valley 32', 'Huston');



