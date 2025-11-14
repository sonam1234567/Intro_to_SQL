-- Limit

-- Getting the oldest 3 employee values.
select * from Parks_and_Recreation.employee_demographics order by age desc limit 3;

-- Start at position 1 and 2 means we are taking the 2 rows after it.
select * from Parks_and_Recreation.employee_demographics order by age desc limit 1,2;


-- Aliasing 
select gender, avg(age) as Avg_age from Parks_and_Recreation.employee_demographics group by gender having Avg_age > 40;

select gender,avg(age) as Average_Age,min(age) as Min_Age,max(age) as Max_Age from Parks_and_Recreation.employee_demographics group by gender;
