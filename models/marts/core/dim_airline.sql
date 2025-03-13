with airline as (

    select * from {{ ref('stg_airlines')}}

),

final as (
    select *
    from airline
)

select * from final
