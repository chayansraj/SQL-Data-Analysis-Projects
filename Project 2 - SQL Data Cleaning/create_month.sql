alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
drop column if exists sale_month; 

alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
add column sale_month string;

update `sqlcovidanalysis.sqldatacleaning.nashville_raw`
set sale_month = (cast(EXTRACT (MONTH  FROM SaleDate ) as string))
where true
