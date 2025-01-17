-- Subqueries

select * from employee_demographics where employee_id in (select employee_id from employee_salary where dept_id = 1)   ;
# 'select employee_id from employee_salary where dept_id = 1' will create a list --> this is our inner query
# now the employee_id from outer query will be matched with the created list and if it matches, will go to our result-set

select first_name, salary,
(select avg(salary) from employee_salary )avg_salary
from employee_salary;

select gender,avg(age),max(age),min(age),count(age) from employee_demographics group by gender;
select avg(`max(age)`) from (select gender,avg(age),max(age),min(age),count(age) from employee_demographics group by gender )  agg_table ;