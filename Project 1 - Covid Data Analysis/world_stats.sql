-- Now let's see the world stats on a daily basis, the new cases and new deaths

SELECT date, 
SUM(new_cases) AS TotalNewCases, 
SUM(new_deaths) AS TotalNewDeaths, 
ROUND((SUM(NULLIF(new_deaths,0) )/SUM(NULLIF(new_cases,0 )))*100,2) AS TotalNewDeathPercentage
FROM `sqlcovidanalysis.covid_data_analysis.covid_deaths`
GROUP BY date
ORDER BY TotalNewDeathPercentage DESC;

-- Looks like on 24th February 2020, the death percentage was highest standing at 30.08%, could also be known as the deadliest day in the world. 
