#Listado de consultas a implementar

#Consulta1: Subir en 5€ el precio de todos los pisos de L-Estartit.


#Consulta 2: Subir un 5% la comisión de todos los pisos.
#Nota 1: Una comisión superior al 100% no será válida.
#Nota 2: No se trata de subir en un 5% el porcentaje actual de cada comisión (por ejemplo, que una comisión del 5% pase a ser del 5,25%), sino de subir un 5% en general (por ejemplo, que una comisión del 1% pase a ser del 6%, o que una del 5% pase a ser del 10%)


#Consulta 3: Eliminar las entradas de caja correspondientes al día 16/04/2006.
-- creamos primero una vista por si acaso:
create view entrDeCaja as select * from CAJA ;
-- eliminamos los registros deseados:
delete from entrDeCaja where N_FACTURA = (select N_FACTURA from CAJA where DIA = '2006-04-16'); 
-- eliminamos la vista si lo consideramos: 
drop view entrDeCaja;

#Consulta 4: Eliminar los pedidos con día de llegada 17/4/2006.


#Consulta 5: Importe máximo y mínimo que ha pasado por caja entre los días 14/11/2005 y 01/02/2006 (ambos inclusive)
#Salida: maximo, minimo

-- Consulta 6: ¿Cuántos alquileres comienzan el día 01/02/2006?
select count(PEDIDO.N_PEDIDO) PedidosDia2 from PEDIDO where LLEGADA='2006-02-01';
-- Salida: número

-- Consulta 7: ¿Cuántos pisos hay en L'Estartit?
select count(LOC) PisosEnEstartit from PISO where LOC="L-Estartit"; 
-- Salida: número
-- 
-- Consulta 8: ¿Cuántos pedidos se han cancelado con el piso número 10?
select count(PEDIDO.N_PEDIDO) CancelsPiso10 from PEDIDO where CANCELADO=true and N_PISO=10;
-- Salida: número

-- Consulta 9: ¿Qué clientes se van el mes de octubre de 2005?
select PEDIDO.NIF_CLI from PEDIDO where PARTIDA like '%2005-10-%';
-- Salida: nif_cli
-- 
-- Consulta 10: ¿Qué propietarios hay con algún apellido que cotenga la letra 'u'?
select PROP.NIF_PROP, PROP.APEL from PROP where APEL like '%u%';
-- Salida: nif_prop, apel
-- 
-- Consulta 11: ¿Qué pisos hay en Pals o en L'Escala con un precio inferior o igual a 50,00€ por día?
select N_PISO, PRECIO from PISO where LOC IN("L-Estartit", "L-Escala") and PRECIO <= 50;
-- Salida: n_piso, precio

-- Consulta 12: ¿Cuántos propietarios tenemos de cada localidad?
select Loc, count(Nombre) NumeroDePisos from PROP group by 1;   
-- Salida: localidad, numero
-- 
-- Consulta 13: Para cada día de caja mostrar la cantidad diaria de pagos de tipo A que se ha hecho.
select DIA, count(OPERACION) numeroAs from CAJA where OPERACION ="A" group by 1;
-- Salida: dia, numero
-- 
-- Consulta 14: ¿Qué beneficio tiene actualmente la agencia por cada pedido?

-- Salida: n_pedido, numero
-- 
-- Consulta 15: ¿Cuántos pisos, iguales o diferentes, ha contratado cada cliente?
select count(PEDIDO.NIF_CLI) Pedidos, NOMBRE
from PEDIDO join CLI on PEDIDO.NIF_CLI=CLI.NIF_CLI
group by 2; 
-- Salida: nif_cli, numero

-- Consulta 16: Listado de nombres y apellidos de propietarios con la dirección y la localidad de sus pisos.
select concat(PROP.NOMBRE,' ',PROP.APEL) NombrePropietario, PISO.DIR Direccion, PISO.LOC Localidad 
from PROP join PISO using(NIF_PROP);
-- Salida: nombre, apellidos, dirección, localidad

-- Consulta 17: Listado de pagos que se han hecho en contratos con el piso número 5.

-- Salida: n_factura, operacion, importe, dia
-- 
-- Consulta 18: ¿Qué pedidos se ha hecho con el piso de dirección 'Av. Girona 10' de L'Escala?
select count(PEDIDO.N_PISO) pedidos from PEDIDO right join PISO 
on PEDIDO.N_PISO=PISO.N_PISO where PISO.DIR like 'Riera 18';
-- Salida: n_pedido
-- 
-- Consulta 19: Por cada propitario dar la suma del precio/dia de sus pisos.
select PROP.NIF_PROP, PROP.NOMBRE, APEL, sum(PISO.PRECIO) totalPagado
from PROP left join PISO on PROP.NIF_PROP=PISO.NIF_PROP
group by 1 order by 2 ; 
-- Salida: nombre, apel, numero
-- 
-- Consulta 20: Dar el número de pisos que ha alquilado cada cliente (no mostrar los que no han alquilado nada).
-- Salida: nombre, apel, numero
-- 
-- Consulta 21: Para cada pedido (que se le pueda aplicar) dar las fechas de las parejas formadas por los pagos 'A' y pagos 'B'.
-- Salida: n_pedido, fecha1, fecha2
-- 
-- Consulta 22: Dar las direcciones de todas las parejas posibles de pisos de manera que el primero sea de L'Estartit, el segundo de L'Escala y su precio conjunto sea de 95,00€.
-- Salida: n_piso1, direccion1, n_piso2, direccion2
-- 
-- Consulta 23: Dar el nif de los clientes que han alquilado pisos en L'Escala.
select PEDIDO.NIF_CLI Clientes from PEDIDO where 
-- Salida: nif_cli
-- 
-- Consulta 24: Dar nombre y apellidos de los clientes que han alquilado pisos en L'Escala.
-- Salida: nombre, apel
-- 
-- Consulta 25: Dar la dirección de todos los pisos de la propietaria Antonia Sierra Martin.
select PISO.DIR, PISO.LOC from PISO left join PROP
on PROP.NIF_PROP=PISO.NIF_PROP where PROP.NOMBRE="Antonia"; 
-- Salida: dir, loc
-- 
-- Consulta 26: Dar para cada localidad la dirección del piso más barato.
#select DIR, LOC, PRECIO from PISO where min(PRECIO) group by PRECIO;
-- Salida: dir, loc, precio  
-- 
-- Consulta 27: Dar la dirección de los pisos que tienen un precio por encima de la media de precios de todos los pisos.
select PISO.DIR, PISO.LOC, PISO.PRECIO from PISO where PRECIO > 
(select round(avg(PRECIO)) from PISO) order by 3;
-- Salida: dir, loc, precio











