#!/bin/bash

stack_name=DeployResiliencyWorkshop
file_name=chaos_mult_min.json

aws cloudformation create-stack \
    --stack-name $stack_name \
    --template-body file://$file_name \
    --parameters ParameterKey=CreateTheAutoScalingServiceRole,ParameterValue=true \
      ParameterKey=CreateTheELBServiceRole,ParameterValue=true \
      ParameterKey=CreateTheRDSServiceRole,ParameterValue=true \
    --capabilities CAPABILITY_NAMED_IAM

