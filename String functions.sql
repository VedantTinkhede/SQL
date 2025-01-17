-- String functions


select length('skyfall') ;-- gives the length of the string
select first_name,length(first_name) "name length" from employee_demographics order by 2;  -- 2 represents the second column name length
select upper('sky'); -- everything in upper-case
select lower('Sky'); -- everything in lower-case
select upper(first_name) from employee_demographics;


select trim('      sky is best    ');   -- trim removes the whitespaces from both ends
select ltrim('      sky is best    ');   -- ltrim removes the whitespaces from left end only
select rtrim('      sky is best    ');   -- rtrim removes the whitespaces from right end only

select left(first_name,3) from employee_demographics; -- left will print 3 characters from left
select right(first_name,4) from employee_demographics; -- right will print 4 characters from right
select first_name,substring(birth_date,6,2) birth_month from employee_demographics; -- substring will print 2 characters starting from position 6

select first_name, replace(first_name,'A','Z') from employee_demographics; -- will replace the a's in first_name with z.

select locate('x','Alexander'); -- returns the position of x in the given string else returns 0
select first_name,locate('r',first_name) from employee_demographics;

select concat(first_name, " ",last_name," (",gender,")") "Full name" from employee_demographics;  -- jaisa naam waisa kaam