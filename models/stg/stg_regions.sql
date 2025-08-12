{{
    config(
        materialized='table',
        tags =['stg']
    )
}}
select 
region_id,
INITCAP(region_name) as region_name,
current_timestamp() as LOAD_TIME
from {{source('hr','src_regions')}}
where region_id is not null