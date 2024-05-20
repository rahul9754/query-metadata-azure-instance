#!/bin/bash

# This script retrieves the Azure Instance Metadata of Azure Linux VM
# and formats it using jq for easy reading

# Define the metadata service URL and API version
METADATA_URL="http://169.254.169.254/metadata/instance"
API_VERSION="2021-02-01"

# Send a GET request to the metadata service and process the JSON response with jq
curl -s -H Metadata:true --noproxy "*" "${METADATA_URL}?api-version=${API_VERSION}" | jq

#This cmd prints the compute.location parameter of the instance
curl -s -H Metadata:true --noproxy "*" "${METADATA_URL}?api-version=${API_VERSION}" | jq '.compute.location'