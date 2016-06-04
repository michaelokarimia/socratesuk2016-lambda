#!/bin/bash
role="helloworld_exec_role"
function_name="helloworld"
aws lambda delete-function --function-name $function_name
aws iam delete-role --role-name $role
