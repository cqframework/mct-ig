#!/bin/bash

# Check cURL command if available (required), abort if does not exists
type curl >/dev/null 2>&1 || { echo >&2 "Required curl but it's not installed. Aborting."; exit 1; }
echo
# Check jq command if available (required), abort if does not exists
type jq >/dev/null 2>&1 || { echo >&2 "Required jq but it's not installed. Aborting."; exit 1; }
echo

fhirServer=https://cloud.alphora.com/sandbox/r4/cqm/fhir/\$cql
content=$(jq -R -s '.' < input/cql/CMS104TestDataGenerator.cql)
PAYLOAD='{ "resourceType": "Parameters", "parameter": [ { "name": "content", "valueString": '$content' } ] }'
RESPONSE=`curl -s --request POST -H "Content-Type:application/json" $fhirServer --data "${PAYLOAD}"`
BUNDLES=$(jq -r '.parameter' <<< $RESPONSE)

for row in $(echo "${BUNDLES}" | jq -r '.[] | @base64'); do
    _jq() {
        echo "${row}" | base64 --decode | jq -r "${1}"
    }
    name=$(_jq '.name')
    resource=$(_jq '.resource')
    path="input/tests/"$name
    filepath=$path"/"$name".json"
    
    mkdir -p $path
    touch $filepath
    echo "$resource" > "$filepath"
done