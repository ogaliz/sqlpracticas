-- 1
/*
create function funciones21(numero smallint)
		returns decimal(8,2)
		return (select sum(importe) from DETALLE  where com_num=numero group by com_num);
-- 2
create function funciones22 (codigo smallint)
returns varchar(100)
return (select concat(NOMBRE,' ', DIRECCIÓN,' ', CIUDAD,' ',ESTADO,' ',CODI_POSTAL) from cliente where cliente_cod=codigo);

-- 3
delimiter //
create function funciones23(var1 char(1), var2 char(1))
returns char(1)
begin 
	if var1>var2 then
		return var1;
	elseif var2>var1 then 
		return var2;
	else return 0;
	end if;
end//