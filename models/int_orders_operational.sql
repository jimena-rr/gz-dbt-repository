WITH table_2 AS (
    SELECT
        sales.orders_id AS orders_id,
        sales.date_date AS date_date,
        sales.margin AS margin,
        CAST(shipping.logcost AS INT64) AS logcost,
        CAST(shipping.shipping_fee AS FLOAT64) AS shipping_fee,
        CAST(shipping.ship_cost AS FLOAT64) AS ship_cost
    FROM {{ ref("int_sales_margin") }} AS sales
    LEFT JOIN {{ source('raw', 'ship') }} AS shipping
        ON sales.orders_id = shipping.orders_id
)

SELECT 
    orders_id
    ,date_date
    ,((margin + shipping_fee) - (logcost - ship_cost)) AS operational_margin
FROM table_2
GROUP BY orders_id, date_date, margin, shipping_fee, logcost, ship_cost


