-- Looking at Countries with highest death rate compared to Population

SELECT location, population, MAX(total_deaths) AS HighestDeathCount, MAX(ROUND((total_deaths/population)*100,2)) AS PercentPopulationDeath
FROM `sqlcovidanalysis.covid_data_analysis.covid_death_usable_data` 
-- Here we see that there are some rows that have continents or income countries in them that shouldn't be in the output, let's try to exclude them

-- WHERE location NOT IN ('Low income', 'United Arab Emirates','Africa', 'Asia', 'Lower middle income' , 'World', 'Upper middle income' , 'Europe','High income' ) OR we could use
WHERE continent IS NOT NULL    -- this is because when the continent column is null, the actual location is the continent and we remove that.
GROUP BY location, population
ORDER BY PercentPopulationDeath DESC
