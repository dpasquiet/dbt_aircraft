with aircraft as (

    select * from {{ ref('stg_aircraft')}}

),

individual_flights as (
    select * from {{ ref('stg_individual_flights')}}
),

aircraft_flights as (
    select
        a."Aircraft_Type", count(*) AS number_of_flights
        from aircraft AS a
        JOIN individual_flights AS f USING ("Aircraft_Id")
        group by a."Aircraft_Type"
        ORDER BY number_of_flights DESC
)

select * from aircraft_flights
