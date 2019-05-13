-- Listamos los usuarios del sistema
SELECT user, host FROM mysql.user;

-- Mostramos los privilegios que tiene alguno de ellos:
show grants for 'root'@'localhost';

-- Creamos un usuario 
create user 'us1'@'localhost' identified by 'us1';
show grants for 'us1'@'localhost';

-- Otorgamos algunos privilegios al nuevo usuario: 
grant select, update on empresa.cliente to 'us1'@'localhost';

-- Eliminamos uno de los permisos al nuevo usuario 
revoke update on empresa.cliente from 'us1'@'localhost';

