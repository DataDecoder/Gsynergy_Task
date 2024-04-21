##Normalize hierarchy tables into separate tables for each level
#Create normalized hierarchy tables

#Create dimension table for holiday
CREATE TABLE `gsynergy.staging.dim_holiday` AS
SELECT
  holiday_code,
  holiday_name
FROM 
  `gsynergy.dataset.heir_hldy_existing`;

#Create dimension table for inventory location
CREATE TABLE `gsynergy.staging.dim_inventory_location` AS
SELECT
  location_id,
  location_name,
  location_type,
  location_sub_type
FROM 
  `gsynergy.dataset.heir_invloc_existing`;

#Create dimension table for calendar
CREATE TABLE `gsynergy.staging.dim_calendar` AS
SELECT
  date,
  month,
  year,
  week,
  quarter,
  fiscal_year,
  fiscal_period,
  period_name,
  start_date,
  end_date,
  field_11_raw,
  field_12_raw,
  field_13_raw,
  field_14_raw,
  field_15_raw,
  field_16_raw,
  field_17
FROM 
  `gsynergy.dataset.hier_clnd_existing`;

#Create dimension table for inventory status
CREATE TABLE `gsynergy.staging.dim_inventory_status` AS
SELECT
  ret_id,
  location_name,
  location_type,
  location_sub_type,
  state,
  status
FROM 
  `gsynergy.dataset.hier_invstat_existing`;

#Create dimension table for point of sale
CREATE TABLE `gsynergy.staging.dim_point_of_sale` AS
SELECT
  site_id,
  site_label,
  subchnl_id,
  subchnl_label,
  chnl_id,
  chnl_label
FROM 
  `gsynergy.dataset.hier_poss_existing`;

#Create dimension table for retail hierarchy
CREATE TABLE `gsynergy.staging.dim_retail_hierarchy` AS
SELECT
  str,
  str_label,
  dstr,
  dstr_label,
  rgn,
  rgn_label
FROM 
  `gsynergy.dataset.hier_rtl_existing`;

#Create staged fact table with foreign key relationships
CREATE TABLE `gsynergy.staging.fact_staged` AS
SELECT 
  fa.fscldt_id,
  fa.sku_id,
  fa.average_unit_standardcost,
  fa.average_unit_landedcost,
  dh.holiday_code,
  dil.location_id,
  dc.date,
  dis.ret_id,
  dpos.site_id,
  drh.str
FROM 
  `gsynergy.dataset.fact_average_existing` fa
LEFT JOIN 
  `gsynergy.staging.dim_holiday` dh
ON 
  fa.fscldt_id = dh.holiday_code
LEFT JOIN 
  `gsynergy.staging.dim_inventory_location` dil
ON 
  fa.sku_id = dil.location_id
LEFT JOIN 
  `gsynergy.staging.dim_calendar` dc
ON 
  fa.fscldt_id = dc.date
LEFT JOIN 
  `gsynergy.staging.dim_inventory_status` dis
ON 
  fa.sku_id = dis.ret_id
LEFT JOIN 
  `gsynergy.staging.dim_point_of_sale` dpos
ON 
  fa.sku_id = dpos.site_id
LEFT JOIN 
  `gsynergy.staging.dim_retail_hierarchy` drh
ON 
  fa.sku_id = drh.str;