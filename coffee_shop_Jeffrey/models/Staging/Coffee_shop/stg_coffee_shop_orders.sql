with source as (

    select * from {{ source('coffee_shop', 'orders') }}

),

renamed as (

    select
        id,
        created_at,
        customer_id,
        total,
        address,
        state,
        zip

    from source

)

select * from renamed