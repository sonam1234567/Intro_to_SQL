-- Subqueries(A query within a query.)

select * from Parks_and_Recreation.employee_demographics as dem 
where dem.employee_id in
(select sal.employee_id from Parks_and_Recreation.employee_salary as sal where dept_id = 1);

select first_name,salary, (select avg(salary) from Parks_and_Recreation.employee_salary) from Parks_and_Recreation.employee_salary;

select gender,avg(age),min(age),count(age) from Parks_and_Recreation.employee_demographics group by gender;

-- Below we created a derived table and from there we are extracting the average min age.
select avg(min_age) from (select gender,avg(age) as avg_age,min(age) as min_age,count(age) as count_age from Parks_and_Recreation.employee_demographics group by gender) as aggregated_table;

select avg(min_age) from (select gender,min(age) as min_age from Parks_and_Recreation.employee_demographics group by gender order by gender) as Dervied_table;