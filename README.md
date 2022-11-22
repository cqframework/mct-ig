# Measure Calculation Tool Prototype
This implementation guide documents and supports the use of a prototype Measure Calculation Tool for reporting and calculating FHIR-based digital quality measures (dQMs).

## Outline

1. Home/Index page
    1. Introduction
    2. Contents
    3. Glossary
    4. Acknowledgements
    5. References
2. Background
    1. Platform Environment
    2. Platform Functionality
    3. Assumptions and Considerations
    4. Prototype Capabilities
4. Technical Requirements
    1. Introduction
    2. General Overview and Design Guidelines
        1. Background
        1. General Overview
        2. Assumptions/Constraints/Risks
            1. Assumptions
            2. Constraints
            3. Dependencies
            4. Risks
        3. Alignment with Enterprise Architecture
    3. Design Considerations
        1. Goals and Guidelines
        2. Development Methods and Contingencies
        3. User Interface Approach
        3. Architectural Strategies
            1. Standards Compliancee
        4. Performance Engineering
    4. System Architecture and Architecture Design
        1. Logical View
        2. Software Architecture
        3. Application Architecture
        3. Information Architecture
        4. Security Architecture
        5. Performance
    5. System Design
        1. Use Cases
            1. System Administration
            2. Site Registration/Maintenance
            3. Validation/Certification
            4. Data Submission
            5. Reporting Submission
        2. Actors
        3. User Interfaces/Wireframes
        3. Components
        4. Technical Requirements
            1. User Stories...
    6. Implementation
        1. Prototype
            1. CQL Components
            2. Measure Calculation Tool
            3. Reporting Client
        2. Enterprise Considerations
    7. References
5. User Guide?
5. Specification
    1. Use Case
    2. Prototype Sequence Diagram
    3. Prototype Interaction Specifications
    4. Validation Sequence Diagram
    5. Validation Interaction Specifications
    6. Measure Content
    7. Terminology Content
    8. Unit Tests
    9. Test Data Generation
4. Downloads
5. License
6. Changes

## Building the IG
In addition to the [FHIR Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation), this
IG makes use of the Refresh IG command of [CQF Tooling](https://github.com/cqframework/cqf-tooling). This
command performs several functions related to knowledge artifact content processing:

1. Validates CQL
2. Includes CQL and ELM content in the appropriate Library resource
3. Infers data requirements and dependencies and updates this information in each knowledge artifact
4. Stamps each artifact with a software device that provides tooling information for the CQF Tooling
5. Packages test data associated with each knowledge artifact
6. Packages each artifact with its associated components, dependencies and test data

This refresh process must be performed prior to running the publisher. Just like the publisher, there are two steps:

1. Ensure the CQFTooling is available in the local input-cache by running the _updateCQFTooling script
2. Run the refresh using the _refresh script

The refresh process will update resources in place, as well as place bundled content in the bundles directory.

## Directory Structure
Content IGs follow the same general structure as any FHIR Implementation Guide, but add a few specific directories to support knowledge artifacts:

```
bundles/<artifact-resource-type-name>
input/cql
input/resources/<artifact-resource-type-name>
input/tests/<artifact-resource-type-name>/<artifact-resource-name>
input/tests/<artifact-resource-type-name>/<artifact-resource-name>/<patient-id>
input/tests/<artifact-resource-type-name>/<artifact-resource-name>/<patient-id>/<resource-type-name>/<resource files> // flexible structure
input/vocabulary/codesystem
input/vocabulary/codesystem/external
input/vocabulary/valueset
input/vocabulary/valueset/external
```

This is also the same structure as the [VSCode CQL Plugin](https://github.com/cqframework/vscode-cql) uses to support CQL authoring and evaluation as part of the VSCode plugin.

The `bundles/<artifact-resource-type-name>` folder is where artifact bundles are placed.

The `input/cql` folder contains all the source CQL files as well as the `cql-options.json` file.

The `input/resources/<artifact-resource-type-name>` folders (e.g. `input/resources/library`) contain all the source content for the various artifacts. For CQL Libraries in particular, ensure that a corresponding FHIR Library resource shell exists for each CQL source file. For example

```json
{
  "resourceType": "Library",
  "id": "FirstExample",
  "name": "FirstExample",
  "title": "First Example",
  "status": "active",
  "experimental": false,
  "type": {
    "coding": [ {
      "system": "http://terminology.hl7.org/CodeSystem/library-type",
      "code": "logic-library"
    } ]
  },
  "description": "This resource provides a simple example of a CQL library"
}
```

Note that the `name` element of the FHIR Library resource is required to match exactly the `name` of the CQL Library. The refresh tooling will automatically set the `url` element as follows:

`<ig-base-canonical>/Library/<library-name>`

This is important because this is how FHIR-based environments will resolve library name references in CQL.

In addition, because the Library is being published as a conformance resource in a FHIR IG, the `id` of the resource must match the tail (i.e. final path segment) of the `url`, so in this context, the `id` must also match the name of the library. Because the [id](https://hl7.org/fhir/datatypes.html#id) in FHIR cannot include underscores, this effectively means that CQL library names must not include underscores either.

The `input/tests/<artifact-resource-type-name>/<artifact-resource-name>` folders contain test cases for each artifact.

The `input/tests/<artifact-resource-type-name>/<artifact-resource-name>/<patient-id>` folders contain each individual test case, per patient, and the resource files are expected to contain a Patient with the given id.

The `input/vocabulary/codesystem` folder contains code systems defined in this IG.

The `input/vocabulary/codesystem/external` folder contains code systems required by the content but defined in other sources.

The `input/vocabulary/valueset` folder contains value sets defined in this IG.

The `input/vocabulary/valueset/external` folder contains value sets required by the content but defined in other sources.

NOTE: The `external` vocabulary directories here are intended to support evaluation of artifacts that reference external terminology (i.e. terminology defined in other sources such as the HL7 Terminology Authority, the FHIR Specification, the Value Set Authority Center, or other FHIR Implementation Guides). This is a stop-gap measure until the authoring environment and refresh tooling have the ability to resolve external terminologies.

## Artifact Narratives
This ig uses [FHIR Liquid](https://confluence.hl7.org/display/FHIR/FHIR+Liquid+Profile) templates for knowledge artifacts. Ultimately, these templates should be part of the CQF Content IG Template, but until then, they are typically copied in to this IG from the [Sample Content IG](https://github.com/cqframework/sample-content-ig).
