#!/bin/bash

##create the lambda package
zip -j helloworld.zip *.py

### Create the role for the lambda to assume
role="helloworld_exec_role"
trust="trust.json"
aws iam create-role --role-name $role --assume-role-policy-document file://$trust
aws iam update-assume-role-policy --role-name $role --policy-document file://$trust

### Create the lambda function
function_name="helloworld"
handler_name="helloworld.lambda_handler"
package_file=helloworld.zip
runtime=python2.7
aws lambda create-function \
  --function-name $function_name \
  --handler $handler_name \
  --runtime $runtime \
  --memory 512 \
  --timeout 60 \
  --role arn:aws:iam::${AWS_ACCOUNT_ID}:role/$role \
  --zip-file fileb://$package_file
