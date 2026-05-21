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

    return "Stream processed"