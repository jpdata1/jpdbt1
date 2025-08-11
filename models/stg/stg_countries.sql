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
from {{source('hr','src_countries')}}
where COUNTRY_ID is not null