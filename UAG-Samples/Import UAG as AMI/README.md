# Import VMware Unified Access Gateway into Amazon Web Service and register as AMI (Amazon Image Machines)

## Overview
- **Author**: Andreano Lanusse
- **Email**: alanusse@vmware.com
- **Date Created**: 11/04/2018
- **Supported Platforms**: Unified Access Gateway 3.5 and above 

## Purpose
<!-- Summary Start -->
This script automated the process of making available the Unified Access Gateway vmdk image into Amazon Web Services as registered AMI in preparation for the EC2 instance creation.
<!-- Summary End -->
The following operations will be performed by the script:
- Validated if the S3 bucket informed exist, otherwise create
- Validated if the vmimport Role exist, otherwise create the role and assigned the required policy
- Upload the vmdk image file into the S3 bucket
- Import the vmdk image into Amazon EBS Snapshot
- Register the Unified Access Gateway vmdk as Amazon Image Machine (AMI)

After successfully execute the script, Unified Access Gateway will be available as private AMI on your Amazon Web Services console.

## Requirements
 
In order to execute this script successfully you need to:
1. Download the ImportUAGasAMI script files into a local folder
2. Download the Unified Access Gateway 3.5+ OVA file from [my.vmware.com](https://my.vmware.com) 
3. Extract the .vmdk file from the OVA file in a local folder  (** You can rename the file extension from .ova file to .zip to easily unzip the file)

## How to execute the script

Execute ImportUAGasAMI.ps1 using the following parameters:

- **–accessKey** – User Access Key that has the permissions to execute the script
- **-secretKey** – User Security Key that has the permissions to execute the script
- **-vmdkImage** – Location path and name of Unified Access Gateway vmdk file name that you just unzip
- **-bucketName** – Name of the S3 bucket where the VMDK will be uploaded - if the bucket doesn't exist they script will create it for you
- **-region** – AWS region where the operation will be performed (ie: us-east-1)

Example:

.\ImportUAGasAMI.ps1 -accessKey mna9ansis94n39 -secretKey da0ajdns9s9snmd -vmdkImage C:\uag\euc-unified-access-gateway-3.9.1.0-11012815-system.vmdk -bucketName uag-images -region us-east-1

## Change Log
- 2020.04.21 - display AMI ID generated by the import process

## Additional Resources
* [Unified Access Gateway Documentation](https://docs.vmware.com/en/Unified-Access-Gateway/)
* [Tech Zone Unified Access Gateway Learning Path](https://techzone.vmware.com/mastering-unified-access-gateway/)
