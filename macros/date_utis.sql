{% macro get_season(x) %}

  CASE 
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (12,1,2)
        THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (3,4,5)
        THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{x}})) in (5,6,7)
        THEN 'SUMMER'
        ELSE 'AUTUMN'
        END 
{% endmacro %}

{% macro day_type(x) %}

    CASE
        WHEN DAYNAME(TO_TIMESTAMP({{x}})) in ('sat','sun')
        THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END 
{% endmacro %}
