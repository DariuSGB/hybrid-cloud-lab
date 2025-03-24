#!/bin/bash
## CHECK AWS ACCESS IP
jq -c '.AwsResources[]' vars.json | while read i; do
  VPC_NAME=$(echo $i | jq -r .VpcName)
  SG_NAME=$(echo $i | jq -r .SgName)
  RULE_TAG=$(echo $i | jq -r .RuleName)
  REGION=$(echo $i | jq -r .Region)
  libs/showAwsIp.sh ${VPC_NAME} ${SG_NAME} ${RULE_TAG} ${REGION}
done
## CHECK AZURE ACCESS IP
jq -c '.AzureResources[]' vars.json | while read i; do
  RESOURCE_GROUP_NAME=$(echo $i | jq -r .ResourceGroupName)
  NSG_NAME=$(echo $i | jq -r .NsgName)
  RULE_TAG=$(echo $i | jq -r .RuleName)
  libs/showAzureIp.sh ${RESOURCE_GROUP_NAME} ${NSG_NAME} ${RULE_TAG}
done
