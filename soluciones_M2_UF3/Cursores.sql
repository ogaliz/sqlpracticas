-- Ejercicio 1
/*
delimiter //
create procedure cursores11()
begin
	declare a varchar(50);
	declare cursor1 cursor for select nombre from cliente;
	open cursor1;
	loop
		fetch cursor1 into a;
		select a;
	end loop;
	
	close cursor1;
end//
delimiter ;

-- Ejercicio 2
(Haremos referencia a la tabla empresa.CLIENTE)

delimiter //
create procedure cursores12()
begin
	declare a varchar(50);
	declare cont int default 0;
	declare cursor1 cursor for select nombre from cliente;
	set cont=(select count(nombre) from cliente);
	open cursor1;
	eti:loop
		fetch cursor1 into a;
		select a, cont;
		set cont=cont-1;
		if cont=0 then leave eti; end if;
	end loop;
	
	close cursor1;
end//
delimiter ;

-- -- Ejercicio 3
-- (Haremos referencia a la tabla empresa.CLIENTE)

delimiter //
create procedure cursores13()
begin
	declare a,b varchar(50);
	declare cont int default 0;
	declare cursor1 cursor for select nombre,codi_postal from cliente;
	set cont=(select count(nombre) from cliente);
	open cursor1;
	eti:loop
		fetch cursor1 into a,b;
		select a, b, cont;
		set cont=cont-1;
		if cont=0 then leave eti; end if;
	end loop;
	
	close cursor1;
end//
delimiter ;

-- Ejercicio 4
drop procedure cursores14;
delimiter //
create procedure cursores14()
begin
	DECLARE a,b varchar(50); 
	DECLARE x int default 0;
	DECLARE contA, contB int default 0;
	DECLARE cursorA CURSOR FOR select nombre from cliente;
	DECLARE cursorB CURSOR FOR select nom from videoclub.client;
	
	set contA=(select count(nombre) from cliente);
	
	open cursorA;
	eti1:loop
		FETCH cursorA into a;
		open cursorB;
		set contB=(select count(nom) from videoclub.client);
		eti2:loop
			FETCH cursorB into b;
			IF a=b then select a '¡Coincidencia!'; select 1 into x;  END IF;
			set contB=contB-1;
			if contB=0 then leave eti2; end if;
		end loop;
		close cursorB;
		set contA = contA-1;
		if contA =0 then leave eti1; end if;
	end loop;
	if x=0 then select 'No hay coincidencias' as 'Resultado final';
		else select 'No hay más coincidencias' as 'Resultado final';
	end if;
	close cursorA;
end//
delimiter ;


	