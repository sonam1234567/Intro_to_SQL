-- The select query below selects everything from a table of a specific database.
SELECT * FROM Parks_and_Recreation.employee_demographics;
select * from Parks_and_Recreation.employee_salary;

-- The select query below select the table with a limit of data row 2.
select * from Parks_and_Recreation.parks_departments limit 2;

-- The below query selects only the required columns from a table.
select first_name,last_name, birth_date from Parks_and_Recreation.employee_demographics;

-- Now we are selecting the particular columns and creating a age column increased with a value of 10.
select first_name,age, age + 10 from Parks_and_Recreation.employee_demographics;

-- To select a unique values.
select distinct first_name, gender from Parks_and_Recreation.employee_demographics;

select * from Parks_and_Recreation.employee_demographics;




