
{{
    config(
        materialized = 'view'
    )
}}

with src_hosts as (
    select * from {{ ref('src_hosts')}}
)
SELECT 
    host_id
,   case when host_name is null then 'Anonymous' else host_name end host_name
,   is_superhost
,   host_created_at
,   host_updated_at
from src_hosts