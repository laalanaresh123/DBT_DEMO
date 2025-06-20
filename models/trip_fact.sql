WITH TRIPS as
(
    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    date(to_timestamp(STARTED_AT)) as trip_date,
    start_station_id,
    end_station_id,
    member_csual as member_casual,
    timestampdiff(SECOND,to_timestamp(STARTED_AT),to_timestamp(ENDED_AT)) as TRIP_DURATION_SECONDS
    from 
    {{ source('demo', 'bike') }}    
    where ride_id != 'ride_id'
   
)
select * from TRIPS 
