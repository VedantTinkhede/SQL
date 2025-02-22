-- 	CTE (Common Table Expressions)  (better, standardized form of subqueries)

with cte_example as 
(
select gender,avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal,count(salary) count_sal
from employee_demographics ed join employee_salary es 
		on ed.employee_id = es.employee_id
group by gender
)

select * from cte_example;   -- cte's work only when executed just after their defination, like here
# because we are not creating a table or something of the sort nor are we saving it in memory. So, it is available for now and not later.
# select avg_sal from cte_example;  -- this query won't work now

select gender,avg_sal from (select gender,avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal,count(salary) count_sal
from employee_demographics ed join employee_salary es  on ed.employee_id = es.employee_id
group by gender) subquery; 

with cte_example as 
(
select employee_id, gender, birth_date
from employee_demographics where birth_date > '1985-01-01'
),
cte_example2 as
(
select employee_id, salary
from employee_salary where salary > 50000
)

select * from cte_example e1 join cte_example2 e2 on e1.employee_id = e2.employee_id ; 

