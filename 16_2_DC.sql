-- Since we have imported the data from json file all the values along with Null is represented as text.
-- Creating a layoffs_Staging2 for deleting the duplicates.
drop table if exists layoffs_staging2;
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into world_layoffs.layoffs_staging2
select *,row_number()over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from world_layoffs.layoffs_staging;

-- Deleting the duplicate values.
delete from world_layoffs.layoffs_staging2 where row_num > 1;

select * from world_layoffs.layoffs_staging2 where row_num > 1;

-- 3. Standardize the data

-- select company,trim(company) from world_layoffs.layoffs_staging2;
update world_layoffs.layoffs_staging2 as stage
set stage.company = trim(company);

select distinct industry from world_layoffs.layoffs_staging2 order by 1;

select * from world_layoffs.layoffs_staging2 where industry like 'Crypto%';

-- Updating the Crypto insdurtry to look similar.
update world_layoffs.layoffs_staging2 as stage
set stage.industry = 'Crypto'
where industry like 'Crypto%';

-- checking the location data.
select distinct location from world_layoffs.layoffs_staging2 order by 1;

-- checking the country data.
select distinct country from world_layoffs.layoffs_staging2 order by 1;

update world_layoffs.layoffs_staging2 as stage
set stage.country = trim(trailing '.' from stage.country)
where country like 'United States%';

-- checking the dates.(Currently it is in text format.)
select date, str_to_date(date,'%m/%d/%Y') from world_layoffs.layoffs_staging2;

-- Need to update the null date values.
-- converting the date to 'Null' string type to NULL.
update world_layoffs.layoffs_staging2
set date = null where date = 'NULL';

select * from world_layoffs.layoffs_staging2 where date is Null or date = '';


update world_layoffs.layoffs_staging2
set date = str_to_date(date,'%m/%d/%Y');


-- Now we change the data type to date.
Alter table world_layoffs.layoffs_staging2
modify column date DATE;


select * from world_layoffs.layoffs_staging2 where date = 'Null';
select * from world_layoffs.layoffs_staging2 where company = 'Blackbaud';

-- 4. Null Values or blank values
-- checking for if the column consists of null or blank values.
-- Here we are not using is null as we have set the null to data type of text when creating the table.
select * from world_layoffs.layoffs_staging2 where company = ' ' or company = 'null';
select * from world_layoffs.layoffs_staging2 where location = 'NULL' or location = '';
select * from world_layoffs.layoffs_staging2 where industry is NULL or industry = '';
-- It is quite tryicky if we need to delete these data. But if both the percentage_laid_off and total_laid_off is Null or blank I beleive that data wont affect much.
select * from world_layoffs.layoffs_staging2 where total_laid_off is NULL or total_laid_off = '';
select * from world_layoffs.layoffs_staging2 where percentage_laid_off is NULL or percentage_laid_off = '';
select * from world_layoffs.layoffs_staging2 where date is NULL;
select * from world_layoffs.layoffs_staging2 where stage is NULL or stage = '';
select * from world_layoffs.layoffs_staging2 where country = 'NULL' or country = '';
select * from world_layoffs.layoffs_staging2 where funds_raised_millions is NULL or funds_raised_millions = '';


-- Since we found there are some blank in the industry column so we check if there is any way we can insert those data from the existing data sets.
select distinct industry from world_layoffs.layoffs_staging2;

-- This null value of the industry cant be identified from teh data sets so we need to ask the team what to fill here in industry for company = "Bally's Interactive"
select * from world_layoffs.layoffs_staging2 where company = "Bally's Interactive";
select * from world_layoffs.layoffs_staging2 where company = "Airbnb";

update world_layoffs.layoffs_staging2
set industry = 'Travel' where company = 'Airbnb';

select * from world_layoffs.layoffs_staging2 t1
join world_layoffs.layoffs_staging2 t2
on t1.company = t2. company
where (t1.industry = '')
and t2.industry != '';

update world_layoffs.layoffs_staging2 t1
join world_layoffs.layoffs_staging2 t2
on t1.company = t2. company
set t1.industry = t2.industry
where (t1.industry = '')
and t2.industry != '';

-- Finding all those rows with percentage_laid_off and total_laid_off as null or blank.( Need to check with team just to be sure.)
select * from world_layoffs.layoffs_staging2 where 
(total_laid_off = 'null' or total_laid_off = ' ') 
and (percentage_laid_off = 'null' or percentage_laid_off = ' ');

-- Deleting all the null rows with percentage_laid_off and total_laid_off as null or blank.
delete from world_layoffs.layoffs_staging2 where 
(total_laid_off = 'null' or total_laid_off = ' ') 
and (percentage_laid_off = 'null' or percentage_laid_off = ' ');

-- 5. Remove any columns
-- Dropping the columns that are not needed.( Since we created row_num just to see the duplicay of data now we can drop it.)
alter table world_layoffs.layoffs_staging2
drop column row_num;

select * from world_layoffs.layoffs_staging2;

-- Need to remove or do something about the null data in date inorder to proceed with above step.
-- Now converting all the string 'Null' to null.
update world_layoffs.layoffs_staging2
set industry = null where industry = 'NULL';

update world_layoffs.layoffs_staging2
set total_laid_off = null where total_laid_off = 'NULL';

update world_layoffs.layoffs_staging2
set percentage_laid_off = null where percentage_laid_off = 'NULL';

update world_layoffs.layoffs_staging2
set funds_raised_millions = null where funds_raised_millions = 'NULL';

update world_layoffs.layoffs_staging2
set stage = null where stage = 'NULL';


