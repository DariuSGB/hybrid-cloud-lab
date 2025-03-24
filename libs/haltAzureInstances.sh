#!/bin/bash
## CAPTURE INFO
RESOURCE_GROUP_NAME=$1
## START VM INSTANCES
az vm deallocate --ids $(az vm list -g ${RESOURCE_GROUP_NAME} --query "[].id" -o tsv) --no-wait
