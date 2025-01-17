-- UNIONS (combine rows from separate tables)

select age, gender from employee_demographics
union 
select first_name, last_name from employee_salary;   # this statement will give age, gender, first_name, last_name but under the column names age and gender.

select first_name, last_name from employee_demographics
union 
select first_name, last_name from employee_salary; # by default union is distict union so, redundent values are ommited

select first_name, last_name from employee_demographics
union all		# 'union all' will remove the distinct feature and will also display similar values
select first_name, last_name from employee_salary; 

select first_name, last_name, 'Old man' as label from employee_demographics where age>=40 and gender = 'Male'
union
select first_name, last_name, 'Old woman' as label from employee_demographics where age>=40 and gender = 'Female' 
union
select first_name,last_name, 'Expensive' as label from employee_salary where salary>=75000 order by first_name,last_name;
