# DataEngineeringCapstoneProject
This project is made for IBM Data Engineering Professional Certificate course.

1. The first step includes setting up MySQL as the OLTP DB.
2. The second step consists of setting up MongoDB as NoSQL database. 
3. In the third step, PostgreSQL is used as a staging warehouse and IBM DB2 has been used as a production data warehouse to generate BI reports and analytics.
4. IBM Cognos has beeen used as the BI tool to generate analytics and reports from our Db2 warehouse.
5. Apache airflow is then used to create a DAG to ETL the given data.
6. In this final step, the data from a webserver is used to analyse search terms and we need to deploy a pretrained sales forecasting model and predict the sales forecast for a future year.


Below is the whole description of the project which I have copied and pasted from their webpage.

![data_platform_architecture](https://user-images.githubusercontent.com/54864005/202037480-fad67e1c-9351-4e63-8484-1264e6171726.png)


# Environment:
This document introduces you to the data platform architecture of an ecommerce company named SoftCart.

SoftCart uses a hybrid architecture, with some of its databases on premises and some on cloud.

# Tools and Technologies:
OLTP database - MySQL

NoSql database - MongoDB

Production Data warehouse – DB2 on Cloud

Staging - Data warehouse – PostgreSQL

Big data platform - Hadoop

Big data analytics platform – Spark

Business Intelligence Dashboard - IBM Cognos Analytics

Data Pipelines - Apache Airflow


# Process:
SoftCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles and tablets.

All the catalog data of the products is stored in the MongoDB NoSQL server.

All the transactional data like inventory and sales are stored in the MySQL database server.

SoftCart's webserver is driven entirely by these two databases.

Data is periodically extracted from these two databases and put into the staging data warehouse running on PostgreSQL.

Production data warehouse is on the cloud instance of IBM DB2 server.

BI teams connect to the IBM DB2 for operational dashboard creation. IBM Cognos Analytics is used to create dashboards.

SoftCart uses Hadoop cluster as it big data platform where all the data collected for analytics purposes.

Spark is used to analyse the data on the Hadoop cluster.

To move data between OLTP, NoSQL and the dataware house ETL pipelines are used and these run on Apache Airflow.
