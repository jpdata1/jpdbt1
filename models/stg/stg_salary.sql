{{
    config(
        materialized='table',
        tags=['stg']
    )
}}
select 
	EMPLOYEE_ID ,
	FIRST_NAME ,
	LAST_NAME ,
	JOB_TITLE ,
	DEPARTMENT_NAME ,
	CITY ,
	COUNTRY_NAME ,
	REGION_NAME ,
	SALARY_DATE DATE,
	HRA ,
	ALLOWANCES ,
	PF ,
	LOAD_TIME 
from {{source('hr','src_salary')}}
where employee_id  is not null