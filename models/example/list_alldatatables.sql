{{ config(materialized='view') }}

with tables as (

    select * from {{ ref('listtable') }}

),

views as (

    select * from {{ ref('listview')}}
),

final as (
    select * from tables
    UNION
    select * from views
)

select * from final