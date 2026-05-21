import json
import urllib.request
import boto3
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('weather_data')

def lambda_handler(event, context):

    api_key = "YOUR_API_KEY"
    city = "Kozhikode"

    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"

    response = urllib.request.urlopen(url)
    data = json.loads(response.read())

    return {
        "statusCode": 200,
        "body": "Connected to DynamoDB"
    }