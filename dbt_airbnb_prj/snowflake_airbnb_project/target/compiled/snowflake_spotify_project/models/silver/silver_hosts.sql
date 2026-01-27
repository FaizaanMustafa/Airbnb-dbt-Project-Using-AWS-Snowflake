


select 
    host_id,
    
    UPPER(host_name)
   as host_name,
    host_since,
    is_superhost,
    response_rate,
    
    case 
        when response_rate > 95 then 'Very Good'
        when response_rate > 80 then 'Good'
        when response_rate > 60 then 'Average'
        else 'Poor'
    end
 as response_rate_category,
    created_at as host_created_at
from
    SPOTIFY_DB.bronze.bronze_hosts