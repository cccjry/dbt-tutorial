{{ config(materialized='view') }}

SELECT 
	schemaname,
	tablename as DataTableName,
	tableowner as owner,
	'table' as Material
FROM pg_catalog.pg_tables
WHERE schemaname = 'dbt_jerrychen'