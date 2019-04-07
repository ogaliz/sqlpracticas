
delimiter &&
create procedure proc1()
begin
	select nombre from personas where id=1001;
end&&
delimiter ;

delimiter &&
create procedure proc2()
begin
declare nom varchar(20);
set nom = (select nombre from personas where id=1005);
if nom = "Luis" then
select nombre from personas where id=1000;
end if;
end&&
delimiter ;

drop procedure proc4;

#procesos con parametros
delimiter &&
create procedure proc3(nom varchar(10))
begin
	select id from personas where nombre = nom;
end&&
delimiter ;

delimiter &&
create procedure proc4(totalp int)
begin
	declare resul int default 0;
    declare frase varchar(100);
		select count(id) into resul from personas;
		set frase = 'Has acertado el numero de registros';
    if resul = totalp then
		set @muestra = frase;
    end if;
end&&
delimiter ; 

call proc4(5);
select @muestra;

#variables de sesion en la que guardar resultados
select nombre from personas where id=1002 into @miNombre;
select @miNombre;

#vamos a crear un procedimiento almacenado que nos calculara la edad
#en base a un año pasado por parametro.
delimiter &&
create procedure calcula_edad(anyo_nac int)
	begin
		declare any_actual int default 2018;
        declare edad int;
        set edad = any_actual - anyo_nac;
        #este select es igual que la instruccion return en Java
        select edad;
	end&&
delimiter ; 

call calcula_edad(1991);

delimiter $$
create trigger revisa_id before update on personas for each row
	begin
		if(new.id < 1000) then
			set new.id=old.id;
		elseif(new.id > 1000) then
			set new.id=2000;
		end if;
    end$$
delimiter ;

#probamos el procedimiento modificando el id, al ser mayor que mil, nos
#lo pondra en 2000 por defecto.
update personas set id=1020 where id=1005;

show triggers;

