
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

),

source_data2 as (

    select 2 as id
    union ALL
    select null as id

)

select * from source_data
union
select * from source_data2

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
