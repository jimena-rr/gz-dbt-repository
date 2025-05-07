{{ dbt_utils.union_relations(
    relations=[ref('stg_raw__adwords'), source('my_source', 'my_table')],
    exclude=["_loaded_at"]
) }}

SELECT * FROM {{ ref('stg_raw__adwords') }}
UNION ALL
SELECT * FROM {{ ref('stg_raw__bing') }}
UNION ALL
SELECT * FROM {{ ref('stg_raw__criteo') }}
UNION ALL
SELECT * FROM {{ ref('stg_raw__facebook') }}

