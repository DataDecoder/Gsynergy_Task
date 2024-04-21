
{{ config(
    materialized='view'
)}}

select 
  dpos.site_id as pos_site_id,
  fa.sku_id,
  dc.week as fsclwk_id,
  dis.status as price_substate_id,
  sum(fa.average_unit_standardcost) as total_sales_units,
  sum(fa.average_unit_landedcost) as total_sales_dollars,
  0 as total_discount_dollars, -- Assuming no discount_dollars found in the fact table
  'type' as type
from 
  {{ ref('fact_staged') }} fa
left join 
  {{ ref('dim_point_of_sale') }} dpos
on 
  fa.sku_id = dpos.site_id
left join 
  {{ ref('dim_calendar') }} dc
on 
  fa.fscldt_id = dc.date
left join 
  {{ ref('dim_inventory_status') }} dis
on 
  fa.sku_id = dis.ret_id
group by 
  dpos.site_id,
  fa.sku_id,
  dc.week,
  dis.status;
