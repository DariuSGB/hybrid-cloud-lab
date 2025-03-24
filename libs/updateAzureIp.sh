#!/bin/bash
## CAPTURE INFO
RESOURCE_GROUP_NAME=$1
NSG_NAME=$2
RULE_TAG=$3
## REFRESH PUBLIC IP
az network nsg rule update -g ${RESOURCE_GROUP_NAME} --nsg-name ${NSG_NAME} -n ${RULE_TAG} --source-address-prefixes $(curl -s https://ipecho.net/plain)
