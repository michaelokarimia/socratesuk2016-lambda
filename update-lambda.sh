#!/bin/bash

### Create the lambda package
zip -j helloworld.zip *.py

function_name="helloworld"
package_file=helloworld.zip

### Update the lambda code
aws lambda update-function-code \
  --function-name $function_name \
  --zip-file fileb://$package_file
