/*
(No hacemos el 1)
 -- Ejercicio 2
 use consultas_basicas;
 create user pep@'192.168.0.%' identified by '1234';
 grant select on emple to pep@'192.168.0.%'
		with grant option;
	
 grant select on depart to pep@'192.168.0.%' 
		with grant option;

grant usage on *.* to pep@'192.168.0.%' 
		with max_queries_per_hour 10;

-- Ejercicio 3
create user Administrador@localhost identified by '1234';
grant create, create view, create routine, 
		alter routine, lock tables, select 
	on consultas_basicas.*
	to Administrador@localhost with grant option;
grant create user on *.* to Administrador@localhost;

-- Ejercicio 4
-- create user Invitado@'%' identified by '1234';

grant select(DNI) on consultas_basicas.personas to Invitado;
grant select(apellido) on consultas_basicas.emple to Invitado;

-- Ejercicio 5
-- (Modifico enunciado: revocar permisos de creación
-- de tablas a Administrador@localhost)
revoke create on consultas_basicas.* from Administrador@localhost;

-- Ejercicio 6 (Me lo invento)
-- Otorga permisos de DML a pep@'192.168.0.%' en la 
-- base de datos consultas_basicas
-- grant select, delete, update, insert on consultas_basicas.* to pep@'192.168.0.%';

-- Ejercicio 7(Me lo invento)
-- Otorga permiso de creación de bases de datos,
-- creación de usuarios y de consulta sobre la bbdd
-- 'mysql' a maria@'%';

create user maria identified by '1234';
grant create, create user on *.* 
	to maria;
grant select on mysql.* to maria;
*/