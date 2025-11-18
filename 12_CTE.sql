-- CTE(Common table expression)
-- Creating a commmon table expression and extracting informations.
with CTE_Example as
(select gender,avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id group by gender)
select avg(avg_sal) from CTE_Example;

-- creating a multiple CTE
-- creating 2 cte tabke and joining these 2 tables on the basis of common id.
with CTE_Dem as
(select employee_id,gender, birth_date from Parks_and_Recreation.employee_demographics
where birth_date > '1985-01-01'
),
CTE_DEM2 as
(select employee_id,salary from Parks_and_Recreation.employee_salary
where salary > 50000)
select * from CTE_dem
join CTE_DEM2
on CTE_dem.employee_id = CTE_DEM2.employee_id;


with CTE_Example (Gender,AVG_SAL,MAX_SAL,MIN_SAL,COUNT_SAL) as
(select gender,avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id group by gender)
select * from CTE_Example;


with table1 as
(select dem.first_name,dem.last_name from Parks_and_Recreation.employee_demographics as dem
join Parks_and_Recreation.employee_salary as sal
on dem.employee_id = sal.employee_id
)
select * from table1;
