# 📊 Telecom Churn Analysis & Prediction

![Project Status](https://img.shields.io/badge/Status-Active-brightgreen)
![License](https://img.shields.io/badge/License-MIT-blue)

A data science project focused on analyzing and predicting customer churn in the telecom sector using *SQL, **Python, and **Power BI*. The project leverages real-world telecom data to uncover key churn drivers, visualize insights, and build predictive models to help businesses retain customers and maximize revenue.

---

## 📌 Project Overview

Customer churn is a critical metric for telecom companies, directly impacting profitability and growth. This project aims to:

- Analyze customer churn patterns using demographic, behavioral, and transactional data.
- Identify key factors influencing churn (e.g., contract type, payment method, tenure, state, service usage).
- Build and evaluate machine learning models to predict potential churners.
- Present actionable insights through interactive Power BI dashboards and comprehensive SQL queries.

---

## ✨ Key Features

- *Data Exploration & Cleaning*: End-to-end pipeline from raw data to analysis-ready datasets using SQL and Python.
- *Churn Analysis*: Deep dives into churn rates by gender, age, payment method, contract, tenure, state, and service usage.
- *Predictive Modeling*: Random Forest model to predict customer churn with feature importance analysis.
- *Interactive Dashboards*: Power BI dashboards for visual storytelling and business reporting.
- *SQL Analytics*: Modular SQL scripts for segmentation, aggregation, and state-wise churn analysis.

---

## 🗂 Data Sources

- *Customer Data*: Demographic and transactional records (customer_id, gender, age, state, tenure, payment, revenue, etc.)
- *Churn Labels*: Annotated with customer status (Joined, Stayed, Churned) and churn reasons/categories.
- *Data Preparation*: Null value handling, feature engineering, and creation of production-ready tables/views.

---

## 📈 Power BI Dashboard Insights

The Power BI dashboard presents interactive visuals across various dimensions:

- *Churn by Gender*: 64% Female, 36% Male  
- *Churn Rate by Age Group*: Highest in 20–35 years range  
- *Churn by Contract*: 46.5% churn for Month-to-Month plans  
- *Churn by Payment Method*: 37.8% churn via Mailed Check  
- *State-wise Churn*: Jammu & Kashmir has the highest churn (57.2%)  
- *Churn by Internet Type*: Fiber Optic users churn the most (41.1%)  
- *Top Churn Reasons*: Competitor’s better offers and device issues  

📊 *Total Customers*: 6418  
📉 *Churned Customers*: 1732  
🆕 *New Joiners*: 411  
📈 *Churn Rate*: 27.0%

---

## 🧠 Machine Learning Model (Python)

Churn prediction model is built using RandomForestClassifier from scikit-learn.

- ✅ Cleaned and preprocessed data from PostgreSQL  
- ✅ Encoded categorical variables using LabelEncoder  
- ✅ Trained and tested the model with appropriate evaluation metrics  
- ✅ Displayed confusion matrix and classification report  

📌 *Predicted Churners*: 372  
📌 *Top Predictive Features*: Monthly Charges, Internet Type, Contract, Tenure

---

## 🗃 SQL Analysis & Data Engineering

SQL was used for heavy lifting and transformation on PostgreSQL.

- 🧹 Cleaned null values using COALESCE() and created a prod_churn table  
- 🗂 Created views like churn_data and join_data for better segmentation  
- 📊 Executed churn analysis by gender, age, state, contract, payment method  
- 🧾 Generated revenue contribution by each customer segment  
- 🧠 Identified top churn categories and reasons using grouped queries  

---

## 💼 Tools Used

- *Power BI* – Interactive dashboards  
- *PostgreSQL* – SQL-based data transformation  
- *Python* – Churn prediction (pandas, scikit-learn, matplotlib)  
- *Jupyter Notebook* – ML pipeline & model evaluation  
- *Git & GitHub* – Version control and hosting  

---

## 📌 Future Scope

- 🚀 Deploy the ML model via Flask/Django API  
- 🔁 Create real-time churn monitoring system  
- 🧪 Perform A/B testing for churn prevention offers
