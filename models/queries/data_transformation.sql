-- Create fact_average table
CREATE TABLE `gsynergy.dataset.fact_average_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS fscldt_id,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS sku_id,
  IF(REGEXP_CONTAINS(SPLIT(string_field_0, '|')[OFFSET(2)], r'^[\d.]+$'), CAST(SPLIT(string_field_0, '|')[OFFSET(2)] AS FLOAT64), NULL) AS average_unit_standardcost,
  IF(REGEXP_CONTAINS(SPLIT(string_field_0, '|')[OFFSET(3)], r'^[\d.]+$'), CAST(SPLIT(string_field_0, '|')[OFFSET(3)] AS FLOAT64), NULL) AS average_unit_landedcost
FROM 
  `gsynergy.dataset.fact_average`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL;

-- Create fact_avg table
CREATE TABLE `gsynergy.dataset.fact_avg_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS fscldt_id,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS sku_id,
  IF(REGEXP_CONTAINS(SPLIT(string_field_0, '|')[OFFSET(2)], r'^[\d.]+$'), CAST(SPLIT(string_field_0, '|')[OFFSET(2)] AS FLOAT64), NULL) AS average_unit_standardcost,
  IF(REGEXP_CONTAINS(SPLIT(string_field_0, '|')[OFFSET(3)], r'^[\d.]+$'), CAST(SPLIT(string_field_0, '|')[OFFSET(3)] AS FLOAT64), NULL) AS average_unit_landedcost
FROM 
  `gsynergy.dataset.fact_avg`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL;

-- Create fact_avgcost table
CREATE TABLE `gsynergy.dataset.fact_avgcost_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS field_1,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS field_2,
  SPLIT(string_field_0, '|')[OFFSET(2)] AS field_3,
  SPLIT(string_field_0, '|')[OFFSET(3)] AS field_4,
  SPLIT(string_field_0, '|')[OFFSET(4)] AS field_5,
  SPLIT(string_field_0, '|')[OFFSET(5)] AS field_6,
  SPLIT(string_field_0, '|')[OFFSET(6)] AS field_7,
  SPLIT(string_field_0, '|')[OFFSET(7)] AS field_8,
  SPLIT(string_field_0, '|')[OFFSET(8)] AS field_9,
  SPLIT(string_field_0, '|')[OFFSET(9)] AS field_10,
  SPLIT(string_field_0, '|')[OFFSET(10)] AS field_11,
  SPLIT(string_field_0, '|')[OFFSET(11)] AS field_12
FROM 
  `gsynergy.dataset.fact_avgcost`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(4)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(5)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(6)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(7)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(8)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(9)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(10)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(11)] IS NOT NULL;

-- Create heir_hldy table
CREATE TABLE `gsynergy.dataset.heir_hldy_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS holiday_code,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS holiday_name
FROM 
  `gsynergy.dataset.heir_hldy`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL;

-- Create heir_invloc table
CREATE TABLE `gsynergy.dataset.heir_invloc_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS location_id,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS location_name,
  SPLIT(string_field_0, '|')[OFFSET(2)] AS location_type,
  SPLIT(string_field_0, '|')[OFFSET(3)] AS location_sub_type
FROM 
  `gsynergy.dataset.heir_invloc`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL;

-- Create hier_clnd table
CREATE TABLE `gsynergy.dataset.hier_clnd_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS date,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS month,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 3, SPLIT(string_field_0, '|')[OFFSET(2)], NULL) AS year,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 4, SPLIT(string_field_0, '|')[OFFSET(3)], NULL) AS week,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 5, SPLIT(string_field_0, '|')[OFFSET(4)], NULL) AS quarter,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 6, SPLIT(string_field_0, '|')[OFFSET(5)], NULL) AS fiscal_year,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 7, SPLIT(string_field_0, '|')[OFFSET(6)], NULL) AS fiscal_period,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 8, SPLIT(string_field_0, '|')[OFFSET(7)], NULL) AS period_name,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 9, SPLIT(string_field_0, '|')[OFFSET(8)], NULL) AS start_date,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 10, SPLIT(string_field_0, '|')[OFFSET(9)], NULL) AS end_date,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 12, SPLIT(string_field_0, '|')[OFFSET(11)], NULL) AS field_11_raw,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 13, SPLIT(string_field_0, '|')[OFFSET(12)], NULL) AS field_12_raw,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 14, SPLIT(string_field_0, '|')[OFFSET(13)], NULL) AS field_13_raw,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 15, SPLIT(string_field_0, '|')[OFFSET(14)], NULL) AS field_14_raw,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 16, SPLIT(string_field_0, '|')[OFFSET(15)], NULL) AS field_15_raw,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 17, SPLIT(string_field_0, '|')[OFFSET(16)], NULL) AS field_16_raw,
  IF(ARRAY_LENGTH(SPLIT(string_field_0, '|')) >= 18, SPLIT(string_field_0, '|')[OFFSET(17)], NULL) AS field_17
FROM 
  `gsynergy.dataset.hier_clnd`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL;

-- Create hier_invstat table
CREATE TABLE `gsynergy.dataset.hier_invstat_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS ret_id,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS location_name,
  SPLIT(string_field_0, '|')[OFFSET(2)] AS location_type,
  SPLIT(string_field_0, '|')[OFFSET(3)] AS location_sub_type,
  SPLIT(string_field_0, '|')[OFFSET(4)] AS state,
  SPLIT(string_field_0, '|')[OFFSET(5)] AS status
FROM 
  `gsynergy.dataset.hier_invstat`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(4)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(5)] IS NOT NULL;

-- Create hier_poss table
CREATE TABLE `gsynergy.dataset.hier_poss_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS site_id,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS site_label,
  SPLIT(string_field_0, '|')[OFFSET(2)] AS subchnl_id,
  SPLIT(string_field_0, '|')[OFFSET(3)] AS subchnl_label,
  SPLIT(string_field_0, '|')[OFFSET(4)] AS chnl_id,
  SPLIT(string_field_0, '|')[OFFSET(5)] AS chnl_label
FROM 
  `gsynergy.dataset.hier_poss`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(4)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(5)] IS NOT NULL;

-- Create hier_rtl table
CREATE TABLE `gsynergy.dataset.hier_rtl_existing` AS
SELECT 
  SPLIT(string_field_0, '|')[OFFSET(0)] AS str,
  SPLIT(string_field_0, '|')[OFFSET(1)] AS str_label,
  SPLIT(string_field_0, '|')[OFFSET(2)] AS dstr,
  SPLIT(string_field_0, '|')[OFFSET(3)] AS dstr_label,
  SPLIT(string_field_0, '|')[OFFSET(4)] AS rgn,
  SPLIT(string_field_0, '|')[OFFSET(5)] AS rgn_label
FROM 
  `gsynergy.dataset.hier_rtl`
WHERE
  SPLIT(string_field_0, '|')[OFFSET(0)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(1)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(2)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(3)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(4)] IS NOT NULL
  AND SPLIT(string_field_0, '|')[OFFSET(5)] IS NOT NULL;
