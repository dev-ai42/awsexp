aws ec2 describe-vpcs --filter Name=tag:Name,Values=ResiliencyVPC --query Vpcs[0].VpcId
aws cloudformation describe-stacks --stack-name WebServersForResiliencyTesting --query Stacks[0].Outputs

aws s3api get-object --bucket aws-well-architected-labs-ohio --key Reliability/web_server_autoscaling.json web_server_autoscaling.json