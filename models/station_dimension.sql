WITH BIKE as
(
    select 
    distinct
    start_station_id as station_id,
    start_station_name as station_name,
    start_lat as station_lat,
    start_lng as station_lng
    from 
    {{ source('demo', 'bike') }}    
    where ride_id != 'ride_id'
   
)
select * from BIKE 
