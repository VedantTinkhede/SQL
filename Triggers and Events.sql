-- Triggers and Events
-- trigger is a block of code which is executed 'automatically' when some certain conditions/events are arised/met

select * from employee_salary;
select * from employee_demographics;

delimiter $$ 
create trigger employee_insert
	after insert on employee_salary   -- will work after an insertion in emp_sal table (we also have before for deletion or updation)
    for each row 					  -- will work on each of those rows
begin
	insert into employee_demographics (employee_id, first_name, last_name) 
    values (new.employee_id, new.first_name, new.last_name);		-- new signifies the row inserted (old is for deleted or updated rows)
end $$
delimiter ;

insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values (13,'john','russo','sports','1000000',null);



-- Events (things happening on schedule)

select * from employee_demographics;
delimiter $$
create event delete_retires
on schedule every 30 second
do
begin
	delete from employee_demographics
	where age>=60;
end $$
delimiter ;