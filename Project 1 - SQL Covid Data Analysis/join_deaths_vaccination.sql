-- Looking at Total Population vs Vaccinations

-- Below is the script for new vaccinations per day
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations
FROM `sqlcovidanalysis.covid_data_analysis.covid_deaths` AS deaths
JOIN `sqlcovidanalysis.covid_data_analysis.covid_vaccinations` AS vaccines
ON deaths.location = vaccines.location
AND deaths.date = vaccines.date
WHERE deaths.continent IS NOT NULL
ORDER BY population DESC, date ASC;
