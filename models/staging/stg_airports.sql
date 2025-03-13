select
*
from {{ source('aircraft', 'airports') }}