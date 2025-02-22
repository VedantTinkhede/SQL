-- Data Cleaning

select * from layoffs;

-- 1. Remove duplicates 
-- 2. Standardize data
-- 3. Null/Blank values
-- 4. Remove any unnecessary columns

create table layoffs_staging	-- will create a blank table with same columns (created so that the raw data is safe)
like layoffs;
select * from layoffs_staging;
insert layoffs_staging  select * from layoffs;		-- inserting data from layoffs to layoffs_staging






-- 1. Remove duplicates

select *, row_number() over(partition by company, industry, total_laid_off, percentage_laid_off, `date`) row_num 	-- giving row numbers
from layoffs_staging;

with duplicate_cte as (
	select *, row_number() over(partition by company, stage, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) row_num 
	from layoffs_staging
)
select * from duplicate_cte where row_num > 1;    -- the rows returned are the duplicates

with duplicate_cte as (
	select *, row_number() over(partition by company, stage, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) row_num 
	from layoffs_staging
)
 delete from duplicate_cte where row_num > 1; -- we cannot change a cte
 
 
 CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2;

insert into layoffs_staging2 select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num 
	from layoffs_staging;		-- copied the result set into another table
    
delete from layoffs_staging2 where row_num > 1 ;   -- deleted duplicates
select * from layoffs_staging2 ;



-- 2. Standardizing the data

select  trim(company) from layoffs_staging2 ;  -- return trimmed whitespaces form company name

update layoffs_staging2 set company = trim(company);   -- actually updating the values
select  (company) from layoffs_staging2 ; 

select  distinct(industry) from layoffs_staging2 order by 1; -- here crypto, cryptocurrency, and crypto currency are shown as different industries but they are not 
select * from layoffs_staging2 where industry like 'Crypto%'; 


update layoffs_staging2 set industry = 'Crypto' where industry like 'Crypto%';  -- changed them to just Crypto

select distinct(country) from layoffs_staging2 order by 1;  -- here united states and united states. are present (we executed this query for every column and checked for such discrepancies)
update layoffs_staging2 set country = 'United States' where country like 'United States%';

select `date` from layoffs_staging2; -- str_to_date takes 2 parameters, column name and the format it is saved in -> m,d should be small and y should be capital
update layoffs_staging2 set `date`= str_to_date(`date`,'%m/%d/%Y');  -- date updated

alter table layoffs_staging2 modify column `date` date;   -- `date` was text, now it is date, it wouln't ahve been possible without changing the values to proper date format



-- 3. Removing NULL/Blank values

select * from layoffs_staging2 where industry is null or industry = '' ;
select * from layoffs_staging2 where company = 'Airbnb';
select * from layoffs_staging2 st1
join layoffs_staging2 st2 
	on st1.company = st2.company and st1.location = st2.location
where (st1.industry is null or st1.industry = '')and st2.industry is not null;

update layoffs_staging2 set industry = null where industry = '';
update layoffs_staging2 st1 join layoffs_staging2 st2 
	on st1.company = st2.company
set st1.industry = st2.industry 
where (st1.industry is null ) and (st2.industry is not null);



-- 4. Remove unnecessary columns or data 

delete from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null; -- they provide no promising information

alter table layoffs_staging2 
drop column row_num;				-- this column is now no longer needed

select * from layoffs_staging2;