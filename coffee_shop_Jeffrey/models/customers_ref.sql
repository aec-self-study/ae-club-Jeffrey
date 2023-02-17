{{ config(materialized='table') }}

SELECT 
customer_id,
name,
email
FROM
  {{ ref('customers') }}
LIMIT
  5