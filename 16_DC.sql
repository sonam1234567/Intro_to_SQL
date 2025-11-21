-- Data Cleaning
-- 1.Staging the datasets.

-- 2.Remove Duplicates

-- 3. Standardize the data

-- 4. Null Values or blank values

-- 5. Remove any columns


-- 1.Staging the datasets.
-- When cleaning the data we don't want to touch the raw data sets so we create a staging data to be on the safer side.
drop table if exists layoffs_staging;
Create table layoffs_staging
like layoffs;

select * from world_layoffs.layoffs_staging;

-- Inserting the data into the staging table.
insert world_layoffs.layoffs_staging select * from world_layoffs.layoffs;

select * from world_layoffs.layoffs_staging;

-- 2.Remove Duplicates
with duplicate_removal as
(select *,row_number()over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num from world_layoffs.layoffs_staging)
select * from duplicate_removal where row_num > 1;

select * from world_layoffs.layoffs_staging where company = 'Casper';

select *,row_number()over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num from world_layoffs.layoffs_staging;

-- This is not allowed so we create a new table where we can row_number.
ALTER TABLE world_layoffs.layoffs_staging 
ADD RowNum int as (ROW_NUMBER() OVER (partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)) first;


-- select * from world_layoffs.layoffs limit 50;
-- Adding a column(Primary Key) and also adding it to the first position in column.
ALTER TABLE world_layoffs.layoffs
ADD ID_NUM INT PRIMARY KEY AUTO_INCREMENT First;

select * from world_layoffs.layoffs;

alter table world_layoffs.layoffs
drop ID_Num;

