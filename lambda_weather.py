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

    item = {
        "city": city,
        "timestamp": datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        "temperature": str(data["main"]["temp"]),
        "humidity": str(data["main"]["humidity"])
    }

    table.put_item(Item=item)

    return {
        "statusCode": 200,
        "body": "Data stored in DynamoDB"
    }