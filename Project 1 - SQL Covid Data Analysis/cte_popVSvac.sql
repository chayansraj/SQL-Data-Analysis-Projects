-- CTE is a temporary dataset returned by a query, which is then used by another query. It’s temporary because the system does not store the results anywhere; it exists only when you run the query. 


WITH PopVSVac AS (

SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations,
SUM(CAST(vaccines.new_vaccinations AS BIGINT)) OVER (PARTITION BY deaths.location ORDER BY deaths.location, deaths.date) AS RollingPeopleVaccinated
FROM `sqlcovidanalysis.covid_data_analysis.covid_deaths` AS deaths
JOIN `sqlcovidanalysis.covid_data_analysis.covid_vaccinations` AS vaccines
ON deaths.location = vaccines.location
AND deaths.date = vaccines.date
WHERE deaths.continent IS NOT NULL
)

SELECT *
FROM PopVSVac
ORDER BY population DESC, date ASC;
