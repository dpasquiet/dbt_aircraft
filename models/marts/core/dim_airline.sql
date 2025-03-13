with airline as (
    select * from {{ ref('stg_airlines')}}
)

select * from airline
