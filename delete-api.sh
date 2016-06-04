#!/bin/bash
echo "Reading API id that I store in my create-api script"
api_id=$(<api_id.txt)

echo "Removing the permissions from the lambda"
aws lambda remove-permission \
  --function-name helloworld \
  --statement-id apigateway-helloworld-get
aws lambda remove-permission \
  --function-name helloworld \
  --statement-id apigateway-helloworld-get-test

echo "Deleting the API"
aws apigateway delete-rest-api \
  --rest-api-id "${api_id}"
