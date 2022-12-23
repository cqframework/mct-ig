### Technical Requirements

#### Introduction

This Technical Requirements Document (TRD) documents both the high-level system design and the low-level detailed design specifications. In addition, this TRD describes design goals and considerations, specifications, and an overview of the system architecture. It also describes the information architecture and data structures associated with the system, in addition to human-machine interface and operational scenarios. The high-level system design is further decomposed into low-level detailed design specifications for each system component. Design documents are incrementally and iteratively produced during the system development life cycle, based on the circumstances of the information technology (IT) project and the system development methodology used for developing the system. This document is intended for technical stakeholders involved in the implementation of this system including developers, project managers, users, testers, and documentation writers. Some portions of this document, such as the user interface (UI), may be useful to share with the client/user and other stakeholders whose input/approval into the UI is needed.

#### General Overview and Design Guidelines

##### Background

##### General Overivew

##### Assumptions/Constraints/Risks

###### Assumptions

###### Constraints

###### Risks

##### Alignment with Enterprise Architecture

#### Design Considerations

##### Goals and Guidelines

##### Development Methods and Contingencies

Scrum is an Agile methodology that allows the project team to focus on delivering the highest business value in the shortest time. It allows the project team to rapidly and repeatedly inspect actual working software (every 2 weeks). The business sets the priorities, and teams self-organize to determine the best way to deliver the highest priority features. Every 2 weeks any stakeholder can see real working software and decide to release it as is or continue to enhance it for another sprint. This rapid and iterative approach has been quickly gaining acceptance within the informatics community (Kannan et al., 2019).

This project also used a “Continuous Delivery” pipeline to support project development as has been commonly employed by industry leaders like Amazon, Netflix, eBay, Comcast, and Uber for over 10 years. This approach consistently reduces:

Environment dependency risks through the use of lightweight virtual machines (Containers)
Environment hosting risks by using automated and immutable servers
Testing risks by using automated testing with Continuous Quality Improvement
Deployment risks by using incremental rollout and instantaneous rollback
Versioning risks by using microservices and volatility decomposition
Overall project-related risks by implementing both a high-level overview (e.g., Waterfall) executed in Agile development cycles

##### User Interface Approach

##### Architectural Strategies

