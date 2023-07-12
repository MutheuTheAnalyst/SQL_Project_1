## SQL_Project_One

## **Introduction**

* In this project, a clean and transformed 'bike purchase' dataset is presented.

* My **aim** is to **analyze** the dataset **on MYSQL database management system** using the **SQL language** and **draw insights** that will **guide the bike seller** in making **informed marketing decisons** thus improving his/her bike sales.

## **Purpose of the project**

**1)**. Identify which demographic(s) of our identifiers purchased bikes more compared to their counterparts.

 - This will grant the bike seller insight on which demographic(s) to market more to in order to maximize bike sales.

**2)**. Identify which demographics are underexplored and have a potential to purchase bikes at a high rate.

 - This will guide the bike seller in diverting marketing targets from demographics that are least interested in bike purchase to demographics that have a greater 
   potential to purchase more bikes.

 ## **Dataset Overview**
 
 * The dataset is **obtained from** the open source plattform **'Kaggle'** and is accessible to the general public for use.
   
 * Upon obtaining the dataset from kaggle,I **cleaned and transformed it on Microsoft Excel** to prepare it for data analysis.

 * On MYSQL workbench,I **created a database** by the name 'PortfolioProject' and using the **MYSQL export feature**,I  **exported the 'bike purchase' dataset** into the created database.The dataset is loaded as a **table, namely:portfolioproject.bike purchase.**

* To confirm whether the **dataset exported correctly**, I ran the **query**: describe portfolioproject.bike purchase; From running this query, I observed that the **fields** of the tables are in the **right data format.**

 * The **fields** are **namely**: Marital status,Gender,Income,Children,Education,Occupation,Home owner,Cars,Commute,Region,Age,Purchased bike.

* The fields are the attributes of identifiers that may have influenced their decision of whether or not to purchase a bike.

* In addittion,to **confirm** whether **all records were exported correctly**,I ran the **query**: select * from portfolioproject.bike purchase; This **query displays all the records and fields** in the dataset.It's observed that the **dataset contains 1000 records**.

* Proceeding further,I confirmed that the dataset **does not contain any duplicates**.This by using the **distinct function** i.e select count(distinct id) as sample_size from portfolioproject.bike purchase; .This query still return query 1000 records.


## **Data Exploration**
*NB*: The queries are not committed.
 
