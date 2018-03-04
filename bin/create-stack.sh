#!/bin/bash

aws cloudformation create-stack \
  --stack-name=$STACK_NAME \
  --template-body=file://cloudformation.yaml \
  --capabilities CAPABILITY_IAM \
  --parameters \
    ParameterKey=DomainName,ParameterValue=$DOMAIN_NAME \
    ParameterKey=CertificateArn,ParameterValue=$CERTIFICATE_ARN

echo "Creating the $STACK_NAME stack..."

aws cloudformation wait stack-create-complete --stack-name $STACK_NAME