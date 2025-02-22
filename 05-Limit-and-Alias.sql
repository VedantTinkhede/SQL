-- LIMIT and ALIASING

select * from employee_demographics limit 3;  # will limit to only 3 rows

# for 3 oldest employees
select * from employee_demographics order by age desc limit 3;

-- Aliasing  (like a nick-name for a column)
select gender, avg(age) as avg_age  from employee_demographics group by gender having avg_age>40; # we named the result of avg(age) as avg_age
select gender, avg(age)    avg_age  from employee_demographics group by gender having avg_age>40;  # we don't actually need 'as' keyword