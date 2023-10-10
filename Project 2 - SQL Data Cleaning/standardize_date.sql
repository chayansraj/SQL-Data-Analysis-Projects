alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
  drop column if exists sale_date
, drop column if exists sale_year
, drop column if exists sale_month;

-- alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
-- drop column if exists sale_year;

-- alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
-- drop column if exists sale_month;

alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
add column sale_date string
, add column sale_year string
, add column sale_month string;

update `sqlcovidanalysis.sqldatacleaning.nashville_raw`
  set sale_date = (cast(EXTRACT (DAY  FROM SaleDate ) as string))
, sale_year = (cast(EXTRACT (YEAR  FROM SaleDate ) as string))  
, sale_month = (cast(EXTRACT (MONTH  FROM SaleDate ) as string)) 
where true;
