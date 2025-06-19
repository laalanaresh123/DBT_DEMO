with CTE as (
    select 
    TO_TIMESTAMP(started_at) as started_at,
    DATE(TO_TIMESTAMP(started_at)) as date_Started_at,
    HOUR(TO_TIMESTAMP(started_At)) as hour_Started_at,
    CASE
    WHEN DAYNAME(TO_TIMESTAMP(started_At)) in ('sat','sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END AS DAY_TYPE,
    CASE WHEN MONTH(TO_TIMESTAMP(started_At)) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(started_At)) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(started_at)) in (5,6,7)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS STATION_OF_YEAR
    from
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)
select
* 
from CTE