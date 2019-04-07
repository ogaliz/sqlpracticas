#link a manual en castellano:
#http://rm-rf.es/usuario-mysql-como-crear-borrar-y-asignar-privilegios/

#para proporcionar un permiso a un usuario especifico,
#utilizamos la esctructura: 
#GRANT [permiso] ON [nombre de bases de datos].[nombre de tabla] TO ‘[nombre de usuario]’@'localhost’;
#Siendo los permisos permitidos los siguientes:
-- ALL PRIVILEGES: como mencionamos previamente esto permite a un usuario de MySQL acceder a todas las bases de datos asignadas en el sistema.
-- CREATE: permite crear nuevas tablas o bases de datos.
-- DROP: permite eliminar tablas o bases de datos.
-- DELETE: permite eliminar registros de tablas.
-- INSERT: permite insertar registros en tablas.
-- SELECT: permite leer registros en las tablas.
-- UPDATE: permite actualizar registros seleccionados en tablas.
-- GRANT OPTION: permite remover privilegios de usuarios.

#creacion de usuario y contraseña
create user if not exists 'maria'@'localhost' identified by '1234';
#si queremos que se conecte desde cualquier equipo utilizaremos --> 'maria'@'%'
create user if not exists 'oscar'@'localhost' identified by '2244';
#
grant create view, show view on consultas.* to 'oscar'@'localhost';

#los asteriscos hacen referencia a las bases de datos y a las tablas
#por tanto, este usuario tendra acceso a todas las bbdd y sus tablas.
grant all privileges on * . * to 'maria'@'localhost';

# esto refresca los cambios hechos en materia de privilegios.
flush privileges;

#eliminar usuario existente.
drop user 'maria'@'localhost';

#creamos un usuario y le damos permisos a las tablas emple y depart
create user if not exists 'Pep'@'192.168.0.*'
identified by '1234';
grant select on consultas.emple to 'Pep'@'192.168.0.*';
grant select on consultas.depart to 'Pep'@'192.168.0.*';

#añadimos los permisos para consultar y modificar vistas:
grant create view, show view on consultas.* to 'maria'@'localhost';

#damos permiso de consulta sobre columnas de dos tablas distintas.
grant select(dni) on consultas.emple to 'oscar'@'localhost';

#Ver los usuarios que tnemos conectados en el sistema:
select User from mysql.user; 

#Ahora queremos ver los privilegios del usuario seleccionado:
show grants for 'Pep'@'192.168.0.*'; 

show grants for 'oscar'@'localhost'; 


grant select on consultas.emple to Pep with grant option max_queries_per_hour 10;

#crear un administrador de la base de datos:
create user admin@localhost identified by '1324';
grant all on consultas.* to admin with grant option; 

grant create user on *.* to admin@localhost; 

create user invitado identified by '1234';
#Y le otorgamos permisos:
grant select(DNI) on consultas;






























