-- 1. Escribe una función que devuelva tu nombre.
create function miNombre(nombre varchar(20)) 
returns varchar(20) 
return nombre;

select miNombre('Oscar Galvez');

-- 2. Escribe una función que reciba un parámetro de tipo varchar y devuelva ese mismo parámetro.


-- 3. Escribe una función que reciba un varchar como parámetro de entrada y
-- devuelva la segunda letra del varchar recibido.
show session variables;


-- 4. Escribe una función que devuelva el JEFE del nombre del empleado pasado
-- como parámetro de entrada. (tabla emple)


-- 5. Escribe una función que devuelva una fecha dada con el formato: día de la
-- semana, día del mes, hora, minutos y segundos.
-- 6. Escribe una función que devuelva el número de años completos de diferencia
-- entre dos fechas que se le pasan como parámetros.

# Funciones 2
-- 1. Desarrolla una función que devuelva el precio total de una comanda de la bbdd empresa.


-- 2. Escribe una función que devuelva la dirección postal completa de un cliente
-- que le pasamos como parámetro de entrada.


-- 3. Escribe una función que compare dos letras minúsculas del rango [a..z] que
-- le pasamos como parámetros de entrada y que, a continuación, imprima la
-- mayor de las dos o cero en el caso de que sean iguales.