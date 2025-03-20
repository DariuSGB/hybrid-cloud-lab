# Hybrid-Cloud-Lab
The main goal of this repository is to give an easy way to run and stop a hybrid cloud lab through some scripts. Besides the start/stop scripts, there is also some script to check the status and update the IP from where the connection is established.

## Requirements
- Requires to have a client with any kind of linux distribution
- Requires to have JQ installed (sudo apt install jq)
- Requires to have AWS CLI v2 installed (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Requires to have Azure CLI installed (https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux)
- Requires to have AWS access-keys installed
- Requires to make Azure access-keys installed

## Limitations
- Only default (AWS/Azure) security groups will be used to update the current IP address

## How to use
The execution of the scripts is done without arguments.
In the file 'vars.json' is stored the following information:
1. The resources where the instances are located (including the region in the case of AWS)
2. The rule name used to update the current IP address where the scripts are running

```json
{
  "AwsResources": [
    {
      "VpcName": "vpc_DGB",
      "RuleName": "MyLaptop",
      "Region": "eu-central-1"
    }
  ],
  "AzureResources": [
    {
      "ResourceGroupName": "LAB-DGB",
      "RuleName": "MyLaptop"
    },
    {
      "ResourceGroupName": "CLIENT-DGB",
      "RuleName": "MyLaptop"
    },
    {
      "ResourceGroupName": "CLIENT-DE-DGB",
      "RuleName": "MyLaptop"
    },
    {
      "ResourceGroupName": "CLIENT-NL-DGB",
      "RuleName": "MyLaptop"
    }
  ]
}
```
Just after cloning this project, it is necessary to give execution permissions to all the scripts.
```bash
chmod +x scripts/*.sh scripts/libs/*.sh
```
