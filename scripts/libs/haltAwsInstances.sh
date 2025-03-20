#!/bin/bash
## CAPTURE INFO
VPC_NAME=$1
REGION=$3
VPC_ID=$(aws ec2 describe-vpcs --region ${REGION} --filters Name=tag:Name,Values=${VPC_NAME} --query "Vpcs[].VpcId" --output text)
INSTANCES_IDS=$(aws ec2 describe-instances --region ${REGION} --filters Name=vpc-id,Values=${VPC_ID} --query 'Reservations[].Instances[].InstanceId' --output text)
## START VM INSTANCES
aws ec2 stop-instances --region ${REGION} --instance-ids ${INSTANCES_IDS} --no-cli-pager
