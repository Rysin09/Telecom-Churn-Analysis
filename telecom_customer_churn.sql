CREATE TABLE CUSTOMER_DATA (
	customer_id VARCHAR(50),
	gender VARCHAR(50) ,
	age INT ,
	married VARCHAR(50),
	state VARCHAR(50) ,
	number_of_referrals INT,
	tenure_in_months INT,
	value_deal VARCHAR(50),
	phone_service VARCHAR(50),
	multiple_lines VARCHAR(50),
	internet_service VARCHAR(50),
	internet_type VARCHAR(50),
	online_security VARCHAR(50),
	online_backup VARCHAR(50),
	device_protection_plan VARCHAR(50),
	premium_support VARCHAR(50),
	streaming_tv VARCHAR(50),
	streaming_movies VARCHAR(50),
	streaming_music VARCHAR(50),
	unlimited_data VARCHAR(50),
	contract VARCHAR(50),
	paperless_billing VARCHAR(50),
	payment_method VARCHAR(50),
	monthly_charge NUMERIC,
	total_charges NUMERIC,
	total_refunds NUMERIC,
	total_extra_data_charges INT,
	total_long_distance_charges NUMERIC,
	total_revenue NUMERIC,
	customer_status VARCHAR(50),
	churn_category VARCHAR(50),
	churn_reason VARCHAR(150)
);

-- Analysing the data on the basis of gender
SELECT * FROM customer_data;

SELECT 
    Gender,
    COUNT(Gender) AS TotalCount,
    COUNT(Gender) * 100.0 / (SELECT COUNT(*) FROM customer_data) AS Percentage
FROM 
    customer_data
GROUP BY 
    Gender;

-- Analysing the contribution of different contracts
SELECT 
    Contract,
    COUNT(Contract) AS TotalContCount,
    COUNT(Contract) * 100.0 / (SELECT COUNT(*) FROM customer_data) AS Percentage
FROM 
    customer_data
GROUP BY 
    Contract;

-- Analysis of the Percentage of customers who Joined, Churned, Stayed	and Revenue percentage of each
SELECT 
  Customer_Status, 
  COUNT(Customer_Status) AS TotalCustCount, 
  SUM(Total_Revenue) AS TotalRev,
  (SUM(Total_Revenue) * 100.0) / 
    (SELECT SUM(Total_Revenue) FROM customer_data) AS RevPercentage
FROM 
   customer_data
GROUP BY 
  Customer_Status;

  
-- State centric analysis
SELECT 
    state,
    COUNT(state) AS TotalStateCount,
    COUNT(state) * 100.0 / (SELECT COUNT(*) FROM customer_data) AS Percentage
FROM 
    customer_data
GROUP BY 
    state;


SELECT DISTINCT internet_type FROM customer_data;

SELECT
	*
FROM
	CUSTOMER_DATA;

-- Creating a separate table with potential data related to chunred cutomers
CREATE TABLE churned_customer_data AS
SELECT 
  customer_id, 
  gender, 
  internet_type, 
  contract, 
  monthly_charge, 
  customer_status, 
  churn_category,
  churn_reason
FROM 
  customer_data
WHERE 
  customer_status = 'Churned';

SELECT * FROM churned_customer_data;

-- Analysis of churned customers by their churn category
SELECT 
    churn_category,
    COUNT(churn_category) AS TotalChurnCount,
    COUNT(churn_category) * 100.0 / (SELECT COUNT(*) FROM churned_customer_data) AS Percentage
FROM 
    churned_customer_data
GROUP BY 
    churn_category;

