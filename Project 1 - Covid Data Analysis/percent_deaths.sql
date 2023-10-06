-- Looking at Total Cases vs Total Deaths (Percentage of affected people who died)

SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100,2) AS percent_deaths
FROM `sqlcovidanalysis.covid_data_analysis.covid_death_usable_data` 
