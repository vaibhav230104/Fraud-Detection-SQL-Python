# SQL-Fraud-Detection
In this project, we will apply SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.
We will strive to accomplish three main tasks:


### Data Modeling:
We created on postgreSQL a database called credit_card_transactions_db, then created five tables.
Using Quick Database Diagrams, we created an entity relationship diagram (ERD) by inspecting the provided CSV files.

### Data Engineering: 
We created a database schema on PostgreSQL and populated our database from the CSV files provided.
Using our database model as a blueprint, we created a database schema for each of our tables and relationships. We specified data types, primary keys and foreign keys.
After creating the database schema, we imported the data from the corresponding CSV files.

### Data Analysis: 
 In this part of the project, we will analyze the data and then create a report within a Jupyter Notebook file to present our findings. 
 We will answer the following questions:

How can you isolate (or group) the transactions of each cardholder?

Consider the time period 7:00 a.m. to 9:00 a.m.

What are the 100 highest transactions during this time period?

Do we see any fraudulent or anomalous transactions?


If we answered yes to the previous question, we will explain why we think there might be fraudulent transactions during this time frame.

Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders. Count the transactions that are less than $2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain the rationale.

What are the top five merchants prone to being hacked using small transactions?

Once we have a query that can be reused, we will create a view for each of the previous queries.

We will create a report for fraudulent transactions of some top customers of the firm. To achieve this task, we will perform a visual data analysis of fraudulent transactions using Pandas, Plotly Express, hvPlot, and SQLAlchemy to create the visualizations.

We will verify if there are any fraudulent transactions in the history of two of the most important customers of the firm. For privacy reasons, we only know that their cardholders' IDs are 18 and 2.

Using hvPlot, we will create a line plot representing the time series of transactions over the course of the year for each cardholder. In order to compare the patterns of both cardholders, we will create a line plot containing both lines.

What difference do we observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain the rationale.

The CEO of the firm's biggest customer suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay for several expensive restaurant bills. We are asked to find any anomalous transactions during that period.

Using Plotly Express, we created a series of six box plots, one for each month, in order to identify how many outliers there are per month for cardholder ID 25.

We noticed anomalies, described our observations and conclusions.

### Challenge
As challenge, we looked for outliers in the data to identify fraudulent transactions. Standard deviation or quartiles were used to detect outliers.

We coded a function using Python to identify anomalies for any cardholder.











