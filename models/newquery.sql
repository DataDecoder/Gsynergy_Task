-- models/newquery.sql

{{ config(
    materialized='view'
)}}

select 
  parse_date('%Y-%m-%d', split(fae.fscldt_id, '|')[offset(0)]) as week_date,
  hs.str_id as str_id,
  hd.dstr_id as dstr_id,
  hr.rgn_id as rgn_id,
  sum(fae.average_unit_standardcost) as total_standardcost,
  sum(fae.average_unit_landedcost) as total_landedcost
from 
  {{ ref('fact_average_existing') }} as fae
join
  {{ ref('hierarchy_str') }} as hs
on
  split(fae.fscldt_id, '|')[offset(0)] = hs.str_id
join
  {{ ref('hierarchy_dstr') }} as hd
on
  split(fae.fscldt_id, '|')[offset(2)] = hd.dstr_id
join
  {{ ref('hierarchy_rgn') }} as hr
on
  split(fae.fscldt_id, '|')[offset(4)] = hr.rgn_id
group by
  week_date,
  str_id,
  dstr_id,
  rgn_id;
