### Technical Requirements

#### Introduction

This Technical Requirements Document (TRD) documents both the high-level system design and the low-level detailed design specifications. In addition, this TRD describes design goals and considerations, specifications, and an overview of the system architecture. It also describes the information architecture and data structures associated with the system, in addition to human-machine interface and operational scenarios. The high-level system design is further decomposed into low-level detailed design specifications for each system component. Design documents are incrementally and iteratively produced during the system development life cycle, based on the circumstances of the information technology (IT) project and the system development methodology used for developing the system. This document is intended for technical stakeholders involved in the implementation of this system including developers, project managers, users, testers, and documentation writers. Some portions of this document, such as the user interface (UI), may be useful to share with the client/user and other stakeholders whose input/approval into the UI is needed.

#### General Overview and Design Guidelines

##### Background

_Situation_

The Promoting Interoperability Program Eligible incentivizes eligible hospitals and providers to demonstrate meaningful use of certified health information technology (HIT) to improve quality, safety, efficiency, and equity of the American health care system. Hospitals participating in the inpatient hospital quality reporting program (IHQR) are encouraged to voluntarily submit 4, electronic clinical quality measures (eCQM) for 3 of 4 quarters.  

_Problem_

However, the process of electronically sharing population-level data is labor-intensive and cumbersome, hampered by a lack of standardization of data models and fields. In order to calculate eCQMs today, providers must map their EHR propriety data models to the Quality Data Model and upload their results as a Quality Reporting Document Architecture Category I formatted file onto the Hospital Quality Reporting portal, as well as participate in post submission audits. 

In order to reduce the burden of data collection and improve interoperability, CMS aims to transition away from traditional electronic clinical quality measurement (eCQM) to Fast Healthcare Interoperability Resources (FHIR)– specified measures, that leverage certified health information technology or digital quality measurement (dQMs)  

As per the 21st Century Cures Act Final Rule, developers of certified health information technology (HIT) must ensure their technology supports a variety of use cases, including the calculation of quality measure. **Technology certified by the Office of National Coordinator ONC must support “standardized API for patient and population services.”** Certified HIT will  

1. support Fast Healthcare Interoperability Resources (FHIR) Release 4.0.2, 
2. responds to request for data elements mandated in the USCD v1 
3. enables access to patient-level data across a patient population.  

DQMs will allow eligible providers and hospitals to seamlessly exchange patient and population level data for the calculation and reporting of quality measure scores, using a Measure Calculation Tool (MCT). 

An MCT is an open-source, end-to-end software platform, designed to interface with eligible hospital and clinicians FHIR API, gather data requirements for measure calculation from a knowledge repository, request and validate data from a provider API, calculate measure score(s) using Clinical Quality Language, and produce electronic report(s). CMS has contracted Yale-CORE to orchestrate the development of an early MCT prototype and demonstrate its ability to calculate a measure score for single FHIR-specified measure.

_Objective_

To develop a prototype of the MCT engine that will be able to demonstrate key features of the enterprise level MCT platform. These features will be defined and enumerated as user stories, all features not selected for development and testing for prototype will remain in the backlog.  

_Stakeholders_

The following comprises the internal and external stakeholders whose requirements are represented by this document: 

•	Anne Weinstein  
•	Tom Lantz Senior Program Technical Advisor  
•	Bridget Calvert Senior dQM Implementation Lead 
•	Joel Andress Senior dQM Program Lead  
•	Bill Lakenan ADO 
•	Reid Kiser  DQM Division Director R 
•	Mark Canfield Division Deputy Director  
•	Michellene Roberts HQR Program Lead  
•	Mindy Riley  Division Director  


##### General Overivew

##### Assumptions/Constraints/Risks

###### Assumptions

1. Calculate a single hospital-level-process measure 
2. Have a User interface similar to Hospital Quality Reporting webpage 
3. MCT Host is agnostic 
4. It will connect to US Core Compliant FHIR Server for mock reporting system 
5. It will connect to server with DEQM receiver capabilities as a mock receiving system 
6. It will use smart on FHIR or OAuth for authentication and authorization 
7. The prototype will use synthetic data 
8. It will contain internal bundles of  knowledge repository (measure specification support) 
9. It will contain internal bundles terminology service 
10. TBD: Use bulk FHIR
11. Hospitals with multiple locations operating under a single CCN will submit reports for all locations 
12. Hospitals user can select measures for reporting (see 1st assumption) 
13. TBD: connect to Compliant FHIR server that has aggregated patient data 
14. TBD: measure calculation occurs on data in transit 
15. Debatable? MCT does not store data it exchanges data 

