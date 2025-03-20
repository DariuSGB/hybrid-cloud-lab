#!/bin/bash
## CAPTURE INFO
RESOURCE_GROUP_NAME=$1
## SHOW INSTANCE STATUS
az vm list -g ${RESOURCE_GROUP_NAME} --show-details -o table
