#!/bin/bash

# This script retrieves the Azure Instance Metadata of Azure Linux VM
# and formats it using jq for easy reading

# Send a GET request to the metadata service and process the JSON response with jq
curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq

#This cmd prints the compute.location parameter of the instance
curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq '.compute.location'