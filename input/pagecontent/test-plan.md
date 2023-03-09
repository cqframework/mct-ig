## Test Plan

This page documents the test plan for the Measure Calculation Tool (MCT) prototype. The test plan is intended to demonstrate:

1. Functionality of the Measure Calculation Tool and validation, certification, and testing content
2. Correctness of a provider implementation of the Measure Calculation Tool

### Content Tests

These tests are performed as part of prototype development and testing to ensure that the measure content for the Validation Measure and for CMS104 is correctly evaluating given known input data.

> NOTE: These tests cover proportion measure calculation only. Other calculation features would need to be tested specifically, including: ratio, continuous-variable, and composite calculation and stratifiers.

1. Test Validation Measure
    1. Test data is present for each data element
        1. Ineligible - data is missing and the validation result indicates it is
        2. Invalid - data is present but invalid for each data element and the validation result provides validation messages
        3. Valid - data is present for each data element
    2. Test measure score is successful for 
        1. Ineligible
        2. Initial population
        3. Denominator
        4. Denominator Exception
        5. Denominator Exclusion
        6. Numerator
2. Test CMS104
    1. Test data is present for each data element
        1. Ineligible - data is missing and the validation result indicates it is
        2. Invalid - data is present but invalid for each data element and the validation result provides validation messages
        3. Valid - data is present for each data element
    2. Test measure score is successful for
        1. Ineligible
        2. Initial population
        3. Denominator
        4. Denominator Exception
        5. Denominator Exclusion
        6. Numerator

> NOTE: The content unit tests are all patient-specific, rather than population level. Population level testing is performed as part of integration tests.

#### Content Data Elements

The Validation/Certification measure contains expressions to support validation of all QICore profiles. However, this prototype is focusing on the data elements involved in the CMS104 Measure:

