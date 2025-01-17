-- JOINS

select * from employee_demographics;
select * from employee_salary;

-- Inner join (returns the rows which are same in both tables for the specified columns)

select * from employee_demographics ed join employee_salary es on ed.employee_id = es.employee_id;  # * means everything from both tables
select ed.first_name, es.occupation from employee_demographics ed join employee_salary es on ed.employee_id = es.employee_id;
# here we are printing first_name from 'demographics' table and occupation from 'salary' table when emp_id of first table matches that of the second table.
# that is why emp_id 2 will not appear in result set as it is present in demographics but not in salary and hence is not a match.

-- Outer joins (left, right, and full joins)

select * from employee_demographics ed left join employee_salary es on ed.employee_id = es.employee_id;  -- LEFT JOIN
# this will print everything from left table and if there is no match in the right tables, it will keep it empty
# here left table did not have emp_id = 2 so it didn't consider the presence of it in the right table

select * from employee_demographics ed right join employee_salary es on ed.employee_id = es.employee_id; -- RIGHT JOIN
# this will consider everuthing from the right tables anad if there is no match in the left table, it will keep it empty
# we had emp_id 2 in right table but not in left table so, for emp_id = 2 in left table, everything is NULL

# Full join in MySQL is implemented using UNION 


-- Self Join

# consider that each employee will be paired with the next employee in the table
select * from employee_demographics ed1 join employee_demographics ed2 on ed1.employee_id + 1 = ed2.employee_id;
# here emp_id = 2 is absent so, (1 & 2) and (2 & 3) cannot be paired. 

-- Joining multiple tables together

select * from employee_demographics ed join employee_salary es on ed.employee_id = es.employee_id  # joining ed with es
									   join parks_departments pd on es.dept_id = pd.department_id; # joining es with pd as they have common column, dept_id
;





