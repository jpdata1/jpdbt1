{{
    config(
        materialized='incremental',
        unique_key='location_id',
	incremental_strategy = 'delete+insert',
	tags = ['dim']
    )
}}
select
	REGION_ID ,
	REGION_NAME ,
	current_timestamp as LOAD_TIME 
from {{source('hr','stg_regions')}}

{% if is_incremental() %}

{{ inc() }}

{% endif %}