-- Select data that we will use

SELECT location, continent, date, total_cases, new_cases, total_deaths, population
FROM `sqlcovidanalysis.covid_data_analysis.covid_deaths`
ORDER BY location, date, population 

-- It is clearly seen that deaths come after there are new cases so it makes sense.
