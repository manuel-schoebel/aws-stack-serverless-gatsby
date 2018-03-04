#!/bin/bash

aws cloudformation update-stack \
  --stack-name=$STACK_NAME \
  --template-body=file://cloudformation.yaml \
  --capabilities CAPABILITY_IAM \
  --parameters \
    ParameterKey=DomainName,ParameterValue=$DOMAIN_NAME \
    ParameterKey=CertificateArn,ParameterValue=$CERTIFICATE_ARN

echo "Updating the $STACK_NAME stack..."

aws cloudformation wait stack-update-complete --stack-name $STACK_NAME