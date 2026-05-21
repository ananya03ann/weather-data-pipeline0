# 🌦️ Weather Data Pipeline (AWS + Snowflake)

## 📌 Project Overview
This project implements a real-time weather data pipeline using AWS services and Snowflake.

The pipeline automatically fetches weather data, processes it through AWS services, stores it in Amazon S3, and ingests it into Snowflake using Snowpipe.

---

## 🏗️ Architecture


EventBridge  
↓  
Lambda (Weather API Fetch)  
↓  
DynamoDB  
↓  
DynamoDB Streams  
↓  
Lambda (Stream Processing)  
↓  
Amazon S3  
↓  
Snowpipe  
↓  
Snowflake