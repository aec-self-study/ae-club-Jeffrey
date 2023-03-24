{{ config(materialized='table') }}

SELECT
  c.id AS customer_id,
  c.name,
  c.email,
  MIN(o.created_at) AS first_order_at,
  COUNT(o.id) AS number_of_orders
FROM
  {{ source('coffee_shop', 'customers') }} AS c
LEFT JOIN
  {{ source('coffee_shop', 'orders') }} AS o
ON
  c.id = o.customer_id
GROUP BY
  c.id,
  c.name,
  c.email
ORDER BY
  first_order_at
LIMIT
  5