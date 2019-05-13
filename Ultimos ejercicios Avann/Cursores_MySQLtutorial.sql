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
end //

-- Creamos una nueva tabla que nos muestre los cambios que se producen en la tabla empleados
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

-- Creamos un disparador que será llamado antes de que el cambio se produzca en la tabla empleados.
delimiter $$
create trigger before_employee_update
	before update on classicmodels.employees 
    for each row 
begin 
	insert into classicmodels.employees_audit 
    set action = 'update',
    employeeNumber = OLD.employeeNumber,
    lastname = OLD.lastname,
    changedat = NOW();
end$$
delimiter ; 

-- Actualizamos la tabla empleados para que salte su trigger: 
UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;

-- Comprobamos que la actualización se ha subido a la tabla nueva:  
SELECT * FROM employees_audit;


















