#!/bin/bash

aws s3api get-object --bucket aws-well-architected-labs-ohio --key Reliability/VPCLambda.zip VPCLambda.zip
aws s3api get-object --bucket aws-well-architected-labs-ohio --key Reliability/WaitForStack.zip WaitForStack.zip
aws s3api get-object --bucket aws-well-architected-labs-ohio --key Reliability/RDSLambda.zip RDSLambda.zip
aws s3api get-object --bucket aws-well-architected-labs-ohio --key Reliability/MultiAZDBLambda.zip MultiAZDBLambda.zip
aws s3api get-object --bucket aws-well-architected-labs-ohio --key Reliability/WebAppLambda.zip WebAppLambda.zip

unzip -q VPCLambda.zip -d VPCLambda
unzip -q WaitForStack.zip -d WaitForStack
unzip -q RDSLambda.zip -d RDSLambda
unzip -q MultiAZDBLambda.zip -d MultiAZDBLambda
unzip -q WebAppLambda.zip -d WebAppLambda

rm *Lambda.zip
rm *Stack.zip