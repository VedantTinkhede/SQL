SELECT * FROM employee_demographics;

SELECT first_name,last_name,birth_date,age,(age + 10)*10    # this is comment
FROM employee_demographics;

SELECT distinct first_name, gender FROM employee_demographics;    # here the compiler will check if the combination of name and gender is distinct. As the combos are unique, it will display everything.