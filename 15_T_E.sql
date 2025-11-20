-- Triggers and Events
Use `Parks_and_Recreation`;

DELIMITER $$
Create Trigger employee_insert
	After insert on Parks_and_Recreation.employee_salary
    For each row 
Begin
	insert into Parks_and_Recreation.employee_demographics (employee_id, first_name,last_name)
    values (new.employee_id,new.first_name,new.last_name);
End $$
Delimiter ;


insert into Parks_and_Recreation.employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
values(13,'JR','Smith','CEO',10000000,null);

select * from Parks_and_Recreation.employee_salary;
select * from Parks_and_Recreation.employee_demographics;


-- Events( It is for scheduling)
select * from Parks_and_Recreation.employee_demographics;

DROP event IF EXISTS `delete_retirees`;

Delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete from Parks_and_Recreation.employee_demographics where age >=60;
end $$
delimiter ;

-- check the event is on or not.
show variables like 'event%';