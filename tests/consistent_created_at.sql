select   
*
from {{ ref ('fct_reviews')}} f
left join {{ref('dim_listing_cleansed')}} l
    on l.listing_id = f.listing_id
where f.review_date < l.created_at
limit 10