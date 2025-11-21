-- Exploratory Data Analysis

select * from world_layoffs.layoffs_staging2;

-- Need to convert the total_laid_off,percentage_laid_off and funds_raised_millions to int data type inorder to perform max min and other calculations.
Alter table world_layoffs.layoffs_staging2
modify column total_laid_off INT;

Alter table world_layoffs.layoffs_staging2
modify column percentage_laid_off INT;

Alter table world_layoffs.layoffs_staging2
modify column funds_raised_millions INT;

select max(total_laid_off),max(percentage_laid_off) from world_layoffs.layoffs_staging2;

select min(total_laid_off),min(percentage_laid_off) from world_layoffs.layoffs_staging2;
