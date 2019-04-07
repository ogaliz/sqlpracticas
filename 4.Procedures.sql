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
-- ● Trata de escribir un procedimiento. Con que contenga una sola consulta es
-- suficiente.


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