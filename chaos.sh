aws ec2 describe-vpcs --filter Name=tag:Name,Values=ResiliencyVPC --query Vpcs[0].VpcId
aws cloudformation describe-stacks --stack-name WebServersForResiliencyTesting --query Stacks[0].Outputs

http://ResiliencyTestLoadBalancer-1304143913.us-east-2.elb.amazonaws.com