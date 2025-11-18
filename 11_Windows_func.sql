-- Windows Function

select trim(concat(first_name, ' ' , last_name)) as full_name from Parks_and_Recreation.employee_demographics;

select gender,avg(salary) from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id 
group by gender;

-- window function(over())
-- we get average salary on the basis of gender.
select dem.first_name,dem.last_name,avg(salary) OVER(partition by gender)
from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;

-- doing a rolling total
select dem.first_name,dem.last_name,salary,sum(salary) OVER(partition by gender order by dem.employee_id) as rolling_table
from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;


-- row number( row doesn't look at duplicate values, but rank ranks the duplicate row as same.)
-- where as dense rank gives rank on the basis of row and doesn't skip the rank number.
select dem.employee_id,dem.first_name,dem.last_name,salary,gender, row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id;

select * from Parks_and_Recreation.employee_demographics;
select * from Parks_and_Recreation.employee_salary;
select * from Parks_and_Recreation.parks_departments;

-- Joining 3 tables.
select * from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on sal.employee_id = dem.employee_id
join Parks_and_Recreation.parks_departments as PD
on sal.dept_id = PD.department_id;
