WITH
customers AS (
    SELECT * FROM {{ ref('stg_coffee_shop_customers')}} 
),
orders AS (
    SELECT * FROM {{ ref('stg_coffee_shop_orders')}}  
),
product_prices AS (
    SELECT * FROM {{ ref('stg_coffee_shop_product_prices')}} 
),
products AS (
    SELECT * FROM {{ ref('stg_coffee_shop_products')}} 
),
final AS (
SELECT 
DATE_TRUNC(orders.created_at,WEEK) AS date_week,
customers.id AS customer_id, 	
customers.name,			
customers.email AS customer_email,			
orders.id,		
orders.Total AS number_of_orders
FROM customers
LEFT JOIN orders on orders.customer_id = customers.id
)
SELECT * FROM final