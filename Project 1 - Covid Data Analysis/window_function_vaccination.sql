-- Let's use window function to find the total number of vaccinations per location and date

SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations,
SUM(CAST(vaccines.new_vaccinations AS BIGINT)) OVER (PARTITION BY deaths.location ORDER BY deaths.location, deaths.date) AS RollingPeopleVaccinated
FROM `sqlcovidanalysis.covid_data_analysis.covid_deaths` AS deaths
JOIN `sqlcovidanalysis.covid_data_analysis.covid_vaccinations` AS vaccines
ON deaths.location = vaccines.location
AND deaths.date = vaccines.date
WHERE deaths.continent IS NOT NULL
ORDER BY population DESC, date ASC;
