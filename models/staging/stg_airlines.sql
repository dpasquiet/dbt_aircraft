select
*
from {{ source('aircraft', 'airlines') }}