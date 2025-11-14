-- Joins

-- Inner joins(We are joining two tables on teh basis of the common tabel.)( It returns row that are same in both column in both table.)
select * from Parks_and_Recreation.employee_demographics as dem
inner join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;

-- If we have similar column in both the table we need to specifiy which table we are refering to take the values from.
select dem.employee_id,age,occupation from Parks_and_Recreation.employee_demographics as dem
inner join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;

-- Outer join(Left join and right join)

-- left join takes everything from the left table even if there is no matches between left and right table, and finally return values from right table that matches the left table.
select * from Parks_and_Recreation.employee_demographics as dem
left join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;

-- Right join takes everything from the right table even if there is no matches between left and right table, and finally return values from left table that matches the right table.
select * from Parks_and_Recreation.employee_demographics as dem
right join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;

-- self join(Join that ties a table to itself.)
select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from Parks_and_Recreation.employee_salary as emp1
join Parks_and_Recreation.employee_salary as emp2
on emp1.employee_id + 1 = emp2.employee_id;


-- Joining multiple tables together.( we can tie multiple table with each other if we have common table between then.)
select * from Parks_and_Recreation.employee_demographics as dem
inner join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
inner join Parks_and_Recreation.parks_departments as pd
on sal.dept_id = pd.department_id;

select * from Parks_and_Recreation.parks_departments;
select * from Parks_and_Recreation.employee_salary;

select * from Parks_and_Recreation.employee_salary as Sal
inner join Parks_and_Recreation.parks_departments as PD
on Sal.dept_id = PD.department_id;