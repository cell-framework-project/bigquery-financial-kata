CREATE OR REPLACE TABLE `cell-framework-project.financial_kata.calendar` AS
SELECT 
  ROW_NUMBER() OVER(ORDER BY date) AS timestamp_days, 
  date,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  EXTRACT(DAY FROM date) AS day,  
  EXTRACT(DAYOFYEAR FROM date) AS year_day, 
  EXTRACT(WEEK FROM date) AS week,
  EXTRACT(DAYOFWEEK FROM date) AS week_day,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM date) >=6 THEN FALSE
    ELSE TRUE 
    END AS working_day
FROM 
  UNNEST(GENERATE_DATE_ARRAY('1970-01-01', '2100-12-31')) AS date 
    ORDER BY date;