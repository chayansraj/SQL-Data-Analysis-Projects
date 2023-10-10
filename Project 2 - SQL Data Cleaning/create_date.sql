alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
drop column if exists sale_date; 

alter table `sqlcovidanalysis.sqldatacleaning.nashville_raw`
add column sale_date string;

update `sqlcovidanalysis.sqldatacleaning.nashville_raw`
set sale_date = (cast(EXTRACT (DAY  FROM SaleDate ) as string))
where true
