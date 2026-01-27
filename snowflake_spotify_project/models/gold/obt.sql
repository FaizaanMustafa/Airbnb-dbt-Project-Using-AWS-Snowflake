{% set configs = [
    {
        "table":"spotify_db.silver.silver_bookings",
        "columns": "silver_bookings.*",
        "alias":"silver_bookings"
    },
    {
        "table":"spotify_db.silver.silver_listings",
        "columns": "silver_listings.host_id,silver_listings.property_type,silver_listings.room_type,silver_listings.city,silver_listings.country,silver_listings.accommodates,silver_listings.bathrooms,silver_listings.bedrooms,silver_listings.price_per_night,silver_listings.price_per_night_tag,silver_listings.listing_created_at",
        "alias":"silver_listings",
        "joinned_condition":"silver_bookings.listing_id = silver_listings.listing_id"
    },
    {
        "table":"spotify_db.silver.silver_hosts",
        "columns": "silver_hosts.host_name,silver_hosts.host_since,silver_hosts.is_superhost,silver_hosts.response_rate,silver_hosts.response_rate_category,silver_hosts.host_created_at",
        "alias":"silver_hosts",
        "joinned_condition":"silver_listings.host_id = silver_hosts.host_id"
    }
    
]%}

select 
    {% for config in configs %}
        {{config.columns}}{%if not loop.last%},{%endif%}
    {%endfor%}
from
   {%for config in configs%}
   {%if loop.first%}
        {{config.table}} as {{config.alias}}
   {%else%}
        left join {{config.table}} as {{config.alias}}
            on {{config.joinned_condition}}
            {%endif%}
            {%endfor%} 
        