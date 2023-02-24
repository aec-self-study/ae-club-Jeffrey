with source as (
    select * from {{ source('coffee_shop', 'customers') }}
),

renamed as (
    select
        id AS customer_id,
        name,
        email
        -- excluded columns
    from source
)

select * from renamed