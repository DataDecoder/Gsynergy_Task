CREATE TABLE `gsynergy.dbt_datadecoder.mview_weekly_sales` AS
SELECT 
  dpos.site_id AS pos_site_id,
  fa.sku_id,
  dc.week AS fsclwk_id,
  dis.status AS price_substate_id,
  SUM(fa.average_unit_standardcost) AS total_sales_units,
  SUM(fa.average_unit_landedcost) AS total_sales_dollars,
  0 AS total_discount_dollars, -- Assuming no discount_dollars found in the fact table
  'type' AS type
FROM 
  `gsynergy.staging.fact_staged` fa
LEFT JOIN 
  `gsynergy.staging.dim_point_of_sale` dpos
ON 
  fa.sku_id = dpos.site_id
LEFT JOIN 
  `gsynergy.staging.dim_calendar` dc
ON 
  fa.fscldt_id = dc.date
LEFT JOIN 
  `gsynergy.staging.dim_inventory_status` dis
ON 
  fa.sku_id = dis.ret_id
GROUP BY 
  dpos.site_id,
  fa.sku_id,
  dc.week,
  dis.status;
