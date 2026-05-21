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

-- Create Weather Table
CREATE OR REPLACE TABLE weather_table (
    city STRING,
    timestamp TIMESTAMP,
    temperature FLOAT,
    humidity FLOAT
);

-- Create Snowpipe
CREATE OR REPLACE PIPE weather_pipe
AUTO_INGEST = TRUE
AS
COPY INTO weather_table
FROM (
    SELECT
        $1:city::STRING,
        TO_TIMESTAMP($1:timestamp::STRING),
        $1:temperature::FLOAT,
        $1:humidity::FLOAT
    FROM @weather_stage
);