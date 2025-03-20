#!/bin/bash
## CHECK AWS INSTANCES STATUS
jq -c '.AwsResources[]' vars.json | while read i; do
	VPC_NAME=$(echo $i | jq -r .VpcName)
	RULE_TAG=$(echo $i | jq -r .RuleName)
	REGION=$(echo $i | jq -r .Region)
	libs/showAwsStatus.sh ${VPC_NAME} ${RULE_TAG} ${REGION}
done
## CHECK AZURE INSTANCES STATUS
jq -c '.AzureResources[]' vars.json | while read i; do
	RESOURCE_GROUP_NAME=$(echo $i | jq -r .ResourceGroupName)
	RULE_TAG=$(echo $i | jq -r .RuleName)
	libs/showAzureStatus.sh ${RESOURCE_GROUP_NAME} ${RULE_TAG}
done
