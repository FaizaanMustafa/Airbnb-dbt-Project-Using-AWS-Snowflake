{% set incremental_flag = 1%}
{% set incremental_colum = 'created_at' %}


select * from {{ source('sources', 'bookings') }}

{% if incremental_flag ==1 %}
    where {{incremental_column}} >= (select coalesce(max({{incremental_column}}), '1900-01-01') from {{ this }})
{% endif %}
