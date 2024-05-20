# This script retrieves the Azure Instance Metadata of Azure Windows VM
# and extracts specific values from the JSON response

# Send a GET request to the metadata service and store the response
$response = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01"

# Extract the desired value (location) from the response
$reqValue = $response.compute.location

# Print the extracted value
$reqValue
