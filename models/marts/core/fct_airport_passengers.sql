with airport as (

    select * from {{ ref('stg_airports')}}

),

aircraft as (

    select * from {{ ref('stg_aircraft')}}

),

individual_flights as (

    select * from {{ ref('stg_individual_flights')}}

),

airport_passengers as (
    select ap."Airport_Name", ac."Aircraft_Type", (count(*) * ac."Capacity") AS number_passengers
    from airport AS ap
    JOIN individual_flights AS i ON i."Departure_Airport_Code" = ap."Airport_Code"
    JOIN aircraft AS ac ON ac."Aircraft_Id" = i."Aircraft_Id"
    GROUP BY ap."Airport_Name", ac."Aircraft_Type", ac."Capacity"
    ORDER BY number_passengers DESC
)

select * from airport_passengers
