The Measure Calculation Tool facilitates quality reporting and submission by provider organizations using standards-based open source software. This guide is targeted at Provider Quality Improvement users responsible for reviewing, approving, and submitting quality reporting information.

For an overview of what the Measure Calculation Tool is and how it facilitates quality reporting submission, see the [Use Case Overview](index.html#use-case-overview).

For information on how to use the Reporting Client to submit quality reporting data, refer to the [User Guide](user-guide.html).

This topic describes how to install, configure, and start the Measure Calculation Prototype in a provider implementation environment.

### Starting the Measure Calculation Tool Prototype

#### Prerequisites

- NodeJs version 18 is required
- Docker is required
  
1. git clone the mct repository
2. Run script `./setup_app_files` to prep data files
3. Standup services with `docker-compose up` and wait 1 minute before proceeding to next step
4. Load data with `./load-local-data.sh`
5. go to `frontend` directory and run `yarn install && yarn start`
6. Wait until `http://localhost:8088` loads with `Whitelabel Error` message
7. Navigate to app at `http://localhost:3000`

### Cloud Deployment

The Measure Calculation Tool github repository also contains a kubernetes file that is used to establish a sandbox/demonstration environment, and to help facilitate a kubernetes deployment. **NOTE** These instructions for setup are meant to be run from the perspective of a new AWS region without other pre-exisiting services. 

#### Prerequisities

- Terraform
- Kubernetes
- [Helm 3](https://v3-1-0.helm.sh/docs/intro/install/)
- AWS account with aws-cli setup locally

#### AWS EKS Setup
1. Go to directory `./infrastructure/terraform`
2. Run command `terraform init` to install dependencies
3. After installtion run `terraform plan -out tfplan.out` and inspect new resources that will be created with terraform
4. `terraform apply tfplan.out` will execute the plan and spin up all the necessary infrastructure for AWS Elastic Kuberentes Service
5. After installation add your eks context to your local docker by context with `aws eks update-kubeconfig --region <region-code> --name <my-cluster>`

#### Application Setup on EKS
1. Switch to your kubernetes cluster context
2. Go to directory `./infrastructure/kubernetes`
3. Run command `helm install <give installation name> --namespace=mct --set tag=latest .` **note** tag can be set to whatever you like
4. View applications running in `mct` namespace. e.g. `kube get svc -n mct`

### Tags

The Measure Calculation Tool uses FHIR [Tags](https://hl7.org/fhir/R4/resource-definitions.html#Meta.tag) to support identifying the source location and relevant expression for submitted data.

* Location Tag: System: http://cms.gov/fhir/mct/tags/Location (code is the id of the Location, display is the name of the Location)
* Expression Tag: System: http://cms.gov/fhir/mct/tags/Expression (display is the identifier of the Expression)

The Location Tag is used to identify the source Location for the resource. This tag is applied by the Measure Calculation Tool when gathering data from each facility, and then used subsequently to support display of the source facility for a resource.

The Expression Tag is used to identify the relevant expression during which the resource was referenced as part of measure calculation (i.e. an `evaluatedResource`).

### Organization Configuration

Configuration of the MCT prototype can be performed by posting FHIR Organization, Endpoint, and Location resources to the running MCT prototype as described below:

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

### Configure Receiving System Endpoint

The receiving system endpoint is configured as a reference to en Endpoint resource specified using an extension on the Organization resource:

```json
   "extension": [{
      "url": "http://cms.gov/fhir/mct/StructureDefinition/mct-receivingSystemEndpoint",
      "reference": {
        "reference": "Endpoint/example"
      }
   }]
```

### Measure Specifications

Measure specifications available for calculation in the MCT prototype can be configured by posting a Quality Measure IG compliant Measure Specification as a FHIR Bundle to the running MCT prototype. Note that the bundle must include the Measure, any associated Libraries, and any required terminology as ValueSet resources.

Measure specifications published with this prototype implementation guide:

* [Validation Measure](Measure-QiCoreProfileValidation.html)
* [CMS104 Example](Measure-DischargedonAntithromboticTherapyQICore4.html)

The following list summarizes the required data elements for the CMS104 example measure:

1. [Encounter](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-encounter.html): [Non-Elective Inpatient Encounter](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.424)
2. [Condition](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-condition.html): Diagnosis per Encounter
3. [ServiceRequest](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-servicerequest.html): [Comfort Measures](http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45)
4. [Procedure](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-procedure.html): [Comfort Measures](http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45)
5. [MedicationRequest](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-medicationrequest.html): [Antithrombotic Therapy](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62)
5. [MedicationRequest](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-medicationrequest.html): [Pharmacological Contraindications For Antithrombotic Therapy](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.52)
6. [MedicationNotRequested](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-mednotrequested.html): [Antithrombotic Therapy](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62)

### Test Cases

Test data for the MCT prototype is available as bundles in the github repository. These bundles can be posted to the mock EHR (in this case a HAPI FHIR Server).

In addition, the prototype includes a simple test data generator that can be used to create additional test cases, as described in the following sections.

#### Test Data Generation

The test data generation for CMS104 is achieved by running the _generateTestData script found at the root of this project. 
This script evaluates the CMS104TestDataGenerator CQL library to generate the necessary QiCore profiles, populates those 
resources into a transaction Bundle, and writes the Bundle resource to the input/tests directory.

##### Adding a New Test Case

To add a new test case simply add an expression to the CMS104TestDataGenerator.cql library using the specified builder functions 
to generate the necessary resources. There are two simple examples currently in that library to get you started. Note that the 
name of the expression will be used as the name for the sub-directory and filename for the output.

##### Running the Test Data Generation Script

The _generateTestData script is executed from the command line with the command `sh _generateTestData.sh`. Currently only a 
shell script has been authored. Including a Batch (.bat) script is on the road map to better support Windows users. In order 
to run the shell script, your environment must support `sh` (UNIX command language interpreter), `curl` (command that enables 
data exchange to or from a server), and `jq` (command line JSON processor) commands. These can be easily installed on Mac using 
[Homebrew](https://brew.sh) from the command line (e.g. `brew install curl` or `brew install jq`).

##### Output

After successfully running the _generateTestData script, the test data will be written to the input/tests directory of this 
project. Each named expression in the CMS104TestDataGenerator library will generate a sub-directory within the input/tests 
directory containing a JSON file with a [transaction](http://hl7.org/fhir/http.html#transaction) bundle containing the test 
data. The name of the CQL named expression will be used for both the sub-directory and JSON filename.