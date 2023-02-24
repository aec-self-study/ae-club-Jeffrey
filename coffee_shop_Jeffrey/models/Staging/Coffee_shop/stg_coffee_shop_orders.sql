with source as (

    select * from {{ source('coffee_shop', 'orders') }}

),

renamed as (

    select
        id AS order_id,
        created_at AS order_made_at,
        customer_id,
        total As total_orders,
        address,
        state,
        zip

    from source

)

select * from renamed