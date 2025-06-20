with CTE as (
    select 
    TO_TIMESTAMP(started_at) as started_at,

    DATE(TO_TIMESTAMP(started_at)) as date_Started_at,

    HOUR(TO_TIMESTAMP(started_At)) as hour_Started_at,

    {{day_type('started_at')}} as DAY_TYPE,

    {{get_season('started_at')}} as STATION_OF_YEAR

    from
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)
select
* 
from CTE