with l as (
    select * from {{ ref('dim_listing_cleansed') }}
),
h as (
    select * from {{ ref('dim_hosts_cleansed') }}
)


SELECT 
    l.listing_id
,   l.listing_name
,   l.room_type
,   l.minimum_nights
,   l.price 
,   h.host_id
,   host_name
,   h.is_superhost as host_is_superhost
,   h.host_created_at
,   GREATEST(l.updated_at, h.host_updated_at) as updated_at

FROM l 
left join h 
    on h.host_id = l.host_id
