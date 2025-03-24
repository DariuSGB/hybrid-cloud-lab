# Hybrid-Cloud-Lab
This is a suite of scripts to interact with our Hybrid-Cloud lab.
Next are some of the actions available:
- Start instances on AWS/Azure
- Stop instances on AWS/Azure
- Check the status of the instances
- Update our local public IP in the security groups
- Check the public IP configured in the security groups

## Requirements
- Requires to have a client with any kind of Linux distribution
- Requires to have JQ installed (sudo apt install jq)
- Requires to have AWS CLI v2 installed (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Requires to have Azure CLI installed (https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux)
- Requires to have an AWS access-keys installed
- Requires to make an Azure access-keys installed

## How to use
The first time you download this repo, you must give execution permissions to all the scripts.
```bash
cd hybrid-cloud-lab
chmod +x *.sh libs/*.sh
```
The execution of the scripts is done without arguments.
```bash
./checkLabIP.sh
```
In the file 'vars.json' are stored the variables required to run the scripts.
1. The resources where the instances are located (including the region in the case of AWS)
2. The security group name where the specific rule is localed
3. The rule name used to update with the current IP address where the scripts are running

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
