{{ codegen.generate_base_model(
    source_name='coffee_shop',
    table_name='customers'
) }}

{{ codegen.generate_base_model(
    source_name='coffee_shop',
    table_name='orders'
) }}

{{ codegen.generate_base_model(
    source_name='coffee_shop',
    table_name='product_prices'
) }}

{{ codegen.generate_base_model(
    source_name='coffee_shop',
    table_name='products'
) }}

{{ codegen.generate_base_model(
    source_name='web_tracking',
    table_name='pageviews'
) }}