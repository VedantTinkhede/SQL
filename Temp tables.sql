-- Temporary Tables  (only visible for the session they are created in. Like the RAM, once you close the application, it's gone)

-- 1st way to create

create temporary table temp_table
(
first_name varchar(50), last_name varchar(50), fav_movie varchar(50)
) ;

insert into temp_table values ('alex','henry','300');
select * from temp_table;


-- 2nd way to create

create temporary table salary_over_50K
(
select * from employee_salary where salary >= 50000
);

select * from salary_over_50K;
