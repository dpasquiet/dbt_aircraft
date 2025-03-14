with airline as (
    select * from {{ ref('stg_airlines')}}
),

flight_summary as (
    select * from {{ ref('stg_flight_summary_data')}}
),

best_rpm as (
    select "Airline_Name", YEAR(TO_DATE("Date")) AS year, SUM((COALESCE("RPM_Domestic", 0) + COALESCE("RPM_International", 0))) AS RPM_total
    from airline
    join flight_summary using ("Airline_Code")
    GROUP BY "Airline_Name", YEAR(TO_DATE("Date"))
    ORDER BY "Airline_Name", RPM_total DESC
),

ranked_benefices AS (
    SELECT "Airline_Name", year, RPM_total,
        ROW_NUMBER() OVER (PARTITION BY "Airline_Name" ORDER BY RPM_total DESC) AS rang
    FROM best_rpm
)

-- select * from ranked_benefices

SELECT "Airline_Name", year, RPM_total
FROM ranked_benefices
WHERE rang = 1

--select * from best_rpm
