-- Where Clause(it sets the condition.)

-- Here we are only selecting row which consists of salary greater than 50000.
select * from Parks_and_Recreation.employee_salary where salary > 50000;

-- Selects only the male gender.
select * from Parks_and_Recreation.employee_demographics where gender != 'Female';

-- Selects only the row with birthdate greater than 1985-01-01 and gender is male.
select * from Parks_and_Recreation.employee_demographics where birth_date > '1985-01-01' And gender = 'male';

-- Selects only the row with greater than 1985-01-01 or gender is not male.
select * from Parks_and_Recreation.employee_demographics where birth_date > '1985-01-01' or not gender = 'male';

select * from Parks_and_Recreation.employee_demographics where (first_name = 'Leslie' And age = 44) or age > 55;

-- Using the like statement.
-- % meaning anything and _ meaning specific value.
select * from Parks_and_Recreation.employee_demographics where first_name like '%er%';
-- where anything starts with a for first_name and after values can be anything.
select * from Parks_and_Recreation.employee_demographics where first_name like 'a%';

-- where anything starts with 'a' first_name and after values should be at least 2 character and can have anything after it.
select * from Parks_and_Recreation.employee_demographics where first_name like 'a__%';