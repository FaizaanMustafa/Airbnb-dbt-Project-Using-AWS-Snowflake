


with  __dbt__cte__obt as (


select 
    
        silver_bookings.*,
    
        silver_listings.host_id,silver_listings.property_type,silver_listings.room_type,silver_listings.city,silver_listings.country,silver_listings.accommodates,silver_listings.bathrooms,silver_listings.bedrooms,silver_listings.price_per_night,silver_listings.price_per_night_tag,silver_listings.listing_created_at,
    
        silver_hosts.host_name,silver_hosts.host_since,silver_hosts.is_superhost,silver_hosts.response_rate,silver_hosts.response_rate_category,silver_hosts.host_created_at
    
from
   
   
        spotify_db.silver.silver_bookings as silver_bookings
   
            
   
        left join spotify_db.silver.silver_listings as silver_listings
            on silver_bookings.listing_id = silver_listings.listing_id
            
            
   
        left join spotify_db.silver.silver_hosts as silver_hosts
            on silver_listings.host_id = silver_hosts.host_id
            
            
), hosts as (
    select
        host_id,
        host_name,
        host_since,
        is_superhost,
        response_rate,
        host_created_at
    from __dbt__cte__obt
)

select * from hosts