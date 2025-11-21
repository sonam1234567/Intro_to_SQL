-- Exploratory Data Analysis

select * from world_layoffs.layoffs_staging2;

-- Need to convert the total_laid_off,percentage_laid_off and funds_raised_millions to int data type inorder to perform max min and other calculations.
Alter table world_layoffs.layoffs_staging2
modify column total_laid_off INT;

Alter table world_layoffs.layoffs_staging2
modify column percentage_laid_off INT;

Alter table world_layoffs.layoffs_staging2
modify column funds_raised_millions INT;

-- Max funds raised details.
select * from world_layoffs.layoffs_staging2 where funds_raised_millions = 121900;

-- Company that laid off all their employees.( Here in the data set 1 means 100% of the employee laid off.)
select * from world_layoffs.layoffs_staging2 where percentage_laid_off = 1 order by total_laid_off desc;

-- total_laid_of sum for a company.
-- Seems like Amazon has the highest amount of layoff.
select company,sum(total_laid_off) from world_layoffs.layoffs_staging2 group by company order by 2 desc;

select company,YEAR(`date`),sum(total_laid_off) from world_layoffs.layoffs_staging2 group by company,YEAR(`date`) order by 3 desc;

-- The top 5 companies laying off by year.
with highest_layoff as
(select company,YEAR(`date`) as year,sum(total_laid_off) as TLO from world_layoffs.layoffs_staging2 group by company,YEAR(`date`)),
company_year as
(select *, Dense_rank() over(partition by year order by TLO desc) as ranking from highest_layoff where year is not null)
select * from company_year where ranking <= 5;

-- Seems like the Consumer industry got affected the most.
select industry,sum(total_laid_off) from world_layoffs.layoffs_staging2 group by industry order by 2 desc;

-- Look at which country had the highest layoffs.('United States', '256202')
select country,sum(total_laid_off) from world_layoffs.layoffs_staging2 group by country order by 2 desc;

-- look by year wise the total laid off.(2023 the layoff is incresing around the world.)
select Year(`date`),sum(total_laid_off) from world_layoffs.layoffs_staging2 group by Year(`date`) order by 1 desc;

-- checking the date range when the layoffs started.
select min(`date`),max(`date`) from world_layoffs.layoffs_staging2;

-- By stage 
select stage,sum(total_laid_off) from world_layoffs.layoffs_staging2 group by stage order by 2 desc;

-- Rolling total layoff.
select substring(`date`,1,7) as Month,sum(total_laid_off) from world_layoffs.layoffs_staging2 where substring(`date`,1,7) is not null group by Month order by 1;

with rolling_total as
(select substring(`date`,1,7) as Month,sum(total_laid_off) as total_Loff from world_layoffs.layoffs_staging2 where substring(`date`,1,7) is not null group by Month order by 1)
select Month, total_Loff,sum(total_Loff) over(order by Month) from rolling_total;

-- max 
select max(total_laid_off),max(percentage_laid_off) from world_layoffs.layoffs_staging2;

-- min
select min(total_laid_off),min(percentage_laid_off) from world_layoffs.layoffs_staging2;

select * from world_layoffs.layoffs_staging2;
