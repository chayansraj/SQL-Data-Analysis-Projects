-- Let's see how the statistics looks like from a continent view

SELECT continent, MAX(total_cases) AS TotalCasesCount, MAX(total_deaths) AS TotalDeathCount, 
ROUND((MAX(total_deaths)/MAX(population))*100,2) AS PercentTotalDeath
FROM `sqlcovidanalysis.covid_data_analysis.covid_death_usable_data`
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC, TotalCasesCount DESC;
