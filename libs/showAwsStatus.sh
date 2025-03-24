#!/bin/bash
## CAPTURE INFO
VPC_NAME=$1
REGION=$4
VPC_ID=$(aws ec2 describe-vpcs --region ${REGION} --filters Name=tag:Name,Values=${VPC_NAME} --query "Vpcs[].VpcId" --output text)
## SHOW INSTANCE STATUS
aws ec2 describe-instances --region ${REGION} --filters Name=vpc-id,Values=${VPC_ID} --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[]|[0],InstanceId,Placement.AvailabilityZone,InstanceType,State.Name]' --output table
