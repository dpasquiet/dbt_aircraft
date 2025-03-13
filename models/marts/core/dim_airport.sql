with airport as (

    select * from {{ ref('stg_airports')}}

)

select * from airport
