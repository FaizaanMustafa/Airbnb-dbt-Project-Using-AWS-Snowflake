

select * from SPOTIFY_DB.source.bookings


    where created_at >= (select coalesce(max(created_at), '1900-01-01') from SPOTIFY_DB.bronze.bronze_bookings)
