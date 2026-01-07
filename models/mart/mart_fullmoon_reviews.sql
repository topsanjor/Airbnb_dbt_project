{{
    config(
        materialized = 'table',
    )
}}

WITH fct_reviews as (
    select * from {{ ref('fct_reviews') }}
),
full_moon_dates as (
    select * from {{ ref('seed_full_moon_dates')}}
    )
    
SELECT 
    f.*
,   case when fm.full_moon_date is Null then 'Not full Moon' else 'full moon' end as is_full_moon

    FROM fct_reviews f
    left join full_moon_dates fm      
        on (to_date(f.review_date) = dateadd(day, 1,fm.full_moon_date))
        