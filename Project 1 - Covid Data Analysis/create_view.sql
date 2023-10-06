-- Creating a view to store data for later visualizations

CREATE VIEW `sqlcovidanalysis.covid_data_analysis.PercentPopulationVaccinated` AS
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations,
SUM(CAST(vaccines.new_vaccinations AS BIGINT)) OVER (PARTITION BY deaths.location ORDER BY deaths.location, deaths.date) AS RollingPeopleVaccinated
FROM `sqlcovidanalysis.covid_data_analysis.covid_deaths` AS deaths
JOIN `sqlcovidanalysis.covid_data_analysis.covid_vaccinations` AS vaccines
ON deaths.location = vaccines.location
AND deaths.date = vaccines.date
WHERE deaths.continent IS NOT NULL
