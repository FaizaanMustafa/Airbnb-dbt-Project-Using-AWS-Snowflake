{{config(materialized='incremental', unique_key='booking_id')}}


select 
    booking_id,
    listing_id,
    booking_date,
    {{multiply('booking_amount','nights_booked', 2)}} as total_amount,
    service_fee,
    cleaning_fee,
    booking_status,
    created_at as booking_created_at 
from 
    {{ref("bronze_bookings")}} 
