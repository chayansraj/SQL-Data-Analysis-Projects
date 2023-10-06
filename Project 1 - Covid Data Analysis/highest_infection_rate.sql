-- Looking at Total Cases vs Population (Percentage of population that got Covid)

--SELECT location, date, total_cases, population, ROUND((total_cases/population)*100,2) AS percent_cases
--FROM `sqlcovidanalysis.covid_data_analysis.covid_death_usable_data` 



-- Looking at Countries with highest infection rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX(ROUND((total_cases/population)*100,2)) AS PercentPopulationInfected
FROM `sqlcovidanalysis.covid_data_analysis.covid_death_usable_data` 
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC
