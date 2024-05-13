/* Problem Statement  MYSQL */

create database Live_DA_Project;     
use Live_DA_Project; 

# Q1.What is the demographic profile of the clients and how does it vary across districts ?

SELECT City, COUNT(*) AS Total_Clients, AVG(Sales_Amount) AS Average_Sales
FROM table_one b
JOIN table_Four t  ON b.Business_ID = t.Business_ID
GROUP BY City 
ORDER BY Total_Clients DESC;

/* Client is more from city Nagpur,Chandrapur from Maharashtra and Bhopal From Madhya Pradesh.*/

# Q2.How the Biz have performed over the years. Give their detailed analysis year & month-wise ?

SELECT YEAR (t.Login_Date) AS year, MONTH(t.Login_Date) AS month, SUM(t.Sales_Amount) AS total_sales
FROM table_Four t
GROUP BY YEAR(t.Login_Date), MONTH(t.Login_Date)
ORDER BY total_sales DESC;

/* Biz performed higest in November 2019, December 2019 & January 2020 */

# Q3.What are the most common types of clients and how do they differ in terms of usage and profitability?

SELECT Business_Category, COUNT(*) AS Client_Count, AVG(Sales_Amount) AS Average_Sales, AVG(profit) AS Average_Profit
FROM table_one b
JOIN table_three p ON b.Business_ID = p.Business_ID
JOIN table_Four  t ON b.Business_ID = t.Business_ID
GROUP BY Business_Category
ORDER BY  client_count DESC;

/* Most Common type of client is from Hospital, Real Estate  and school  which is gives most profit .*/

# Q4.Which types of product are most frequently used by the clients and what is the overall profitability of the client need?

SELECT Product_Proposal, COUNT(*) AS Usage_Count, SUM(profit) AS Total_Profit
FROM table_three p
JOIN  table_four t ON p.Business_ID = t.Business_ID
GROUP BY Product_Proposal
ORDER BY Usage_Count DESC;

/*GMVT & social media management  is most commonly used Product by client and it is most profitable product */



# Q5. What are the major expenses of the Biz and how can they be reduced to improve profitability?

SELECT Bi.Business_Name, SUM(td.expense) AS Total_Expenses, SUM(td.profit) AS Total_Profits
FROM table_one bi
JOIN table_four td ON bi.Business_ID = td.Business_ID
GROUP BY Bi.Business_Name
ORDER BY Total_Expenses DESC;

/*Ayushman Hospital ,Maitreya Developers ,Farme are the major expenses of the Biz */

# Q6.What is the client portfolio and how does it vary across different purposes and client segments?
  
SELECT Business_Category, Product_Proposal, COUNT(*) AS Client_Count
FROM table_one b
JOIN table_three p ON b.Business_ID = p.Business_ID
GROUP BY Business_Category, Product_Proposal
ORDER BY Client_Count DESC;

#Maximum client of hospital using GMVT.
   
# 7. How can the Biz improve its customer service and satisfaction levels?
 
SELECT Meeting_Status, COUNT(*) AS meeting_count
FROM table_two
GROUP BY Meeting_Status
ORDER BY meeting_count DESC;

# Biz should focous on confirm, call and go to improve its customer service and satisfaction levels.


# Q8.Can the Biz introduce new products or services to attract more customers and increase profitability?

SELECT Business_Category, COUNT(DISTINCT Product_Proposal) AS Product_Types
FROM Table_Three
GROUP BY Business_Category
ORDER BY Product_Types desc;

/* Biz should introduce new product or services releted to hospital,Dental Clinic ,coaching classes to attract more customers and increase profitability.*/

# Q9.How are telecallers role in the sales.

SELECT Telecaller_name, COUNT(*) AS Meetings_conduct, SUM(profit) AS Total_Profit
FROM table_two m
JOIN  table_four t ON m.Business_ID = t.Business_ID
GROUP BY Telecaller_name 
order by Meetings_conduct desc;

/* Mayuri ,Shital ,Gayatri are the top 3 tellecaller who makes most meeting and profit */

# Q10.What is BDM’s indivisual performance with various segments of client.

SELECT m.BDM_name, p.Business_Category, COUNT(m.Business_ID) AS total_clients, SUM(t.Sales_Amount) AS total_sales
FROM table_two m
JOIN table_three p ON m.Business_ID = p.Business_ID
LEFT JOIN table_four t ON m.Business_ID = t.Business_ID
GROUP BY m.BDM_name, p.Business_Category
ORDER BY total_sales DESC;

/* Dheeraj have higesht no of client in Real Estate Builders & Construction Category.*/

# Q11.How many businesses retain with same or different product?

SELECT COUNT(b.Business_ID) AS total_businesses, p.Product_Proposal
FROM table_one b
JOIN table_three p ON b.Business_ID = p.Business_ID
GROUP BY p.Product_Proposal
order by total_businesses desc;

/* Most of business retain with GMVT And GMVT + Fb */

# Q12.Which is best selling prodcut and category?

SELECT p.Product_Proposal, p.Business_Category, SUM(t.Sales_Amount) AS total_sales
FROM table_three p
JOIN table_four  t ON p.Business_ID = t.Business_ID
GROUP BY p.Product_Proposal, p.Business_Category
ORDER BY total_sales DESC
LIMIT 1;

/*  Social Media Management is the Best selling product in Real Estate Builders & Construction */

# Q13.What is popular selling amount ?

SELECT t.Sales_Amount, COUNT(*) AS num_transactions
FROM table_four t
GROUP BY t.Sales_Amount
ORDER BY num_transactions DESC
LIMIT 1;

/* Maximum Amount of transcation is 10000 which is 232.*/










