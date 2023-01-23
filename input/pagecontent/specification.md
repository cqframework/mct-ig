## Introduction

This document provides detailed specifications for the Measure Calculation Tool.

### Use Case

### Prototype Sequence Diagram

Reporting steps:
1. Configure organization
2. Configure facilities
3. Configure measure(s)
4. Configure terminology
5. Run gather/evaluate
6. Submit report

#### Configure Organization

Configuring the Organization involves providing a FHIR Organization resource that conforms to the [QICore Organization](https://hl7.org/fhir/us/qicore/StructureDefinition-qicore-organization.html) profile. For the purposes of the Measure Calculation Tool, the key information provided by the Organization resource is the CCN identifier for the provider organization.

```json
    "identifier": [{
        "system": "urn:oid:2.16.840.1.113883.4.336",
        "use": "secondary",
        "value": "ACME-CCN"
    }]
```

See the [ACME Organization Example](Organization-acme.html) for a complete example Organization resource.

#### Configure Location

Configuring the Location(s) involves providing a FHIR Location resource that conforms to the [QICore Location](https://hl7.org/fhir/us/qicore/StructureDefinition-qicore-location.html) profile. For the purposes of the Measure Calculation Tool, the key information provided by the Location resource is the FHIR endpoint for the provider location (facility). This information is provided using a contained Endpoint resource in the Location:

```json
    "contained": [{
        "id": "acme-north-endpoint",
        "resourceType": "Endpoint",
        "status": "active",
        "connectionType": {
            "system": "http://terminology.hl7.org/CodeSystem/endpoint-connection-type",
            "code": "hl7-fhir-rest"
        },
        "payloadType": [{
            "coding": [{
                "system": "http://terminology.hl7.org/CodeSystem/endpoint-payload-type",
                "code": "any"
            }] 
        }],
        "payloadMimeType": [ "application/fhir+json" ],
        "address": "http://acme.org/north/fhir"
    }]
```

See the [ACME North Location Example](Location-acme-north.html) for a complete example Location resource including the contained Endpoint resource.

### Prototype Interaction Specifications

### Validation Sequence Diagram

Validation steps:
1. Configure organization
2. Configure facilities
3. Configure validation measure
4. Configure validation terminology
5. Load test data
6. Run test calculation
7. Validate test results

### Validation Interaction Specifications

### Measure Content

### Terminology Content

### Unit Tests

### Test Data Generation

The test data generation for CMS104 is achieved by running the _generateTestData script found at the root of this project. 
This script evaluates the CMS104TestDataGenerator CQL library to generate the necessary QiCore profiles, populates those 
resources into a transaction Bundle, and writes the Bundle resource to the input/tests directory.

#### Adding a New Test Case

To add a new test case simply add an expression to the CMS104TestDataGenerator.cql library using the specified builder functions 
to generate the necessary resources. There are two simple examples currently in that library to get you started. Note that the 
name of the expression will be used as the name for the sub-directory and filename for the output.

#### Running the Test Data Generation Script

The _generateTestData script is executed from the command line with the command `sh _generateTestData.sh`. Currently only a 
shell script has been authored. Including a Batch (.bat) script is on the road map to better support Windows users. In order 
to run the shell script, your environment must support `sh` (UNIX command language interpreter), `curl` (command that enables 
data exchange to or from a server), and `jq` (command line JSON processor) commands. These can be easily installed on Mac using 
[Homebrew](https://brew.sh) from the command line (e.g. `brew install curl` or `brew install jq`).

#### Output

After successfully running the _generateTestData script, the test data will be written to the input/tests directory of this 
project. Each named expression in the CMS104TestDataGenerator library will generate a sub-directory within the input/tests 
directory containing a JSON file with a [transaction](http://hl7.org/fhir/http.html#transaction) bundle containing the test 
data. The name of the CQL named expression will be used for both the sub-directory and JSON filename.