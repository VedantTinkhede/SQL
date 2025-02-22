-- GROUP BY (group values of a column to apply aggregate functions on them)
select * from employee_demographics;

select gender, avg(age), max(age), min(age),count(age) from employee_demographics group by gender;


-- ORDER BY (the result set in either ascending or descending order)

select * from employee_demographics order by first_name;     # sort first_name in asc. order by default
select * from employee_demographics order by first_name desc; # sorting in reverse alphabetical order
select * from employee_demographics order by gender; 
select * from employee_demographics order by age;
select * from employee_demographics order by gender, age;  # sort by age after sorting by gender
select * from employee_demographics order by age, gender; # sort by gender after sorting by age


