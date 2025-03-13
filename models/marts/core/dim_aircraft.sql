with aircraft as (

    select * from {{ ref('stg_aircraft')}}

),

final as (
    select *
    from aircraft
)

select * from final
