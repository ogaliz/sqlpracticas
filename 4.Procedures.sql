/**
Tambien llamados rutinas, son un conjunto de sentencias y de instrucciones que se 
que realiza una tarea en la base de datos y que se guarda con un nombre.
Ofrece diversas ventajas, tales como:
- Mejorar el rendimiento, el código se almacena en la BBDD y hay menos intercambio
	cliente-servidor.
- Reutilizar el código, un procedimiento almacenado puede ser llamado por otro. 
- Mejorar la integridad de los datos. Las reglas de gestión pueden crearse en las 
	rutinas de forma que si las aplicaciones clientes no tienen permiso para acceder 
    a las tablas pero deben utilizar las rutinas, la integridad de los datos esta 
    garantizada. 
*/
-- ● Trata de escribir un procedimiento. Con que contenga una sola consulta es suficiente.
delimiter $$
create procedure test()
begin
	select dnombre from depart;
end$$
delimiter ;

call test;

delimiter $$
create procedure segundo (in departamento varchar(25))
begin
	select * from depart where dnombre=departamento;
end$$
delimiter ; 

call segundo('CONTABILIDAD')

-- ● Ahora escribe un procedimiento con dos subconsultas.


-- ● Crea un procedimiento que muestre por pantalla el resultado de consultar la
-- tabla mysql.user. Observa que el DEFINER queda definido como
-- root@localhost. Asegúrate de que la característica SQL SECURITY queda
-- como DEFINER


-- ● Ahora concede al usuario María@’%’ permisos para ejecutar rutinas.


-- ● Accede al sistema como María y trata de ejecutar el procedimiento anterior.


-- ● Vuelve a logearte como root y modifica el procedimiento anterior: cambia la
-- característica SQL SECURITY a INVOKER


-- ● Vuelve a convertirte en María y trata de nuevo de ejecutar el procedimiento.


-- ● ¿Qué permisos habría de tener María para poder llamar el procedimiento?


### Insertar un nuevo libro en la BBDD y recuperar su ID
delimiter $$
create procedure pa_crear_tema(
in p_titulo varchar(20),
in p_id_primario int, 
out p_id int
)
begin
	insert into tema(titulo, id_primario) 
    values(p_titulo, p_id_primario);
    
    set p_id = last_insert_id();
end$$
delimiter ; 

call pa_crear_tema('Vue y Vuetify', 7, @ultima_insercion);
select @ultima_insercion;
select * from tema where id = @ultima_insercion;