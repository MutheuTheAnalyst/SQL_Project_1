## SQL_Project_One

## **Introduction**

* In this project, a cleaned and transformed 'bike purchase' dataset that contains information on 'bike purchase by different individuals with discrete attributes' is presented.

* My **aim** is to **analyze** the dataset **on MYSQL database management system** using the **SQL language** in order to **draw insights** that will **guide the bike seller** in making **informed marketing decisons** hence improving his/her bike sales.

## **Purpose of the project**

**1)**. Identify which demographic of our identifiers purchased bikes more compared to their counterparts.

 -This will grant the bike seller insight on which demographic to market more to in order to maximize bike sales.

**2)**. Identify which demographics are underexplored and have a potential to purchase bikes at a high rate.

 -This will guide the bike seller in diverting marketing targets from demographics that are least interested in bike purchase to demographics that have a greater potential to purchase more bikes.

 ## **Dataset Overview**
 * The dataset is **obtained from** the open source plattform **'Kaggle'** and is accessible to the general public for use.
   
 * Upon obtaining the dataset from kaggle,I **cleaned and transformed it on Microsoft Excel** to prepare it for data analysis.

 * On MYSQL workbench,I **created a database** by the name 'PortfolioProject' and using the **MYSQL export feature**,I  **exported the 'bike purchase' dataset** into the created database.The dataset is loaded as a **table,namely:portfolioproject.`bike purchase`.**

* To confirm whether the **dataset exported correctly**, I ran the query: describe portfolioproject.`bike purchase`; From running this query, I observed that the **fields** of the tables are in the **right data format.**

 * The **fields** are **namely**:Marital status,Gender,Income,Children,Education,Occupation,Home owner,Cars,Commute,Region,Age,Purchased bike.

* The fields are the attributes of identifiers that may have influenced their decision of whether or not to purchase a bike.

* In addittion,to **confirm** whether **all records were exported correctly**,I ran the query: select * from portfolioproject.`bike purchase`; This **query displays all the records and fields** in the dataset.It's observed that the **dataset contains 1000 records**.

* Proceeding further,I confirmed that the dataset **does not contain any duplicates**.This by using the **distinct function** i.e select count(distinct id) as sample_size from portfolioproject.`bike purchase`; .This query still return query 1000 records.


## **Data Exploration**
**1).** Number of people per gender.

   - **Query**; select gender,count(*) as total_people from portfolioproject.`bike purchase` group by gender order by total_people desc;
     
   - From this query, we deduce that the **total number** of **male identifiers(511)** are more in number than the **female identifiers (489)**.
     
 **2).** Compare the average income of male and female identifiers.

   - **Query**; select gender,avg(income) from portfolioproject.`bike purchase` group by gender;
   
   - From this query, we deduce that the **average income** of **male identifiers(58.06)** is slightly higher than that of **female identifiers(54.58)**.

 **3).** Only display identifiers who purchased bikes and their income is above average.

   - **Query**; select * from portfolioproject.`bike purchase` where `Purchased Bike` = 'Yes' and income > (select avg(income) from portfolioproject.`bike purchase`);

   - This query returns **records** of identifiers that **purchased bikes and are of above average income status** .From this display,we have an overview of attributes possessed by this demographic of identifiers.

  **4).** Create a view that holds records of only identifiers that purchased bikes in addittion to all thier attributes.

   - **Query**; create view key_vars as select ID,`Purchased Bike`,`Commute Distance`,Income,`Age brackets.` from portfolioproject.`bike purchase` where `Purchased Bike` = 'Yes';

   - Confirm

 
 
    



