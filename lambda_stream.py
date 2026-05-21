import json
import boto3
from datetime import datetime

s3 = boto3.client('s3')

def lambda_handler(event, context):

    for record in event['Records']:
        if record['eventName'] == 'INSERT':

            data = record['dynamodb']['NewImage']

            item = {
                "city": data['city']['S'],
                "timestamp": data['timestamp']['S'],
                "temperature": data['temperature']['S'],
                "humidity": data['humidity']['S']
            }

            file_name = f"stream_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"

            s3.put_object(
                Bucket="weather-data-ann",
                Key=file_name,
                Body=json.dumps(item)
            )

    return "Stream processed"