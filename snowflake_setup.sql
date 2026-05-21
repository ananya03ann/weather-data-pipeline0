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

-- Create JSON File Format
CREATE OR REPLACE FILE FORMAT json_format
TYPE = JSON;

-- Create External Stage
CREATE OR REPLACE STAGE weather_stage
URL = 's3://weather-data-ann/'
STORAGE_INTEGRATION = s3_int
FILE_FORMAT = json_format;