-- Retreving the total number of null values in each column
SELECT
    COUNT(*) - COUNT(Customer_ID) AS Customer_ID_Null_Count,
    COUNT(*) - COUNT(Gender) AS Gender_Null_Count,
    COUNT(*) - COUNT(Age) AS Age_Null_Count,
    COUNT(*) - COUNT(Married) AS Married_Null_Count,
    COUNT(*) - COUNT(State) AS State_Null_Count,
    COUNT(*) - COUNT(Number_of_Referrals) AS Number_of_Referrals_Null_Count,
    COUNT(*) - COUNT(Tenure_in_Months) AS Tenure_in_Months_Null_Count,
    COUNT(*) - COUNT(Value_Deal) AS Value_Deal_Null_Count,
    COUNT(*) - COUNT(Phone_Service) AS Phone_Service_Null_Count,
    COUNT(*) - COUNT(Multiple_Lines) AS Multiple_Lines_Null_Count,
    COUNT(*) - COUNT(Internet_Service) AS Internet_Service_Null_Count,
    COUNT(*) - COUNT(Internet_Type) AS Internet_Type_Null_Count,
    COUNT(*) - COUNT(Online_Security) AS Online_Security_Null_Count,
    COUNT(*) - COUNT(Online_Backup) AS Online_Backup_Null_Count,
    COUNT(*) - COUNT(Device_Protection_Plan) AS Device_Protection_Plan_Null_Count,
    COUNT(*) - COUNT(Premium_Support) AS Premium_Support_Null_Count,
    COUNT(*) - COUNT(Streaming_TV) AS Streaming_TV_Null_Count,
    COUNT(*) - COUNT(Streaming_Movies) AS Streaming_Movies_Null_Count,
    COUNT(*) - COUNT(Streaming_Music) AS Streaming_Music_Null_Count,
    COUNT(*) - COUNT(Unlimited_Data) AS Unlimited_Data_Null_Count,
    COUNT(*) - COUNT(Contract) AS Contract_Null_Count,
    COUNT(*) - COUNT(Paperless_Billing) AS Paperless_Billing_Null_Count,
    COUNT(*) - COUNT(Payment_Method) AS Payment_Method_Null_Count,
    COUNT(*) - COUNT(Monthly_Charge) AS Monthly_Charge_Null_Count,
    COUNT(*) - COUNT(Total_Charges) AS Total_Charges_Null_Count,
    COUNT(*) - COUNT(Total_Refunds) AS Total_Refunds_Null_Count,
    COUNT(*) - COUNT(Total_Extra_Data_Charges) AS Total_Extra_Data_Charges_Null_Count,
    COUNT(*) - COUNT(Total_Long_Distance_Charges) AS Total_Long_Distance_Charges_Null_Count,
    COUNT(*) - COUNT(Total_Revenue) AS Total_Revenue_Null_Count,
    COUNT(*) - COUNT(Customer_Status) AS Customer_Status_Null_Count,
    COUNT(*) - COUNT(Churn_Category) AS Churn_Category_Null_Count,
    COUNT(*) - COUNT(Churn_Reason) AS Churn_Reason_Null_Count
FROM customer_data;

/*
Cleaned and loaded churn staging data into production by replacing NULLs with default
values for analysis-ready dataset.
*/

CREATE TABLE prod_churn AS
SELECT
  customer_id,
  gender,
  age,
  married,
  state,
  number_of_referrals,
  tenure_in_months,
  COALESCE(value_deal, 'None') AS value_deal,
  phone_service,
  COALESCE(multiple_lines, 'No') AS multiple_lines,
  internet_service,
  COALESCE(internet_type, 'None') AS internet_type,
  COALESCE(online_security, 'No') AS online_security,
  COALESCE(online_backup, 'No') AS online_backup,
  COALESCE(device_protection_plan, 'No') AS device_protection_plan,
  COALESCE(premium_support, 'No') AS premium_support,
  COALESCE(streaming_tv, 'No') AS streaming_tv,
  COALESCE(streaming_movies, 'No') AS streaming_movies,
  COALESCE(streaming_music, 'No') AS streaming_music,
  COALESCE(unlimited_data, 'No') AS unlimited_data,
  contract,
  paperless_billing,
  payment_method,
  monthly_charge,
  total_charges,
  total_refunds,
  total_extra_data_charges,
  total_long_distance_charges,
  total_revenue,
  customer_status,
  COALESCE(churn_category, 'Others') AS churn_category,
  COALESCE(churn_reason, 'Others') AS churn_reason
FROM customer_data;

SELECT * FROM prod_churn;

CREATE VIEW churn_data AS
	SELECT * FROM prod_churn WHERE customer_status IN ('Churned','Stayed');

SELECT * FROM churn_data;	

CREATE VIEW join_data AS
	SELECT * FROM prod_churn WHERE customer_status = 'Joined';

SELECT * FROM join_data;