**1).** Number of people per gender.

   - **Query**; select gender,count(*) as total_people from portfolioproject.bike purchase group by gender order by total_people desc;
     
   - From this query, I deduced that the **total number** of **male identifiers(511)** are more in number than the **female identifiers (489)**.
     
 **2).** Compare the average income of male and female identifiers.

   - **Query**; select gender,avg(income) from portfolioproject.bike purchase group by gender;
   
   - From this query, I deduced that the **average income** of **male identifiers(58.06)** is slightly higher than that of **female identifiers(54.58)**.

 **3).** Only display identifiers who purchased bikes and their income is above average.

   - **Query**; select * from portfolioproject.bike purchase where Purchased Bike = 'Yes' and income > (select avg(income) from portfolioproject.bike purchase);

   - This query **returns records** of identifiers that **purchased bikes and are of above average income status** .From this display,I obtained the an overview of attributes possessed by this demographic of identifiers.

  **4).** **Create a view** namely **key_vars** that holds records of only identifiers that purchased bikes in addittion to thier key attributes(Income,Commute distance,Age brackets).

   - **Query**; create view key_vars as select ID,Purchased Bike,Commute Distance,Income,Age brackets. from portfolioproject.bike purchase where Purchased Bike = 'Yes';

   - *NB*; Confirm that view has been created using the **query**: show full tables where table_type='VIEW';

   **5)** Display the records from the 'key_vars' view.

   - **Query**; select * from key_vars;

   - From this query, we get an **overview of all the records in the view**.

   **6)** **Add a new field** ie *row number* to the 'key_vars' view. 

   - **Query**; select row_number() over (order by Income desc) as row_num, ID, Purchased Bike,Commute Distance,Income,Age brackets.
 from key_vars;

   - From running this query, the **records** in the view are **assigned row numbers in auto-increment order**.This allows **for easier analysis** because each row can be referenced in accordance to it's row number.

   **7)** **Partition by commute distance** the records in the 'key_vars' view.

   - **Query**; select ID,Purchased Bike,Commute Distance,Age brackets.avg(income) over (partition by Commute Distance) as average_salary
 from key_vars;

   - From running this query, the **records** in the view are **split into different partitions in accordance to their commute distance**.These partitions enable for analysis of the records per commute distance hence drawing insights from each commute distance group separetly becomes easier.

 **8)** Total number of bike purchasers per age bracket.

   - **Query**; select Age brackets.,count(ID) as age_group_total from key_vars group by Age brackets. ;

   - The **middle age bracket** contains the **most bike purchasers(383)** with the **old age bracket** coming in **2nd(59)** and the **least** being the **adolescents age bracket(39)**.I deduced this from running the query above.

   - From this data exploration, the seller should **prioritize marketing to the middle age bracket** above all other age brackets.

 **9)** **Drop the view** 'key_vars'

   - **Query**; drop view key_vars;
    
   - At the momment,I do not need the 'key_vars' view any more,thus I **deleted it from the database** using the query above.

   ## Data Analysis
   *NB:* The queries are not committed.
   ### **1)** *Comparision between the average income of bike purchasers and non-bike purcharsers*.
     
   - **Query**; select Gender,Purchased Bike,round((avg(income)),2) as average_income from  portfolioproject.bike purchase group by Purchased Bike,Gender order by 
       average_income desc;

   - From the first analysis,I noted that:

      **>** Bikes were purchased by identifiers that have an average higher income compared to the non-purchasers.This is in both the male and female genders.

      **>** The average income of the male identifiers is higher compared to the average income of the female identifiers.

      **>** In addittion,the average income of the male identifiers that did not purchase a bike is still higher than the average income of female identifiers that 
            purchased bikes.

   ### **2)** *Comparision between the commute distance of bike purchasers and non-bike purchasers*.

   - **Query**;  select Commute Distance,Purchased Bike,count(Purchased Bike) as no_of_people from portfolioproject.bike purchase group by Commute 
                 Distance,Purchased bike order by commute distance;

   - From my second analysis,I noted that:

       **>** The largest target market in line with the commute distance attribute lies in the '0-1 miles commute distance' identifiers.This is because this category 
             contains the highest number of identifiers.

       **>** As the commute distance increases, the size of the target market decreases.

       **>** As the commute distance increases,the amount of bike purchases also decreases.

   ### **3)** *Comparision of bike purchase in terms of age brackets*.

   - **Query**; select Age brackets.,Purchased Bike,count(Purchased Bike) from portfolioproject.bike purchase group by  Age brackets.,Purchased bike
                 order by Age brackets.;

   - From my third analysis, I noted that;

       **>** The largest target market in line with the age bracket attribute is the 'middle age bracket'(31-49 years).This is because this age bracket contains the 
              highest number of identifiers.
        
      **>** The 'middle age bracket'(31-49 years) has significantly higher bike purchases compared to the 'old'(54 and above years) and 'adolescent'( 30 and below years) 
              age brackets.

  ## Recommendations to bike seller

   - From insights obtained from analyzing the data set,I set to give reccommendations that will guide the bike seller in conducting targeted marketing which will in turn 
     lead to increased bikes sales.

   - My reccommendations are as follows:

      **1).** Target identifiers with higher income levels when marketing the bikes.As from the insights,higher income earners purchase bikes more compared to thier 
            counterparts.

      **2).** When marketing to identifiers with the same average income level, prioritize the female gender in comparision to the male gender.This is because from 
           analysis,we observe that at the same avarage income level,female identifiers are more likely to make a bike purchase as oppossed to their male counterparts.

      **3).** Prioritize identifiers in the 0-5 miles commute distance with top priority to those in the 0-1 miles commute distance during marketing.From the insights ,we 
              observe that identifiers in this range are more in number and have a tendancy to purchase bikes.

      **4).** Middle age bracket identifiers should also be accorded target market priority.It is evident that they carry the highest number of identifiers as well as the 
             highest number of bike purchases in terms of age bracket.

- The **best target demographic** is: middle-aged,female identifiers within the 0-1 miles commute distance whose income is above average.
 

     
     



     
    
 

 
 
    