This project uses the C4 modeling (Brown, n.d.) as an approach to define and document the system architecture: Context, Container, Component, Code (C4). More information on C4 modeling and its use is publicly available (https://c4model.com/)

This project will also use industry standard, open source, and widely available development tools and technologies, including:

* [JavaScript](https://en.wikipedia.org/wiki/ECMAScript)
* [React](https://reactjs.org/)
* [Java 11 (Adopt Open JDK and OpenJ9)](https://adoptopenjdk.net/?variant=openjdk11&jvmVariant=openj9)
* [Github](http://github.com)

###### Standards Compliance

As described in the design Constraints section (above), this project’s approach is to choose standards-based approaches, whenever possible, between the Measure Calculation Tool and the clinical systems with which it interacts. However, when building functionality for the project, there are two considerations that the project must address:

1. **Standards Gaps** - When an existing specification does not support the functionality required
2. **Adoption Gaps** - When a standard specification exists, but is not widely implemented

##### Performance Engineering

#### System Architecture and Architecture Design

##### Logical View

The following diagram provides the context of the proposed measure calculation tool in the environment in which it is intended to function. The reporting user is shown interacting with the system through the Reporting Client, which interacts with the Measure Calcuation Tool to gather data, perform validation and measure calculation, and submit the resulting data and scores to the receiving system.

![MCT Context Diagram](images/context.png)]

##### Software Architecture

##### Application Architecture

##### Information Architecture

##### Security Architecture

##### Performance

#### System Design

##### Use Cases

Template:

| | |
|---|---|
|Use Case ID:|UC-00X|
|Use Case Name:| |
|Created By:| |
|Date Created:| |
|Last Updated By:| |
|Date Last Updated:| |

| | |
|---|---|
|Actors:| |
|Description:| |
|Preconditions:| |
|Postconditions:| |
|Normal Course:| |
|Alternative Courses:| |
|Exceptions:| |
|Includes:| |
|Priority:| |
|Frequency of Use:| |
|Business Rules:| |
|Special Requirements:| |
|Assumptions:| |
|Notes and Issues:| |

###### System Administration

###### Site Registration/Maintenance

###### Validation/Certification

| | |
|---|---|
|Use Case ID:|UC-001|
|Use Case Name:|Validation/Certification|
|Created By:|Bryn Rhodes|
|Date Created:|2022-11-22|
|Last Updated By:|Bryn Rhodes|
|Date Last Updated:|2022-11-22|

| | |
|---|---|
|Actors:|Quality Manager<br/>Hospital (EHR FHIR Endpoint)<br/>Measure Calculation Tool<br/>Knowlege Repository<br/>Terminiology Service<br/>Reporting Client|
|Description:|This use case describes the way a hospital will validate and certify that it can submit a FHIR specified hospital level quality measure for voluntary reporting periods for CY 2023. The user accesses the portal with their HARP account, selects a facility affiliate to be validated, and selects the Validate/Certify action|
|Preconditions:|The EHR FHIR Endpoint has been populated with the Validation Data Bundle<br/>All facility information is registered and available via Organization/Location resources (TBD: need to identify where this will come from)<br/>The measure content to be used for Valiation is available via the KR interface (can be mocked as a pre-packaged bundle)<br/>The terminology content is available via the TS interface (can be mocked as a pre-packaged bundle)|
|Postconditions:|The MeasureReport calculation produces the expected results from the validation data<br/>A Validation MeasureReport is calculated submitted to the Receiving System|
|Normal Course:|A user initiates the validation process via the Reporting Client, selecting the facility to be validated.<br/>For the Validation measure, the measure calculation tool gathers data requirements and terminology to determine FHIR queries to be executed<br/>For the validation facility, the measure calculation tool uses the facilities FHIR endpoint to evaluate the FHIR queries and gather all relevant data<br/>For the validation data, the measure calculation tool validates the data conforms to expected profiles<br/>For the validation data, the measure calculation tool evaluates the measure using the validated data as the data source<br/>The Reporting Client displays the result of the Measure Calculation to the user<br/>The user confirms the results and agrees to submit the Validation<br/>The Measure Calculation Tool posts the resulting MeasureReport to the Receiving System|
|Alternative Courses:|N/A|
|Exceptions:|If the data doesn't meet reporting requirements, the facility cannot be validated<br/>If the data doesn't conform to appropriate profiles, steps need to be taken to address, report violations as part of the reponse and require a resubmit|
|Includes:|N/A|
|Priority:|High|
|Frequency of Use:|Facility reporting capability will be validated yearly???|
|Business Rules:| |
|Special Requirements:| |
|Assumptions:| |
|Notes and Issues:| |

###### Reporting Submission

| | |
|---|---|
|Use Case ID:|UC-002|
|Use Case Name:|Reporting Submission|
|Created By:|Bryn Rhodes|
|Date Created:|2022-11-21|
|Last Updated By:|Bryn Rhodes|
|Date Last Updated:|2022-11-21|

| | |
|---|---|
|Actors:|Quality Manager<br/>Hospital (EHR FHIR Endpoint)<br/>Measure Calculation Tool<br/>Knowledge Repository<br/>Terminology Service<br/>Receiving System<br/>Reporting Client|
|Description:|This use case describes the way a hospital will submit a FHIR specified hospital level quality measure for all 3 out of the four voluntary reporting periods for CY 2023. The user accesses the portal with their HARP account, selects all facility affiliates, selects the program (IQR) and the measure (TBD) and checks the measure requirements, and agrees to begin (**PUSH**) the data|
|Preconditions:|The EHR FHIR Endpoint has been validated (with the Validation Use Case)<br/>All relevant patient data is available via the EHR FHIR Endpoint<br/>All facility information is registered and available via Organization/Location resources (TBD: need to identfy where this will come from)<br/>All attributed patient ids are available via a Group resource (TBD: need to identify the source for this as well)<br/>The measure content is available via the KR interface (can be mocked as a pre-packaged bundle)<br/>The terminology content is available via the TS interface (can be mocked as a pre-packaged bundle)|
|Postconditions:|The relevant patient data from all sites is stored in the Reciving System<br/>The MeasureReport calculation procduces the expected results from the input data<br/>The MeasureReport is submitted to the Receiving System|
|Normal Course:|A user initiates the process via the Reporting Client, selecting the facilities, measure, and reporting period.<br/>For each measure, the measure calculation tool gathers data requirements and terminology to determine FHIR queries to be executed<br/>For each facility, the measure calculation tool uses the facilities FHIR endpoint to evaluate the FHIR queries and gather all relevant data<br/>For all relevant data, the measure calculation tool validates the data conforms to expected profiles<br/>For all relevant data, the measure calculation tool submits that data to the Receving System<br/>The Measure Calculation Tool evaluates the measure using the Receiving System as the data source<br/>The Reporting Client displays the result of the Measure Calculation to the user<br/>The user confirms the results and agrees to submit<br/>The Measure Calculation Tool posts the resulting MeasureReport to the Receving System|
|Alternative Courses:|N\A|
|Exceptions:|If the data doesn't meet reporting requirements, the measure cannot be submitted<br/>If the data doesn't conform to apprepriate profiles, steps need to be taken to address, report violations as part of the reponse and require a resubmit|
|Includes:|N/A|
|Priority:|High|
|Frequency of Use:|Measure will be calculated quarterly|
|Business Rules:| |
|Special Requirements:| |
|Assumptions:| |
|Notes and Issues:| |

<img src="MeasureCalculationTool.png" alt="Measure Calculation Tool Sequence Diagram"/>

##### Actors

1. Provider implementer
2. Provider quality improvement administrator
3. Provider quality improvement user

##### User Interfaces/Wireframes

1. System Configuration
2. Site Management
3. Validation
4. Reporting Submission

##### Components

##### Technical Requirements

###### User Stories

1. System Administration
    1. Provider implementer
        1. As a Provider implementer, I need to be able to understand the measure calculation tool and how I can use it in my environment to support provider reporting
2. Site/Facility Registration/Maintenance
    1. Provider quality improvement administrator
        1. As a provider quality improvement administrator, I need to be able to configure the CCN for the reporting provider organization
        1. As a provider quality improvement administrator, I need to be able to configure the receiving system endpoint where I will submit reporting data.
        1. As a provider quality improvement administrator, I need to be able to register a facility for the reporting provider organization, including the base URL for the FHIR server providing data.
        1. As a provider quality improvement administrator, I need to be able to update the registration for a facility for the reporting provider organization, including the base URL for the FHIR server providing data.
        1. As a provider quality improvement administrator, I need to be able to remove the registration for a facility for the reporting provider organization.
3. Validation/Certification
    1. Provider implementer
        1. As a Provider implementer, I need to be able to validate that the data needed for provider reporting is available and conformant from my sites
        2. As a Provider implementer, I need to certify that the measure calculation tool can correctly produce expected results when running provider reporting for the test/certification data set.
4. Reporting Submission
    1. Provider quality improvement user
        1. As a provider quality improvement user, I need to be able to initiate the process of submitting reporting data.
        2. As a provider quality improvement user, when initiating the process of submitting reporting data, I need to be able to select the facilities that will be reported.
        3. As a provider quality improvement user, when initiating the process of submitting reporting data, I need to be able to select the measures that will be reported.
        4. As a provider quality improvement user, when initiating the process of submitting reporting data, I need to be able to select the period for data that will be reported.
        5. As a provider quality improvement user, I need to review the list of errors/issues with the results of the reporting submission so that I can troubleshoot and resubmit the measure report.
        6. As a provider quality improvement user, I need to view the results of the reporting submission so that I can confirm the data and score prior to submission.
        7. As a provider quality improvement user, I need to be able to submit completed reporting data and scores to the receiving system.

#### Implementation

##### Prototype

###### CQL Components

###### Measure Calculation Tool

###### Reporting Client

##### Enterprise Considerations

#### References