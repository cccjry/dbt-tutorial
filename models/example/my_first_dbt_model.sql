
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table', schema='test_target') }}

with source_data as (

    select 1 as id
    union all
    select null as id

),

source_data2 as (

    select 2 as id

)

select * from source_data
where source_data.id is not null

union
select * from source_data2
