-- Window functions

select gender, avg(salary) 
from employee_demographics ed 
join employee_salary es 
	on ed.employee_id = es.employee_id 
group by gender ;


select ed.first_name,ed.last_name,gender, avg(salary) over(partition by gender)
from employee_demographics ed 
join employee_salary es 
	on ed.employee_id = es.employee_id 
 ;
 
 select ed.employee_id,ed.first_name,ed.last_name,gender,salary, sum(salary) over(partition by gender order by ed.employee_id  )rolling_total
from employee_demographics ed 
join employee_salary es 
	on ed.employee_id = es.employee_id 
 ;
 
select ed.employee_id,ed.first_name,ed.last_name,gender,salary, 
row_number() over(partition by gender order by salary desc) row_num,
rank() over(partition by gender order by salary desc) rank_num,
dense_rank() over(partition by gender order by salary desc) dense_rank_num
from employee_demographics ed 
join employee_salary es 
	on ed.employee_id = es.employee_id 
 ;