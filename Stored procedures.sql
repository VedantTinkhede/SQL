-- Stored Procedures (reusable piece of code, which will execute everytime you 'call' the stored procedure)
create procedure large_salaries()
select * from employee_salary where salary>=50000;
call large_salaries();


create procedure large_salaries2()
select * from employee_salary where salary>=50000;
select * from employee_salary where salary>=10000;   -- this query did not become part of the procedure
call large_salaries2();


DELIMITER $$  -- (changing the delimiter from ; to $$, now $$ will tell when something ends which was previously done by ;) (we can also use // or some other signs)
create procedure large_salaries3()
begin
	select * 
    from employee_salary 
    where salary >= 50000;
	select * 
    from employee_salary 
    where salary >= 10000;    -- now both the queries are inside the procedure

end $$
DELIMITER ;  -- changing the delimiter back to ;
call large_salaries3();

-- Parameters


DELIMITER $$   
create procedure large_salaries4(emp_id int)
begin
	select * 
    from employee_salary 
    where employee_id = emp_id;
end $$
DELIMITER ; 
call large_salaries4(1);