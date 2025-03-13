select
*
from {{ source('aircraft', 'individual_flights') }}