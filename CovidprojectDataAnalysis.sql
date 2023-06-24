select location, date, new_cases, total_cases, total_deaths, population  
from covidproject..death
order by 1, 2
-- Percentage of Death per Total case from countries with name containing "istan"
select location, date, total_cases, total_deaths, round((total_deaths/total_cases)*100, 2) as deathRatio
from covidproject..death
where location like '%istan%'
order by 1, 2

-- Percentage of Death per Total case from Vietnam
select location, date, total_cases, total_deaths, round((total_deaths/total_cases)*100, 2) as deathRatio
from covidproject..death
where location = 'vietnam'
order by 1, 2

-- Percentage of people infected COVID-19 in Vietnam
select location, date, population, total_cases, round((total_cases/population)*100, 2) as infectedRatio
from covidproject..death
where location = 'vietnam'
order by 1, 2

-- total case as of april 30, 2021 by country
select location, population, max(total_cases) as highestInfectedCount, round(max((total_cases/population)*100), 2) as infectedRatio
from covidproject..death
where continent is not null
group by location, population
order by infectedRatio desc

-- total death as of april 30, 2021 by country
select location, max(cast(total_deaths as int)) as TotalDeath
from covidproject..death
where continent is not null
group by location 
order by TotalDeath desc

-- global number 
select location, population, max(total_cases) as highestInfectedCount, round(max((total_cases/population)*100), 2) as infectedRatio
from covidproject..death
where continent is not null
group by location, population
order by infectedRatio desc