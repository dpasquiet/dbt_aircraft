with airline as (
    select * from {{ ref('stg_airlines')}}
),

flight_summary as (
    select * from {{ ref('stg_flight_summary_data')}}
),

best_asm as (
    select "Airline_Name", YEAR(TO_DATE("Date")) AS year, AVG((COALESCE("ASM_Domestic", 0))) AS ASM_avg
    from airline
    join flight_summary using ("Airline_Code")
    GROUP BY "Airline_Name", YEAR(TO_DATE("Date"))
    ORDER BY "Airline_Name", ASM_avg DESC
),

ranked_growth AS (
    SELECT "Airline_Name", year, ASM_avg,
        ROW_NUMBER() OVER (PARTITION BY "Airline_Name" ORDER BY ASM_avg DESC) AS rang
    FROM best_asm
)

--select * from ranked_growth

SELECT "Airline_Name", year, ASM_avg
FROM ranked_growth
WHERE rang = 1