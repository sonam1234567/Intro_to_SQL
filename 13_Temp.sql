-- Temporary Tables( A temporary table.)(It exisit as long as we are in the current session.)

Create temporary table temp_table
(
firt_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);


select * from temp_table;

insert into temp_table
Values('Sonam','Sherpa','Lord of the Rings');

select * from Parks_and_Recreation.employee_salary;

Create temporary table salary_over_50k
(
select * from Parks_and_Recreation.employee_salary where salary >= 50000
);
select * from temp_table1;

-- creating a temporary table that contains the salary of only the dept_id 1
Create temporary table id_one
(
select salary,department_id from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
join Parks_and_Recreation.parks_departments as PD
on PD.department_id = sal.dept_id
);

select * from id_one where department_id = 1;