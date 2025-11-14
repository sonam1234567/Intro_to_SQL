-- Strings

-- We can the length of each first_name.( We can use this in case of phone numbers.)
select first_name,length(first_name) as Len from Parks_and_Recreation.employee_demographics order by 2;

-- For standarizaiton issue it works better.
select first_name,upper(first_name) as Upper from Parks_and_Recreation.employee_demographics order by 2;
select first_name,lower(first_name) as lower from Parks_and_Recreation.employee_demographics order by 2;

-- Trim(It trims the whitespaces.)
select trim('  sky  ');

select first_name, trim(first_name) from Parks_and_Recreation.employee_demographics;
select first_name, ltrim(first_name) from Parks_and_Recreation.employee_demographics;
select first_name, rtrim(first_name) from Parks_and_Recreation.employee_demographics;

-- selecting first 4 values from left and first 4 values from the right.
select first_name, left(first_name,4), right(first_name,4) from Parks_and_Recreation.employee_demographics;


-- SubString(Start from 3rd position and take 2 values after it.)
select first_name, substring(first_name,3,2) from Parks_and_Recreation.employee_demographics;
select birth_date, substring(birth_date,6,2) from Parks_and_Recreation.employee_demographics;

-- Replace
select first_name,replace(first_name, 'a','z') from Parks_and_Recreation.employee_demographics;

-- Locate
select first_name,Locate('An',first_name) from Parks_and_Recreation.employee_demographics;

-- concatenation
select first_name, last_name, concat(first_name,' ', last_name) as Full_Name from Parks_and_Recreation.employee_demographics;