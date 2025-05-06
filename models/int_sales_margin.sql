WITH table_1 AS (SELECT *
FROM {{ source('raw', 'sales') }} AS sales
LEFT JOIN {{ source('raw', 'product') }} AS products
    ON sales.pdt_id = products.products_id)

SELECT 
    *
    ,(quantity * CAST(purchse_price AS FLOAT64)) AS purchase_cost
    ,ROUND((revenue - (quantity * CAST(purchse_price AS FLOAT64))),2) AS margin
FROM table_1
