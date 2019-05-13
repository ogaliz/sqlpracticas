SELECT * FROM world.city;

delimiter &&
create procedure proc1(CodigoPais varchar(3))
begin
	select city.Name from city where CountryCode = CodigoPais limit 5;
end&&
delimiter ;

call proc1('BRA');

drop procedure proc1;

select distinct continent from country;

-- creamos el procedimiento:
delimiter $$
create procedure paises_por_continente(
in codigo varchar(3),
out numero int
)
begin
	-- numero
	select count(country.Name) into numero from country where Continent like '%codigo%';
end$$
delimiter ;

drop procedure paises_por_continente;
call paises_por_continente("mer", @numero);
select @numero;

select count(country.Name) from country where Continent like '%mer%';