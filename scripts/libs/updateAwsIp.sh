#!/bin/bash
## CAPTURE INFO
VPC_NAME=$1
RULE_TAG=$2
REGION=$3
VPC_ID=$(aws ec2 describe-vpcs --region ${REGION} --filters Name=tag:Name,Values=${VPC_NAME} --query "Vpcs[].VpcId" --output text)
GROUP_ID=$(aws ec2 get-security-groups-for-vpc --region ${REGION} --vpc-id ${VPC_ID} --filter Name="group-name",Values="default" --query "SecurityGroupForVpcs[].GroupId" --output text)
SECURITY_GROUP_RULE_ID=$(aws ec2 describe-security-group-rules --region ${REGION} --filters Name="group-id",Values="${GROUP_ID}" | jq -r ".SecurityGroupRules[] | select(.Description==\"${RULE_TAG}\") | .SecurityGroupRuleId")
## REFRESH PUBLIC IP
aws ec2 modify-security-group-rules --region ${REGION} --group-id ${GROUP_ID} --security-group-rules SecurityGroupRuleId="${SECURITY_GROUP_RULE_ID}",SecurityGroupRule="{CidrIpv4=$(curl -s https://ipecho.net/plain)/32,IpProtocol=-1,ToPort=-1,FromPort=-1,Description=${RULE_TAG}}"
