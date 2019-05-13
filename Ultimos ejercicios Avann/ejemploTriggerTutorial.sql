-- Esto es un ejemplo de la web de mysql tutorial.org Create Trigger in MySQL
-- http://www.mysqltutorial.org/create-the-first-trigger-in-mysql.aspx

-- Tenemos una tabla clientes 
CREATE TABLE employees (
    employeeNumber INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- insertaremos un registro en esta tabla antes de que se haga un cambio en la tabla empleados
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

-- este trigger inserta una fila en la tabla employees_audit antes de que la tabla empleados cambie
DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.name,
        changedat = NOW(); 
END$$
DELIMITER ;

insert into employees values (1, "Andres");

UPDATE employees 
SET name = 'Phan'
WHERE employeeNumber = 1;