with aircraft as (

    select * from {{ ref('stg_aircraft')}}

)

select * from aircraft
