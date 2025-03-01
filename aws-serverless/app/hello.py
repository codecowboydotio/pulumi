import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)



def handler(event, context):
    return {"statusCode": 200, "body": json.dumps("Cheers from AWS Lambda!!")}
