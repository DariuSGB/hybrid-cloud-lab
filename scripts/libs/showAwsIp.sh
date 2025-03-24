#!/bin/bash
## CAPTURE INFO
VPC_NAME=$1
RULE_TAG=$2
REGION=$3
VPC_ID=$(aws ec2 describe-vpcs --region ${REGION} --filters Name=tag:Name,Values=${VPC_NAME} --query "Vpcs[].VpcId" --output text)
GROUP_ID=$(aws ec2 get-security-groups-for-vpc --region ${REGION} --vpc-id ${VPC_ID} --filter Name="group-name",Values="default" --query "SecurityGroupForVpcs[].GroupId" --output text)
SECURITY_GROUP_RULE_ID=$(aws ec2 describe-security-group-rules --region ${REGION} --filters Name="group-id",Values="${GROUP_ID}" | jq -r ".SecurityGroupRules[] | select(.Description==\"${RULE_TAG}\") | .SecurityGroupRuleId")
## SHOW IP STATUS
aws ec2 describe-security-group-rules --region ${REGION} --filter Name="security-group-rule-id",Values="${SECURITY_GROUP_RULE_ID}" --output table
