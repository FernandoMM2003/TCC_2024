#create database AntiPlague;

use AntiPlague;

select count(*) from covid_data_total where location = 'China';
select count(*) from covid_data_total where location = 'United States';


select * from covid_data_total;

-- Tabela principal que contém todos os campos
CREATE TABLE covid_data (
    location VARCHAR(255),
    date DATE,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT,
    reproduction_rate FLOAT,
    icu_patients FLOAT,
    hosp_patients FLOAT,
    total_tests FLOAT,
    new_tests FLOAT,
    tests_per_case FLOAT,
    total_vaccinations FLOAT,
    people_vaccinated FLOAT,
    people_fully_vaccinated FLOAT,
    population_density FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty FLOAT,
    handwashing_facilities FLOAT,
    life_expectancy FLOAT,
    population FLOAT,
    PCA1 FLOAT,
    PCA2 FLOAT,
    PCA3 FLOAT,
    PCA4 FLOAT,
    cluster INT
);

-- Tabela principal que contém todos os campos
CREATE TABLE covid_data_total (
    sequencial INT,
    continent VARCHAR(255),
    location VARCHAR(255),
    date DATE,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT,
    reproduction_rate FLOAT,
    icu_patients FLOAT,
    hosp_patients FLOAT,
    total_tests FLOAT,
    new_tests FLOAT,
    tests_per_case FLOAT,
    total_vaccinations FLOAT,
    people_vaccinated FLOAT,
    people_fully_vaccinated FLOAT,
    population_density FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty FLOAT,
    handwashing_facilities FLOAT,
    life_expectancy FLOAT,
    population FLOAT,
    PCA1 FLOAT,
    PCA2 FLOAT,
    PCA3 FLOAT,
    PCA4 FLOAT,
    cluster INT
);


-- Tabela de informações gerais de casos e mortes
CREATE TABLE cases_deaths (
    location VARCHAR(255),
    date DATE,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT,
    reproduction_rate FLOAT,
    PRIMARY KEY (location, date)
);

-- Tabela de dados de hospitalização
CREATE TABLE hospitalization (
    location VARCHAR(255),
    date DATE,
    icu_patients FLOAT,
    hosp_patients FLOAT,
    PRIMARY KEY (location, date)
);

-- Tabela de testes e vacinação
CREATE TABLE tests_vaccinations (
    location VARCHAR(255),
    date DATE,
    total_tests FLOAT,
    new_tests FLOAT,
    tests_per_case FLOAT,
    total_vaccinations FLOAT,
    people_vaccinated FLOAT,
    people_fully_vaccinated FLOAT,
    PRIMARY KEY (location, date)
);

-- Tabela de dados demográficos e socioeconômicos
CREATE TABLE demographics_economics (
    location VARCHAR(255),
    population_density FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty FLOAT,
    handwashing_facilities FLOAT,
    life_expectancy FLOAT,
    population FLOAT,
    PRIMARY KEY (location)
);

-- Tabela de dados de PCA e cluster
CREATE TABLE pca_cluster (
    location VARCHAR(255),
    date DATE,
    PCA1 FLOAT,
    PCA2 FLOAT,
    PCA3 FLOAT,
    PCA4 FLOAT,
    cluster INT,
    PRIMARY KEY (location, date)
);
