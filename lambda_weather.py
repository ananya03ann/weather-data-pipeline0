import json
import urllib.request
import boto3
from datetime import datetime

def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "Lambda started"
    }