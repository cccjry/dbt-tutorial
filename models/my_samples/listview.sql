{{ config(materialized='view') }}

SELECT
	schemaname,
	viewname as DataTableName,
	viewowner as owner,
	'views' as Material
FROM pg_catalog.pg_views
WHERE schemaname = 'dbt_jerrychen'
