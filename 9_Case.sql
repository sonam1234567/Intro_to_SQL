-- Case Statement

select first_name,last_name,age,
(CASE
	When age <=30 Then 'Young'
    When age between 31 and 50 then 'old'
    when age >= 50 then "On death's door"
End) as Age_Bracket
 from Parks_and_Recreation.employee_demographics;
 
 -- Pay Increase and Bonus
 -- < 50000 = 5%
 -- > 50000 = 7%
 -- Finance = 10% bonus
 
select salary,
left(Case
	when salary < 50000 then (((salary * 5)/100) + salary) 
    when salary > 50000 then (((salary * 7)/100) + salary) 
end,7) as Pay_Increase,
left(case
	when department_name = 'Finance' then (((salary * 10)/100)) 
end,7) as Bonus_Pay
from Parks_and_Recreation.employee_salary
inner join Parks_and_Recreation.parks_departments
on dept_id = department_id;


 