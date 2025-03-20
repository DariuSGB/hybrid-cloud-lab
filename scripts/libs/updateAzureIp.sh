#!/bin/bash
## CAPTURE INFO
RESOURCE_GROUP_NAME=$1
RULE_TAG=$2
NETWORK_SECURITY_GROUP=$(az network nsg list --resource-group ${RESOURCE_GROUP_NAME} --query [].name -o tsv)
## REFRESH PUBLIC IP
az network nsg rule update -g ${RESOURCE_GROUP_NAME} --nsg-name ${NETWORK_SECURITY_GROUP} -n ${RULE_TAG} --source-address-prefixes $(curl -s https://ipecho.net/plain)