###### Constraints

1. The Measure Calculation Tool solution must be open source

###### Risks

##### Alignment with Enterprise Architecture

The Measure Calculation Tool is a standards-based implementation and uses industry standard software technologies and development approaches to ensure it can be used effectively by healthcare IT staff at hospitals and clinics throughout the United States. This includes:

1. The software is developed using industry standard source control, namely Git via Github, following stable trunk methodology. All changes to the source code for all repositories are made through pull requests.
2. The software is developed using industry standard software technologies, namely Java for backend systems and JavaScript for frontend applications.
3. The software makes use of container technology to aid adoption, implementation, and integration.
4. The software repositories are configured with continuous integration build and deployment.

#### Design Considerations

##### Goals and Guidelines

#### 3.1.1 Safety Requirements

The measure calculation tool must conform to the safety and privacy requirements of any site in which it is implemented. The system requires site-based implementation for operation and is designed in such a way that implementation will be executed fully within a site firewall. For any safety or privacy concerns related to clinical quality measure logic, please refer to the details of the specific measures being evaluated.

##### Development Methods and Contingencies

Scrum is an Agile methodology that allows the project team to focus on delivering the highest business value in the shortest time. It allows the project team to rapidly and repeatedly inspect actual working software (every 2 weeks). The business sets the priorities, and teams self-organize to determine the best way to deliver the highest priority features. Every 2 weeks any stakeholder can see real working software and decide to release it as is or continue to enhance it for another sprint. This rapid and iterative approach has been quickly gaining acceptance within the informatics community (Kannan et al., 2019).

This project also used a "Continuous Delivery" pipeline to support project development as has been commonly employed by industry leaders like Amazon, Netflix, eBay, Comcast, and Uber for over 10 years. This approach consistently reduces:

Environment dependency risks through the use of lightweight virtual machines (Containers)
Environment hosting risks by using automated and immutable servers
Testing risks by using automated testing with Continuous Quality Improvement
Deployment risks by using incremental rollout and instantaneous rollback
Versioning risks by using microservices and volatility decomposition
Overall project-related risks by implementing both a high-level overview (e.g., Waterfall) executed in Agile development cycles

##### User Interface Approach

The Reporting Client should provide a simple interface for quality improvement staff at provider organizations to gather the required data for a measure from any or all of the facilities for the organization, display any relevant validation or missing information messages along with the calculated measure score, and submit the data and score to a receiving system.

The User Interface for this prototype will be a minimalist React-JS application that mimics the experience of submitting reporting data in the current hospital reporting system.

TODO: Wireframes

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

The standards involved in the specification, distribution, and implementation of FHIR-based quality measures include:

