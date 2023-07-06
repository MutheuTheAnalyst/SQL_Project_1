#CREATE DATABASE
create database PortfolioProject;
use PortfolioProject;

#IMPORT BIKE PURCHASE TABLE&CONFIRM TABLE SCHEMA LOADED CORRECTLY
describe portfolioproject.`bike purchase`;

#DISPLAY DATA CONTAINED IN BIKE PURCHASE TABLE
SELECT * FROM portfolioproject.`bike purchase`;

#CONFIRM NO DUPLICATE RECORDS EXIST AND TAKE NOTE OF SAMPLE SIZE
select count(distinct id) as sample_size from portfolioproject.`bike purchase`;

#DATA EXPLORATION
#Display the average income of female and male clients
select gender,avg(income) 
from portfolioproject.`bike purchase`
group by gender;

#Comparision between the average income of bike purchasers and non-bike purcharsers
select Gender,`Purchased Bike`,round((avg(income)),2) as average_income
from  portfolioproject.`bike purchase`
 group by `Purchased Bike`,Gender
 order by average_income desc;
 
 #Comparision between commute distance of bike purchasers and non-bike purchasers
 select `Commute Distance`,`Purchased Bike`,count(`Purchased Bike`) as no_of_people
 from portfolioproject.`bike purchase`
 group by `Commute Distance`,`Purchased bike`
 order by `commute distance`;
 
 #Comparision of bike purchase in terms of age brackets
 select `Age brackets.`,`Purchased Bike`,count(`Purchased Bike`) 
 from portfolioproject.`bike purchase`
 group by  `Age brackets.`,`Purchased bike`
 order by `Age brackets.`;
 
 #Display the Bike purchasers with above income average
 select * from portfolioproject.`bike purchase`
 where `Purchased Bike` = 'Yes' and income > (select avg(income) from portfolioproject.`bike purchase`);
 
 # occupations with an income average above 10
select Occupation,avg(income) as average_income
from portfolioproject.`bike purchase`
group by Occupation
having avg(income) > 10;

#Create a view that contains clients that purchased bikes in addittion to  key variables from  the `bike purchase` table.
create view key_vars as
 select ID,`Purchased Bike`,`Commute Distance`,Income,`Age brackets.` from portfolioproject.`bike purchase` where `Purchased Bike` = 'Yes';
 
  #Display views available in the database
 show full tables
 where table_type='VIEW';
 
 #Display records from the `key_vars` view
 select * from key_vars;
 
 #Add row field to `key_vars` view
 select row_number() over (order by Income desc) as row_num, ID, `Purchased Bike`,`Commute Distance`,Income,`Age brackets.`
 from key_vars;
 
 #Display records from `key_vars' partitioned by `Commute Distance`
 select ID,`Purchased Bike`,`Commute Distance`,`Age brackets.`,avg(income) over (partition by `Commute Distance`) as average_salary
 from key_vars;

 #Total number of bike purchasers per age bracket
select `Age brackets.`,count(ID) as age_group_total
from key_vars
group by `Age brackets.` ;

#drop key_vars view
drop view key_vars;
 
##End of Data Exploration.


 
 

