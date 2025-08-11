{{
    config(
        materialized='table',
        tags =['stg']
    )
}}
select 
DEPARTMENT_ID,
DEPARTMENT_NAME,
MANAGER_ID,
LOCATION_ID,
LOAD_TIME
from {{source('hr','SRC_DEPARTMENTS')}}
where DEPARTMENT_ID is not null