--Carly Dobie
--Z1859292
--CSCI 466, Fall 2019
--Assignment 6

--Select BabyName database
USE BabyName; 
--Show all the tables in the database
SHOW TABLES; 
--Show all of the columns and their types for each table in the database
DESCRIBE BabyName;
--Show all of the years (once only) where your first name appears 
SELECT DISTINCT year 'years that Carlys existed' FROM BabyName 
    WHERE name='Carly';
--Show all of the names from your birth year (Showing each name only once) 
SELECT DISTINCT name 'names in 1997' FROM BabyName 
    WHERE year='1997';
--Display the most popular male name from 1997 
SELECT name 'most popular male name in 1997', count FROM BabyName 
    WHERE year='1997' AND gender='M' 
    ORDER BY count DESC LIMIT 1;
--Display the most popular female name from 1997 
SELECT name 'most popular female name in 1997', count FROM BabyName 
    WHERE year='1997' AND gender='F' 
    ORDER BY count DESC LIMIT 1; 
--Show all the information available about similar names
--sorted in alphabetical order by name, by count, and by the year
SELECT name 'similar names', count, gender, year, place FROM BabyName 
    WHERE SOUNDEX(name)=SOUNDEX('Carly')            
    ORDER BY name, count, year;
--Show how many rows there are in the table 
SELECT COUNT(*) AS 'number of rows in table' FROM BabyName;
--Show how many names there were in the year 1963 
SELECT COUNT(DISTINCT name) AS 'names in 1963' FROM BabyName 
    WHERE year='1963'; 
--Show how many male names from the year 1953
SELECT COUNT(DISTINCT name) AS 'male names in 1953' FROM BabyName 
    WHERE year='1953' AND gender='M';
--Show how many female names from the year 1953 
SELECT COUNT(DISTINCT name) AS 'female names in 1953' FROM BabyName 
    WHERE year='1953' AND gender='F';
--List how many different names there are for each place 
SELECT DISTINCT place, COUNT(DISTINCT name) AS 'number of names' FROM BabyName
    GROUP BY place; 

