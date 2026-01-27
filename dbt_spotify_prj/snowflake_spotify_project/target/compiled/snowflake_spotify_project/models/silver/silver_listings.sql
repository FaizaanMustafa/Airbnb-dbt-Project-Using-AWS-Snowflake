


select 
    listing_id,
    host_id,
    
    UPPER(property_type)
   as property_type,
    
    UPPER(room_type)
   as room_type,
    
    UPPER(city)
   as city,
    
    UPPER(country)
   as country,
    accommodates,
    bathrooms,
    bedrooms,
    price_per_night,
    
    case 
        when price_per_night < 100 then 'low'
        when price_per_night < 200 then 'medium'
        else 'high'
    end
 as price_per_night_tag,
    created_at as listing_created_at
from 
    SPOTIFY_DB.bronze.bronze_listings