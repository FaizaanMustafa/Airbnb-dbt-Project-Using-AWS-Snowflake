{{config(materialized='incremental', unique_key='listing_id')}}


select 
    listing_id,
    host_id,
    {{upper('property_type')}} as property_type,
    {{upper('room_type')}} as room_type,
    {{upper('city')}} as city,
    {{upper('country')}} as country,
    accommodates,
    bathrooms,
    bedrooms,
    price_per_night,
    {{tag('price_per_night')}} as price_per_night_tag,
    created_at as listing_created_at
from 
    {{ref("bronze_listings")}}







