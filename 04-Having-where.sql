-- HAVING Vs WHERE

# having can only be used after the 'group by' has run 
# having is used for aggregate functions ex:
select occupation, avg(salary) from employee_salary where occupation like '%manager%' group by occupation having avg(salary) > 50000;
# the execution of this statement is: 1] search for 'manager' because of like clause
									# 2] group the manager by occupation
                                    # 3] calculate their avg salary
                                    # 4] print the occupation and avg(salary)
                                    



