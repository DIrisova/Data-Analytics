/*
Covid 19 Data Exploration 

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/


-- ALTER TABLE [dbo].[CovidDeath1]
-- drop COLUMN new_tests,	total_tests_per_thousand,	new_tests_per_thousand,	new_tests_smoothed,	new_tests_smoothed_per_thousand,	positive_rate,	tests_per_case,	tests_units,	total_vaccinations,	people_vaccinated,	people_fully_vaccinated,	total_boosters,	new_vaccinations,	new_vaccinations_smoothed,	total_vaccinations_per_hundred,	people_vaccinated_per_hundred,	people_fully_vaccinated_per_hundred,	total_boosters_per_hundred,	new_vaccinations_smoothed_per_million,	new_people_vaccinated_smoothed,	new_people_vaccinated_smoothed_per_hundred,	stringency_index,	population_density,	median_age,	aged_65_older,	aged_70_older,	gdp_per_capita,	extreme_poverty,	cardiovasc_death_rate,	diabetes_prevalence,	female_smokers,	male_smokers,	handwashing_facilities,	hospital_beds_per_thousand,	life_expectancy,	human_development_index,	excess_mortality_cumulative_absolute,	excess_mortality_cumulative,	excess_mortality,	excess_mortality_cumulative_per_million


-- ALTER TABLE [dbo].[CovidVaccination1]
-- drop column total_cases,	new_cases,	new_cases_smoothed,	total_deaths,	new_deaths,	new_deaths_smoothed,	total_cases_per_million,	new_cases_per_million,	new_cases_smoothed_per_million,	total_deaths_per_million,	new_deaths_per_million,	new_deaths_smoothed_per_million,	reproduction_rate,	icu_patients,	icu_patients_per_million,	hosp_patients,	hosp_patients_per_million,	weekly_icu_admissions,	weekly_icu_admissions_per_million,	weekly_hosp_admissions,	weekly_hosp_admissions_per_million,	total_tests, population

select top 10 * from [dbo].[CovidDeath1]
select top 10 * from [dbo].[CovidVaccination1]


-- Select data that I'm going to use

SELECT LOCATION, DATE, total_cases, new_cases, total_deaths, population
from [dbo].[CovidDeath1]
order by 1,2

-- Total cases vs Total Deaths 
-- error handling: 
-- Use NULLIF to Avoid Division by Zero: NULLIF is a function that returns NULL if the two arguments are equal, otherwise, it returns the first argument. You can use this function to replace zero values with NULL in the denominator, thus avoiding the division by zero error.
-- shows likelihood of dying if you contract covid in your country
SELECT LOCATION, DATE, total_cases, total_deaths, (total_deaths / NULLIF(total_cases, 0))*100 as death_rate
from [dbo].[CovidDeath1]
where location like '%zbekis%'
-- order by 1,2
order by total_deaths DESC


-- total cases vs population
-- Shows what percentage of population got Covid
SELECT LOCATION, DATE, population, total_cases, (total_cases/population)*100 as totalInfected 
from [dbo].[CovidDeath1]
where location like '%United states%'
-- order by 1,2
order by totalInfected DESC


-- countries with highest infection rate compared to population
SELECT LOCATION, population, max(total_cases) as highestInfectionCount, max((total_cases/population))*100 as percentPopulationInfected 
from [dbo].[CovidDeath1]
-- where location like '%state%'
group by LOCATION, population
order by percentPopulationInfected DESC

-- Countries with highest death count per population 
SELECT location, max(total_deaths) as TotalDeathsCount
from [dbo].[CovidDeath1]
where continent is not null
group by LOCATION
order by TotalDeathsCount DESC



-- BREAKING THINGS DOWN BY CONTINENT
-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From [dbo].[CovidDeath1]
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From [dbo].[CovidDeath1]
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2


-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [dbo].[CovidDeath1] dea
Join [dbo].[CovidVaccination1] vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3



-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [dbo].[CovidDeath1] dea
Join [dbo].[CovidVaccination1] vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac

-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [dbo].[CovidDeath1] dea
Join [dbo].[CovidVaccination1] vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated



select * from #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From [dbo].[CovidDeath1] dea
Join [dbo].[CovidVaccination1] vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 


