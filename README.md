
# Retrieving Azure Instance Metadata Using curl/jq and PowerShell

This guide explains how to use curl and jq on Linux and PowerShell on Windows to retrieve specific data keys from the Azure Instance Metadata Service. Azure provides instance metadata through a RESTful API, which can be accessed from within the instance.

## Prerequisites

### For Linux:
- `curl` installed on your system. (Most Linux distributions come with curl pre-installed.)

- `jq` installed on your system. (jq is a lightweight and flexible command-line JSON processor. You can install it using your package manager or download it from jq's official website.)

### For Windows:
PowerShell (Windows 10 and Windows Server 2016+ come with PowerShell pre-installed).

## Usage

### On Linux 

To retrieve specific data keys from the Azure Instance Metadata Service on Linux, follow these steps:

#### 1. Retrieve Metadata
Use `curl` to fetch metadata from the Azure Instance Metadata Service:

```bash
curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01"
```
#### 2. Parse Metadata with jq

Pipe the output of `curl` to `jq` to parse and retrieve specific data keys. For example, to get the `location` value under `compute`:

```bash
curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq '.compute.location'
```

This command retrieves the location where the Azure instance is deployed.

#### 3. Replace `.compute.location` with Other Keys

You can modify .compute.location to access other keys and values based on your requirements. For instance:

```bash
# Retrieve the subscription ID
curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq '.compute.subscriptionId'

# Retrieve the ID of the managed disk
curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq -r '.compute.storageProfile.osDisk.managedDisk.id'
```
### On Windows

To retrieve specific data keys from the Azure Instance Metadata Service on Windows, follow these steps:

#### 1. Retrieve Metadata

Use PowerShell to fetch metadata from the Azure Instance Metadata Service:

```bash
$response = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01"
```

#### 2. Extract Specific Data Keys

You can extract specific data keys from the response. For example, to get the location value under `compute` :

```bash
$location = $response.compute.location

# Print the location
$location
```
Similarly, to retrieve other values, you can adjust the paths:

```bash
# Retrieve the subscription ID
$subscriptionId = $response.compute.subscriptionId
$subscriptionId

# Retrieve the ID of the managed disk
$managedDiskId = $response.compute.storageProfile.osDisk.managedDisk.id
$managedDiskId
```

### Notes

- Ensure Metadata:true header is included to access the Azure Instance Metadata Service.
- Adjust the URL (http://169.254.169.254/metadata/instance?api-version=2021-02-01) to match the API version you are targeting, if necessary.
- `-NoProxy` requires PowerShell V6 or greater.


