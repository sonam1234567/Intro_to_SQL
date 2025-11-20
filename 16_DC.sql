-- Data Cleaning
-- Use `world_layoffs`;

-- select * from world_layoffs.layoffs;

LOAD DATA LOCAL INFILE '/Users/sonamsherpa/Desktop/Intro_to_SQL/Data_Sets/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;