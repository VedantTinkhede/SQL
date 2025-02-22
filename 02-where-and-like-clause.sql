-- WHERE CLAUSE
select * from employee_salary where first_name='Leslie';

select * from employee_salary where salary<=50000;

select * from employee_demographics where birth_date>'1985-01-01';


-- LOGICAL OPERATORS
select * from employee_demographics where NOT GENDER = 'Male' OR birth_date > '1985-01-01';

-- LIKE STATEMENT
-- % and _  (% is for anything and _ is for specific things)

select * from employee_demographics where first_name like 'Jer%';  # will display name which starts with 'Jer' and won't care what is after that (because of % sign).
select * from employee_demographics where first_name like '%er%'; # will display anything which contain 'er' and won't care what is before it or after it (because of % sign).

select * from employee_demographics where first_name like 'a%';
select * from employee_demographics where first_name like 'a__'; # will display name which starts with 'a' and has only two characters followed by it (because of _ sign);
select * from employee_demographics where first_name like 'a___'; # will display name which starts with a and is followed by 3 chars.
select * from employee_demographics where first_name like 'a___%'; # will display name starting with a, has atleast 3 chars followed by it .

select * from employee_demographics where birth_date like '1988%'; # will display where birth year is 1988.



