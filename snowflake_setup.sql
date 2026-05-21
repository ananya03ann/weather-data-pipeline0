-- Create Storage Integration
CREATE OR REPLACE STORAGE INTEGRATION s3_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = '<AWS_ROLE_ARN>'
STORAGE_ALLOWED_LOCATIONS = ('s3://weather-data-ann/');

-- Create Database and Schema
CREATE DATABASE weather_db;

USE DATABASE weather_db;

CREATE SCHEMA weather_schema;

USE SCHEMA weather_schema;