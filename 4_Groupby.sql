-- Group By

-- We are grouping by gender and then getting the average age of male and female.
select gender, avg(age) from Parks_and_Recreation.employee_demographics group by gender;

-- we are getting the minimum age by gender.
select gender, min(age) from Parks_and_Recreation.employee_demographics group by gender;

-- we are getting the maximum age and the number of female and male.
select gender, max(age),count(age) from Parks_and_Recreation.employee_demographics group by gender;

select occupation, salary from Parks_and_Recreation.employee_salary group by occupation, salary;

-- order by
-- The below query sort the result on the basis of gender in ascneding order and age in descending order.
select * from Parks_and_Recreation.employee_demographics order by gender, age desc;

-- ordering by column numbers.
select * from Parks_and_Recreation.employee_demographics order by 4,5;

select * from Parks_and_Recreation.employee_demographics;

-- deleting a row with certain condition.
delete from Parks_and_Recreation.employee_demographics where employee_id = 20;

-- Having vs Where.

-- only having average of age greater than 40.
select gender, avg(age) from Parks_and_Recreation.employee_demographics group by gender having avg(age) > 40;

-- having works only for aggreagated functions after the group by runs.
-- if we have to filter on the aggregated funtions we have to use having clause.
select occupation, avg(salary) 
from Parks_and_Recreation.employee_salary 
where occupation like '%manage%' 
group by occupation 
having avg(salary) > 75000;


