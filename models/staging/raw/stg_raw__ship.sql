with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        CAST(logcost AS FLOAT64) AS log_cost,
        ship_cost

    from source
   

)

select * from renamed
