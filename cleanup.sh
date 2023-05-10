#!/bin/bash

buckets=$(aws s3api list-buckets --query "Buckets[?contains(Name,'webserversforresiliencytesting-canarybucket
')].Name" --output text)
for bucket_name in ${buckets[@]}; do
    #echo $bucket_name
    aws s3 rm s3://$bucket_name --recursive
    aws s3 rb s3://$bucket_name --force
done;                                 


#Ohio
#aws cloudformation delete-stack --stack-name MySQLReadReplicaResiliencyTesting --region us-east-2
aws cloudformation delete-stack --stack-name WebServersForResiliencyTesting --region us-east-2
aws cloudformation delete-stack --stack-name MySQLforResiliencyTesting --region us-east-2
aws cloudformation delete-stack --stack-name ResiliencyVPC --region us-east-2
aws cloudformation delete-stack --stack-name DeployResiliencyWorkshop --region us-east-2

#Oregon
aws cloudformation delete-stack --stack-name DMSforResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name MySQLReadReplicaResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name WebServersforResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name MySQLforResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name ResiliencyVPC --region us-west-2

aws iam delete-role-policy --role-name LambdaCustomResourceRole-SecureSsmForRds --policy-name LambdaCustomResourcePolicy
aws iam delete-role --role-name LambdaCustomResourceRole-SecureSsmForRds

#aws iam delete-service-linked-role --role-name AWSServiceRoleForAutoScaling
#aws iam delete-service-linked-role --role-name AWSServiceRoleForElasticLoadBalancing
#aws iam delete-service-linked-role --role-name AWSServiceRoleForRDS


aws ssm delete-parameter --name 300-ResiliencyofEC2RDSandS3
