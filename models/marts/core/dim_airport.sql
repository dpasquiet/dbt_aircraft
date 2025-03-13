with airport as (

    select * from {{ ref('stg_airports')}}

),

final as (
    select *
    from airport
)

select * from final
