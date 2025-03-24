#!/bin/bash
## CAPTURE INFO
RESOURCE_GROUP_NAME=$1
NSG_NAME=$2
RULE_TAG=$3
## SHOW IP STATUS
az network nsg rule show -g ${RESOURCE_GROUP_NAME} --nsg-name ${NSG_NAME} -n ${RULE_TAG} --output table
