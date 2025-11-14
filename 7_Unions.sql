-- Unions( It allows us to combine rows together.)

-- Union gives all the distinct values.
select first_name,last_name from Parks_and_Recreation.employee_demographics
union
select first_name,last_name from Parks_and_Recreation.employee_salary
;

-- Union all gives all the values regardless of the duplicate result.
select first_name,last_name from Parks_and_Recreation.employee_demographics
union all
select first_name,last_name from Parks_and_Recreation.employee_salary
;

-- Here we are joining the results of multiple select statements.
select first_name,last_name, 'Old Man' as label from Parks_and_Recreation.employee_demographics where age > 40 and gender = 'Male'
union
select first_name,last_name, 'Old Lady' as label from Parks_and_Recreation.employee_demographics where age > 40 and gender ='Female'
union
select first_name,last_name, 'Highly Paid Employee' as label from Parks_and_Recreation.employee_salary where salary > 70000
order by first_name, last_name;
;