1. Fast Healthcare Interoperability Resources (FHIR) version 4.0.1 (https://hl7.org/fhir/R4/)
2. Clinical Quality Language (CQL) version 1.5.2 (https://cql.hl7.org/N1/)
3. SMART-on-FHIR Backend Services version 2.0.0 (https://hl7.org/fhir/smart-app-launch/STU2/backend-services.html)
4. US Core version 3.1.1 (https://hl7.org/fhir/us/core/STU3.1.1/)
5. QI Core version 4.1.1 (https://hl7.org/fhir/us/qicore/STU4.1.1/)
6. Quality Measure Implementation Guide version 3.0.0 (https://hl7.org/fhir/us/cqfmeasures/STU3/)
7. Data Exchange for Quality Measures Implementation Guide version 3.1.0 (https://hl7.org/fhir/us/davinci-deqm/STU3.1/)

##### Performance Engineering

Performance requirements, such as the defined scalability or responsiveness expectations for specific workloads, are a contributing factor to system design. Preliminary considerations of system performance include total time to complete data gather for a single patient and for a facility, total time to calculate a measure for a single patient and for a population, and total time to submit data and calculated scores to a receiving system. During the development process, the team will continue to surface specific response time goals.

#### System Architecture and Design

##### Logical View

The following diagram provides the context of the proposed measure calculation tool in the environment in which it is intended to function. The reporting user is shown interacting with the system through the Reporting Client, which interacts with the Measure Calcuation Tool to gather data, perform validation and measure calculation, and submit the resulting data and scores to the receiving system.

![MCT Context Diagram](context.png)]

As shown in the digram, a Reporting User uses the Reporting Client to interface with the Measure Calculation Tool to select reporting facilities, the measure to be calculated, and the measurement period to be reported. The user interface displays the results of the validation step, including whether the data meets the data requirements for the measure to be reported, as well as any validation information returned by the measure calculation tool and the calculated measure score. The user is given the opportunity to review validation results to determine whether additional corrective action needs to be taken by the provider sites, or if the data meet expectations and the measure calculation score is accepted, the user is able to transmit the results to the Receiving System.

To complete the required gather, validation, and calculation, the Measure Calculation Tool interfaces with the Knowledge Repository, Terminology Service, Provider Site(s), and Receiving System.

The Measure Calculation Tool makes use of the Knowledge Repository to retrieve measure specifications as well as data requirements for the specific measure or measures being calculated. This interface is described by the Measure Repository Service defined in the Quality Measure Implementation guide.

The Terminology Service is used to provide appropriate expansions of value sets referenced by the measure specification. This interface is described by the Measure Terminology Service defined in the Quality Measure Implementation guide.

The Measure Calculation Tool accesses the Provider Site (or sites) via the FHIR Server exposed by each provider site. Consistent with current adoption, the provider site FHIR server is expected to conform to at least the 3.1.1 version of the US Core FHIR implementation guide. Ideally, provider sites would also conform to newer versions of US Core, as well as to the QI Core implementation guide.

And finally, the Measure Calculation Tool interfaces with the Receiving System as described by the Receiving System capability statement defined in the Data Exchange for Quality Measures implementation guide.

> Note that for the purposes of this prototype, the capabilities provided by the Knowledge Repository and Terminology Service are modeled and implemented as interfaces within the Measure Calculation Tool, as the ecosystem for publishing quality measures via an API is not yet established and outside the scope of this prototype.

###### MCT Container

The following diagram illustrates the container level of the measure calculation tool, depicting the interactions it has with external systems:

![MCT Container Diagram](container-mct.png)

As shown in the diagram, the Measure Calculation Container provides the implementation of the measure calculation tool, as well as support for configuration information required to support the calculation, including reporting provider information, available measures for calculation, as well as facility and receiving system endpoints.

The Reporting Client makes use of these services to allow users to perform end-to-end measure calculation and reporting, and to facilitate data and calculated score validation.

Externally, the Measure Calculation Tool container must interface with the Knowledge Repository, Terminology Service, Provider Site(s), and Receiving System. Again, for the purposes of this prototype, the functionality provided by the Knowledge Repository and Terminology Service is modeled and implemented as interfaces within the Measure Calculation Tool.

###### MCT Coordinator Component

The following diagram illustrates the coordinator component of the measure calculation tool:

![MCT Coordinator Component Diagram](component-mct-coordinator.png)

As shown in the diagram, the Reporting Client interfaces with the coordinator component to provide measure calculation and reporting services to the end user.

The Coordinator component is responsible for accepting calculation and submission requests, managing the data flow required to support the requested calculation, and returning responses from the calculation process. The coordinator makes use of the Knowledge Repository Interface to request measure specifications and data requirements processing, the Terminology Service Interface to request value set expansion, the Provider Interface to request data from each facility being reported, and the Receiver Interface to submit calculation results on a successful and approved measure calculation result.

The Evaluator component supports evaluation of quality measures using the FHIR Measure resource to describe the measure structure, as well as the FHIR Library resource to contain libraries of Clinical Quality Language definitions used by the measure.

The Translator component supports translator of libraries of Clinical Quality Language definitions into the machine-processable Expression Logical Model (ELM) format used for data requirements analysis as well as actual evaluation of the expressions.

The Engine component supports evaluation of Expression Logical Model (ELM) content to calculate the results of each expression used by the quality measure.

The Knowledge Repository Interface and Terminology Service Interface components provide a level of  indirection between the Coordinator and the external Knowledge Repository and Terminology Service systems to facilitate implementation within the Measure Calculation Tool in the absence of an ecosystem of available Measure Repository and Terminology services. This approach allows the coordinator to be built in a way that supports use of these services once they are available, while also enabling prototype implementation by making use of existing source code components that can perform the required capabilities such as data requirements analysis and value set retrieval.

The Provider Interface component provides a simple adapter for the FHIR server endpoints of the provider site(s) to support any potential additional processing required by the measure calculation tool.

The Receiver Interface component provides an implementation of the capabilities defined by the Recieving System capability statement to support data and calculated score submission to the Recieving System.

###### MCT Configurator Component

The following diagram illustrates the configurator component of the measure calculation tool:

![MCT Configurator Component Diagram](component-mct-configurator.png)

As shown in the diagram, the Configurator component is used by the Reporting Client to support user selection of the measure to be calculated, the organization and facilities to be reported, and required reporting provider information.

In a production implementation, this component would be responsible for persisting and maintaining this configuration information. For the purposes of this prototype, the configurator component simply provides the required information via configuration files, including:

1. Measure specification packages represented as FHIR Bundles
2. Terminology packages represented as FHIR Bundles
3. Provider reporting information represented as a FHIR Organization resource
4. Facility configuration information represented as FHIR Location and Endpoint resources
5. Receiving system configuration information represented as a FHIR Endpoint resource

##### Software Architecture

TODO: Java architecture for the MCT

##### Application Architecture

TODO: ReactJS architecture for the Reporting Client

##### Information Architecture

There are two levels of information specification and exchange at play in the measure calculation tool. First, the measure specification, which represents the measures to be calculated, including metadata, terminology, dependencies, and population criteria in the form of Clinical Quality Language expressions. And second, the information specification, which represents patient-level clinical and administrative information about the patient population.

Information in the first level is represented using resources defined in the FHIR Clinical Reasoning Module, and further specified using profiles and guidance found in the FHIR Quality Measure implementation guide. The Measure Calculation Tool is capable of using any measure specification that conforms to the requirements defined by this implementation guide, allowing a single software tool to be used to calculate any number of quality measures. Published measure specifications are made available through the Knowledge Repository via the Measure Repository Service API specified as part of the Quality Measure implementation guide. Note that for the purposes of this prototype, the functionality of the repository is modeled as a component of the Measure Calculation Tool, since the focus of the prototype is on supporting measure calculation. The intent of this architecture is to demonstrate the capability while illustrating a path forward that can be used once measure repository services are available in the ecosystem.

Information in the second level is represented using resources defined in the FHIR Administrative and Clinical modules, and further specified using profiles and guidance found in the QI Core FHIR implementation guide. Data retrieved from provider sites is expected to conform to the profiles defined in the QICore implementation guide. Note that because QI Core derives from and is a minimal extension to US Core, much of the data retrieved from US Core-compliant FHIR servers should be conformant with the QI Core profiles. For the purposes of this prototype, the validation step will test this conformance, and mark resources that are compliant with QI Core profiles with the appropriate profile markers to ensure correct evaluation in the CQL evaluator.

##### Security Architecture

Because measure calculation is being performed directly on patient-level data retrieved from a FHIR server, security is a primary concern. The Measure Calculation Tool makes use of the OAuth security model described by the SMART Backend Services security implementation guide. For the purposes of this prototype, reference implementations of these services are used to demonstrate capability.

##### Performance

TODO: Document performance requirements and expectations

#### System Design

This section documents the system design from a use case and user story perspective.

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

<img src="MeasureCalculationTool.png" alt="Measure Calculation Tool Use Case Overview"/>

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

This section describes implementation considerations for the Measure Calculation Tool, both for the prototype implementation, as well as enterprise considerations that must be addressed before the MCT could be fully supported for production use cases.

The following sequence diagram implements the reporting submission use case described above:

<img src="sd-reporting-submission-use-case.png" alt="Reorting Submission Use Case"/>

##### Prototype

The prototype implementation of the Measure Calculation Tool focuses on making use of existing open source FHIR and CQL-based measure calculation capabilities to support a streamlined, out-of-the-box experience for provider implementers reporting FHIR and CQL-based quality measures.

###### CQL Components

The measure calculation tool makes use of the following open source FHIR and CQL components:

1. [CQL-to-ELM Translator](https://github.com/cqframework/clinical_quality_language): This component supports validation of CQL libraries as well as translation of CQL libraries to the equivalent Expression Logical Model (ELM) representation focused on machine implementation. The prototype will make use of at least the 2.6.0 release of the translator to ensure support for QICore versions 4.1.1 and above.

2. [CQL Engine](https://github.com/cqframework/clinical_quality_language/tree/master/Src/java/engine): This component supports evaluation of compiled ELM produced by the CQL-to-ELM translator. The prototype will make use of at least the 2.6.0 release of the engine to ensure support for QICore versions 4.1.1 and above.

3. [CQL Evaluator](https://github.com/cqframework/clinical-reasoning): This component brings together the translator and engine to provide complete CQL translation and evaluation support with a FHIR-based data model, either the base FHIR specification directly, or FHIR implementation guides such as USCore and QICore. The prototype will make use of at least the 2.6.0 release of the evaluator to ensure support for QICore versions 4.1.1 and above.

4. [HAPI-FHIR Server](https://hapifhir.io/): This component provides an out-of-the-box reference implementation of a FHIR server. The prototype will use this server to play the role of the provider FHIR servers in the development, sandbox, and integration testing scenarios. The prototype will make use of at least the 6.0.1 release of HAPI FHIR.

###### Measure Calculation Tool

The Measure Calculation Tool prototype is built as a [Spring Boot Application](https://spring.io/) that brings together all the required components and exposes a simple REST-based API to support use of the calculation features from any web client.

###### Reporting Client

The Reporting Client is a simple React-JS application that illustrates a typical expected workflow that a quality improvement manager at a provider organization would use to facilitate quality reporting.

##### Enterprise Considerations

This prototype is focused on establishing core functionality for the Measure Calculation Tool with an architecture that could scale to support enterprise-level loads. For the reporting submission use case, there are two broad approaches to performing the population calculation:

1. Patient-at-a-time calculation
2. Population-level calculation

The per-patient approach has several advantages in terms of scalability. First, it limits the size of data required for any given calculation to the data for a single patient. Although this can still be large for patients with significant histories, it is generally bounded to manageable data sizes. Second, it allows for a natural and easy to implement partition for measure calculation. This partitioning lends itself naturally to data pipelining approaches such as Apache Spark.

The popuation-level approach can potentially support improved calculation performance, especially when making use of warehouse-style implementations that can then be queried at the population level, rather than patient-at-a-time. However, this approach requires that the measure specification (and in particular the population logic) be transformed to population level queries by modifying the expressions to account for patient-level relationships. Although this is possible to do by including these patient-level relationships in the data model, it is an area that has had limited implementation experience to this point.

For these reasons, FHIR-based measure calculation is typically performed patient-at-a-time, even in all known commercial implementations. This approach has extensive testing and implementation experience, both in connectathon and pilot settings, as well as vendor systems. Performance of patient-at-a-time scenarios, even with relatively large single patient data, is manageable and effectively scales linearly, so long as the data is available to the calculation engine.

Given the reporting submission use case, this results in two primary bottlenecks in the process, both related to transferring data between systems:

1. Data transfer from the source system to the Measure Calculation Tool
2. Data transfer from the Measure Calculation Tool to the Receiving System

First, data transfer from the source system to the MCT can be accomplished by directly retrieving data from the provider site's FHIR API. However, typical FHIR RESTful APIs are almost exclusively patient-specific, which then requires that this data gather be performed per patient. In addition, although the FHIR specification allows for batch processing (i.e. batching multiple REST queries into a single request), not all FHIR servers implement this functionality, which further means that each data requirement results in a separate request/response to the FHIR API. Taken together, this means that a complete data gather has a large number of individual requests, making connection latency and response data size significant performance considerations.

Second, data transfer from the MCT to the receiving system can be accomplished using standard capabilities of a FHIR API. However, the patient-specific nature of these APIs again results in a large number of individual request/responses. This could be mitigated by requiring batch-level processing, but even that would potentially be overrun by large populations.

Both these data transfer points within the architecture could benefit from bulk data approaches. For the first case, data transfer from the provider site system, the $export capability provides a natural fit that enables large data transfers at the group level. And for the second case, data transfer to the receiving system, the $import capability provides a solution. The MCT prototype is architected such that these solutions could be plugged in at the appropriate points.

As an aside, the Measure Calculation Tool could be seen as a data gathering tool, rather than a calculation tool per se. In this approach, the MCT would act as an incremental data conduit from the provider site systems to an aggregate receiving system store. Measure calculation could then be performed on the aggregate receiving system store, rather than requiring the single "extract and calculate" approach taken here by the MCT prototype. This approach would require that the receiving system be a persistent store for data from provider sites. End of aside.

#### References
