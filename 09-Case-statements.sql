-- Case statements

select first_name,last_name,age, 
case 							-- can also be written in one line
	when age<=30 then 'Young'
	when age between 31 and 50 then 'mid-age'
    else 'old'
end young_or_not
from employee_demographics;



-- Pay increase and bonuses
-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10% bonus
select * from employee_salary;
select * from parks_departments;
select first_name,last_name,salary old_salary,dept_id,
case
	when salary<50000 then salary + salary*5/100
    when salary>50000 then salary + salary*7/100
    
end new_salary,
case
	 when dept_id = 6 then salary + salary/10
     
end final_salary
from employee_salary;