select
    index,
    Aircraft_id,
    Aircraft_Type,
    Mass,
    Length,
    Cost,
    Capacity
from {{ source('aircraft', 'aircraft') }}