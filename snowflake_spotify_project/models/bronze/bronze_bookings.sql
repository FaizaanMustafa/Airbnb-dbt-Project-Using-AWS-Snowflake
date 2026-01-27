{{config(materialized='incremental')}}

select * from {{ source('sources', 'bookings') }}

{% if is_incremental() %}
    where created_at >= (select coalesce(max(created_at), '1900-01-01') from {{ this }})
{% endif %}