1. [Encounter](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-encounter.html): [Non-Elective Inpatient Encounter](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.424)
2. [Condition](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-condition.html): Diagnosis per Encounter
3. [ServiceRequest](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-servicerequest.html): [Comfort Measures](http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45)
4. [Procedure](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-procedure.html): [Comfort Measures](http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45)
5. [MedicationRequest](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-medicationrequest.html): [Antithrombotic Therapy](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62)
5. [MedicationRequest](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-medicationrequest.html): [Pharmacological Contraindications For Antithrombotic Therapy](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.52)
6. [MedicationNotRequested](https://hl7.org/fhir/us/qicore/STU4.1.1/StructureDefinition-qicore-mednotrequested.html): [Antithrombotic Therapy](http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62)


### Integration Tests

These tests are performed as part of prototype development and testing to ensure that the Measure Calculation Tool is performing as expected in the prototype environment with known configuration and input data served through expected server behavior.

1. Test CCN Configuration
    1. Validate the MeasureReport is produced with the configured CCN identifier
2. Test Organization/Facility Configuration
    1. Validate the MeasureReport is produced with the configured reporter Organization, and location extensions for each configured facility
3. Test Validation Measure
    1. Test data is present for each data element
    2. Test missing data produces expected validation messages
    3. Test invalid data produces expected validation messages
    4. Test measure score is successful for each test case (1..7)
4. Test CMS104
    1. Test data is present for each data element
    2. Test missing data produces expected validation messages
    3. Test invalid data produces expected validation messages
    4. Test measure score is successful for each test case (1..7)

### Validation Tests

These tests are performed at an implementing site to ensure that the prototype is installed and configured correctly and that it performs as expected within the site environment.

1. Test Validation Measure Data
    1. MeasureReport has the correct CCN
    2. MeasureReport has the correct reporter Organization
    3. MeasureReport has the correct reported Location(s)
    4. MeasureReport has data for each element
    5. MeasureReport has expected validation messages for missing data
    6. MeasureReport has expected validation messages for invalid data
2. Test Validation Measure Calculation
    1. MeasureReport has expected population count and score for each population test (1..7)
    2. MeasureReport has expected supplemental data
3. Test Validation Measure Submission
    1. Validate submitted MeasureReport has correct:
        1. CCN
        2. Organization
        3. Reported location(s)
    2. Validate submitted MeasureReport has expected population count and score for each population (1..7)
    2. Validate submitted MeasureReport has expected data references
    3. Validate all expected data is submitted
    4. Validate no unexpected data is submitted

### Submission Tests

These tests are performed at an implementing site to demonstrate calculation and submission of the CMS104 measure.

1. Test CMS104 Measure Data
    1. MeasureReport has data for each element
    2. MeasureReport has expected validation messages for missing data
    3. MeasureReport has expected validation messages for invalid data
2. Test CMS104 Measure Calculation
    1. MeasureReport has expected population count and score for each population (1..7)
    2. MeasureReport has expected supplemental data
3. Test CMS104 Measure Submission
    1. Validate submitted MeasureReport has expected population count and score for each population (1..7)
    2. Validate submitted MeasureReport has expected data references
    3. Validate all expected data is submitted
    4. Validate no unexpected data is submitted

### Performance Tests

These tests are performed as part of prototype development and testing and provide baseline performance characteristics in a known solution environment.

1. Test Validation Measure Evaluation Performance
    1. Unit Test - 1, 10, 50, 100, and 200 Patients
    2. Integration Test - 1, 10, 50, 100, and 200 Patients
2. Test CMS104 Measure Evaluation Performance
    1. Unit Test - 1, 10, 50, 100, and 200 Patients
    2. Integration Test - 1, 10, 50, 100, and 200 Patients

#### CMS104 Measure Evaluation Performance

The following is an analysis of the measure evaluation performance of the prototype using the CMS104 measure as the subject. For this analysis, the following three processes will be profiled: 

 1. Gathering the patient data
 2. Validating the patient data gathered in step 1
 3. Evaluating the measure referencing the data gathered in step 1

##### Gathering Patient Data

The first step of gathering the patient data includes an analysis of the data requirements for the measure. The data requirements identify the resources and data elements used to evaluate the measure logic. The prototype uses the data requirements to generate FHIR REST queries, which are then executed across the specified facilities registered with an organization.

##### Validating Patient Data

The data validation step operates on the gathered patient data to ensure that the data adheres to a specified set of profiles (in this case [QiCore version 4.1.1](https://hl7.org/fhir/us/qicore/index.html)). Inconsistencies with the gathered patient data and the specified profiles are documented within the patient data as [contained resources](http://hl7.org/fhir/references.html#contained). Any missing data requirements will also be documented within the returned patient data bundle (see the [$gather operation specification](http://cms.gov/fhir/mct/OperationDefinition/gather) for more information). 

##### Evaluating the Measure

The measure evaluation occurs on both a patient-level and population-level. The prototype is testing a [proportion measure](http://hl7.org/fhir/clinicalreasoning-quality-reporting.html#specifying-population-criteria). The result of the evaluation returns individual and population reports detailing population group membership, a measure score, and the resources that were used during evaluation.

##### Methodology

The prototype operates on a linear scale. Meaning each of the processes outlined above are evaluated sequentially for each patient. Therefore, as the population or resources within that population (i.e. patients and/or patient resources) increase, the time to evaluate will also increase. 

The prototype was profiled using populations sizes of 1, 10, 50, 100, and 200 patients (test cases) in order to provide a reasonable representation of the linear scaling and represent several measure population groupings (i.e. simulate a real-world population). The patient data is randomly generated with adherence to certain requirements. The requirements include:
 
 - Each measure population group (Ineligible, Initial population, Denominator, Denominator Exception, Denominator Exclusion, and Numerator) must be represented whenever possible.
    - For the single patient population, a Numerator population group was profiled.
 - The population should have ~60% success rate for the Numerator measure population group.
 - The population should have ~80% success rate for the Initial population measure group.
 - The population must use valid patient data for the measure.
    - Some profile validation errors should appear for full coverage profiling, but those errors must not coincide with the data elements required to evaluate the measure.

##### Metrics

Each population set was randomly generated 100 times and profiled recording the average runtime for each process in the following table. 

| Number of Test Cases | Combined | Measure Evaluation | Patient Data Queries | Validation |
| -------------------- | -------- | ------------------ | -------------------- | ---------- |
|1                     |01.113    |00.657              |00.401                |00.056      |
|10                    |08.623    |05.088              |03.104                |00.431      |
|50                    |43.477    |25.651              |15.652                |02.174      |
|100                   |01:24.834 |50.052              |30.540                |04.242      |
|200                   |02:44.587 |01:37.106           |59.251                |08.229      |
{:.grid}

![CMS104 Performance Graph](CMS104_Performance_Metrics.png)

The following chart displays the runtime distribution for each of the profiled processes:

<div>
    <img src="Prototype_Process_Distribution.png"> 
</div>

##### Performance Enhancements

Although the prototype could be implemented as-is and perform reasonably well for smaller populations, it is not currently recommended as an enterprise-level solution. In order to scale the prototype for enterprise use, there are several enhancements that could be implemented to improve the overall performance and user experience including, but not limited to:

- Using parallel programming to carry out various processes simultaneously.
    - Could vastly improve performance when gathering patient data across multiple facilities.
    - Could enable evaluating multiple measures across multiple populations.
- Using asynchronous programming to reduce/eliminate the limitations of sequential processing.
    - Asynchronous programming is non-blocking, meaning the program does not have to wait for the process to finish before performing other tasks.
    - Would be very impactful when processing large populations.
    - Would allow the user to perform other tasks while the measure is being evaluated.
- Using the [FHIR Bulk Data API](https://build.fhir.org/ig/HL7/bulk-data/index.html) to gather the patient data.
    - Patient data retrieval would be vastly improved, especially for facilities with large datasets.
