{{config(materialized= 'incremental',unique_key='host_id')}}


select 
    host_id,
    {{upper('host_name')}} as host_name,
    host_since,
    is_superhost,
    response_rate,
    {{response_rate('response_rate')}} as response_rate_category,
    created_at as host_created_at
from
    {{ref('bronze_hosts')}}