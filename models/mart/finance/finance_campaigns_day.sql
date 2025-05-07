SELECT
    c.date_date
    ,f.operational_margin - c.ads_cost AS ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
    ,ads_impressions
    ,ads_clicks
    ,quantity
    ,revenue
    ,purchase_cost
    ,margin
    ,shipping_fee
    ,logcost
    ,ship_cost
FROM {{ref('int_campaigns_day')}} AS c
FULL OUTER JOIN {{ref('finance_days')}} AS f
ON c.date_date = f.date_date
ORDER BY date_date DESC


