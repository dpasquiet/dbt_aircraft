select
*
from {{ source('aircraft', 'flight_summary_data') }}