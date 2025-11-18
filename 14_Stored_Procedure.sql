-- Stored Procedure( It is a  way to save a SQL code so we can reuse it.)
DELIMITER $$ 
create Procedure large_salaries2()
BEGIN
select * from Parks_and_Recreation.employee_salary where salary >= 50000;
select * from Parks_and_Recreation.employee_salary where salary >= 10000;
END $$
DELIMITER ;

call large_salaries2();

-- Passing Parameter in Procedure.
DELIMITER $$
create Procedure large_salaries3(id INT)
BEGIN
	select salary from Parks_and_Recreation.employee_salary where employee_id = id;
END $$
DELIMITER ;

call large_salaries3(1);

USE `Parks_and_Recreation`;
DROP procedure IF EXISTS `large_salaries4`;
DELIMITER $$
create Procedure large_salaries4(id INT)
BEGIN
	select * from Parks_and_Recreation.employee_salary where dept_id = id;
END $$
DELIMITER ;

call large_salaries4(1);

select * from Parks_and_Recreation.employee_salary;