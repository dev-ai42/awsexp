buckets=$(aws s3api list-buckets --query "Buckets[?contains(Name,'test')].Name" --output text)
for bucket_name in ${buckets[@]}; do
    #echo $bucket_name
    aws s3 rm s3://$bucket_name --recursive
    aws s3 rb s3://$bucket_name --force
done;                                 

#Oregon
aws cloudformation delete-stack --stack-name DMSforResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name MySQLReadReplicaResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name WebServersforResiliencyTesting	 --region us-west-2
aws cloudformation delete-stack --stack-name MySQLforResiliencyTesting --region us-west-2
aws cloudformation delete-stack --stack-name ResiliencyVPC --region us-west-2


#Ohio
aws cloudformation delete-stack --stack-name MySQLReadReplicaResiliencyTesting --region us-east-2
aws cloudformation delete-stack --stack-name WebServersforResiliencyTesting	 --region us-east-2
aws cloudformation delete-stack --stack-name MySQLforResiliencyTesting	 --region us-east-2
aws cloudformation delete-stack --stack-name ResiliencyVPC --region us-east-2
aws cloudformation delete-stack --stack-name DeployResiliencyWorkshop --region us-east-2
