{{
    config(
        materialized='incremental',
        unique_key='DEPARTMENT_ID'
    )
}}
select name,
DEPARTMENT_ID,
DEPARTMENT_NAME,
MANAGER_ID,
LOCATION_ID,
LOAD_TIME
from {{source('hr','SRC_DEPARTMENTS')}}

{% if is_incremental() %}
where LOAD_TIME > (select coalesce(max(LOAD_TIME),'1900-01-01') from {{this}})
{% endif %}