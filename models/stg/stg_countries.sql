{{
    config(
        materialized='table',
        tags =['stg']
    )
}}
select 
COUNTRY_ID,
COUNTRY_NAME,
REGION_ID,
LOAD_TIME
from {{source('hr','SRC_COUNTRIES')}}
where COUNTRY_ID is not null