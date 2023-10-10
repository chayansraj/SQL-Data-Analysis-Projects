alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
drop column if exists sale_year; 

alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
add column sale_year string;

update `sqlcovidanalysis.sqldatacleaning.nashville_raw`
set sale_year = (cast(EXTRACT (YEAR  FROM SaleDate ) as string))
where true
