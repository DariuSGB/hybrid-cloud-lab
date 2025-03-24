# Hybrid-Cloud-Lab
The main goal of this repository is some external scripts to interact with our hybrid cloud lab

## Requirements
- Requires to have a client with any kind of linux distribution
- Requires to have JQ installed (sudo apt install jq)
- Requires to hava AWS CLI v2 installed (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Requires to have Azure CLI installed (https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux)
- Requires to have an AWS access-keys installed
- Requires to make an Azure access-keys installed

## How to use
The execution of the scripts is done without arguments.
In the file 'vars.json' is stored the following information:
1. The resources where the instances are located (including the region in the case of AWS)
2. The rule name used to update with the current IP address where the scripts were running

```json
{
  "AwsResources": [
    {
      "VpcName": "vpc_DGB",
      "SgName": "default",
      "RuleName": "MyLaptop",
      "Region": "eu-central-1"
    }
  ],
  "AzureResources": [
    {
      "ResourceGroupName": "LAB-DGB",
      "NsgName": "nsg-DGB",
      "RuleName": "MyLaptop"
    },
    {
      "ResourceGroupName": "CLIENT-DGB",
      "NsgName": "nsg-client-DGB",
      "RuleName": "MyLaptop"
    },
    {
      "ResourceGroupName": "CLIENT-DE-DGB",
      "NsgName": "nsg-client-de-DGB",
      "RuleName": "MyLaptop"
    },
    {
      "ResourceGroupName": "CLIENT-NL-DGB",
      "NsgName": "nsg-client-nl-DGB",
      "RuleName": "MyLaptop"
    }
  ]
}
```
