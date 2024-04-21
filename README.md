# Gsynergy_Task

![image](https://github.com/DataDecoder/Gsynergy_Task/assets/72354914/ade0253a-132a-46f3-978e-bdbcaf020aec)

## Overview
Welcome to GSynergy DE TASK!
I have used DBT (DATA BUILT TOOL) for this project to transform raw data into analytics-ready tables in the data warehouse.

## Table of Contents
1. Project Structure
2. DBT Login
3. GCP


## Project Structure
models: Contain three subfolders: 
       1. example: Final.sql (output of the data set)
       2. Staging: Normalized data sets
       3. SQL files: 3 files of transformations, staging, and table creations in big query.

tests: Contains dbt tests to ensure data quality and integrity.
analysis: Contains SQL files for ad-hoc analysis and reporting.
macros: Contains reusable dbt macros for common tasks.

## DBT Login
Created a free developer profile and a new project into it. 

<img width="818" alt="image" src="https://github.com/DataDecoder/Gsynergy_Task/assets/72354914/ba9ca31b-9a17-4410-86db-dab9860744a2">


## GCP 
Under the project named gsynergy, all the raw data were uploaded, transformed, and then transferred back to dbt. 

<img width="601" alt="image" src="https://github.com/DataDecoder/Gsynergy_Task/assets/72354914/682353af-0a73-408e-8ad0-8db6f0288516">
