## SQL_Project_One

## **Introduction**

* In this project, a cleaned and transformed 'bike purchase' dataset that contains information on 'bike purchase by different individuals with discrete attributes' is presented.

* My **aim** is to **analyze** the dataset **on MYSQL database management system** using the **SQL language** in order to **draw insights** that will **guide the bike seller** in making **informed marketing decisons** hence improving his/her bike sales.

## **Purpose of the project**

**1)**. Identify which demographic of our identifiers purchased bikes more compared to their counterparts.

 -This will grant the bike seller insight on which demographic to market more to in order to maximize bike sales.

**2)**. Identify which demographics are underexplored and have a potential to purchase bikes at a high rate.

 -This will guide the bike seller in diverting marketing targets from demographics that are least interested in bike purchase to demographics that have a greater potential to purchase more bikes.

 ## **Dataset overview**
 * The dataset is **obtained from** the open source plattform **'Kaggle'** and is accessible to the general public for use.
   
 * Upon obtaining the dataset from kaggle,I **cleaned and transformed it on Microsoft Excel** to prepare it for data analysis.

 * On MYSQL workbench,I **created a database** by the name 'PortfolioProject' and using the **MYSQL export feature**,I  **exported the 'bike purchase' dataset** into the created database.The dataset is loaded as a **table,namely:portfolioproject.`bike purchase`.**

* To confirm whether the **dataset exported correctly**, I ran the query: describe portfolioproject.`bike purchase`; From running this query, I observed that the **fields** of the tables are in the **right data format.**

* In addittion,to **confirm** whether **all records were exported correctly**,I ran the query: select * from portfolioproject.`bike purchase`; This **query displays all the records and fields** in the dataset.It's observed that the **dataset contains 1000 records**.

* Proceeding further,I confirmed that the dataset **does not contain any duplicates**.This by using the **distinct function** i.e select count(distinct id) as sample_size from portfolioproject.`bike purchase`; .This still return query 1000 records.

