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
WITH final AS (
SELECT 
DATE_TRUNC(orders.created_at,WEEK),
customers.id AS customer_id, 	
customers.name,			
customers.email AS customer_email,			
orders.first_order_at,		
orders.Total AS number_of_orders,
product_prices.price AS price,
products.category AS product_category
FROM customers
LEFT JOIN customers on orders.customer_id = customers.customer_id
LEFT JOIN products ON product_prices.product_id = products.id
)
SELECT * FROM final