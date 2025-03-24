#!/bin/bash
## CAPTURE INFO
VPC_NAME=$1
SG_NAME=$2
RULE_TAG=$3
REGION=$4
VPC_ID=$(aws ec2 describe-vpcs --region ${REGION} --filters Name=tag:Name,Values=${VPC_NAME} --query "Vpcs[].VpcId" --output text)
GROUP_ID=$(aws ec2 get-security-groups-for-vpc --region ${REGION} --vpc-id ${VPC_ID} --filters Name="group-name",Values="${SG_NAME}" --query "SecurityGroupForVpcs[].GroupId" --output text)
SECURITY_GROUP_RULE_ID=$(aws ec2 describe-security-group-rules --region ${REGION} --filters Name="group-id",Values="${GROUP_ID}" | jq -r ".SecurityGroupRules[] | select(.Description==\"${RULE_TAG}\") | .SecurityGroupRuleId")
## SHOW IP STATUS
aws ec2 describe-security-group-rules --region ${REGION} --filter Name="security-group-rule-id",Values="${SECURITY_GROUP_RULE_ID}" --output table
