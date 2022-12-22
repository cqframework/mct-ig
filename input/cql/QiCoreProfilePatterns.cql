library QiCoreProfilePatterns version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include QICoreCommon version '1.0.0'

context Patient

// Profiles

// QICoreAdverseEvent
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-adverseevent
define AdverseEvent:
  [AdverseEvent]

// QICoreAllergyIntolerance
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-allergyintolerance
define AllergyIntolerance:
  [AllergyIntolerance]

// QICoreBodyStructure
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-bodystructure
define BodyStructure:
  [BodyStructure]

// QICoreCarePlan
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-careplan
define CarePlan:
  [CarePlan]

// QICoreCareTeam
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-careteam
define CareTeam:
  [CareTeam]

// QICoreClaim
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-claim
define Claim:
  [Claim]

// QICoreCommunication
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-communication
define Communication:
  [Communication] C
    where C.status in { 'preparation', 'in-progress', 'on-hold', 'completed' }

// QICoreCommunicationNotDone
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-communicationnotdone
define CommunicationNotDone:
  [Communication] C
    where C.status = 'not-done'

// QICoreCommunicationRequest
// @profile: 	http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-communicationrequest
define CommunicationRequest:
  [CommunicationRequest]

// QICoreCondition
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-condition
define Condition:
  [Condition]

// QICoreCoverage
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-coverage
define Coverage:
  [Coverage]

// QICoreDevice
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-device
define Device:
  [Device]

// QICoreDeviceNotRequested
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-devicenotrequested
define DeviceNotRequested:
  [DeviceRequest] D
    where D.status = 'completed'
      and D.doNotPerform() is true

// QICoreDeviceRequest
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-devicerequest
define DeviceRequest:
  [DeviceRequest] D
    where D.status in { 'draft', 'active', 'on-hold', 'revoked', 'completed' }
      and D.doNotPerform() is not true

// QICoreDeviceUseStatement
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-deviceusestatement
define DeviceUseStatement:
  [DeviceUseStatement]

// QICoreDiagnosticReportLab
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport-lab
define DiagnosticReportLab:
  [DiagnosticReport] D
    //where D.category ~ "http://terminology.hl7.org/CodeSystem/v2-0074#LAB"

// QICoreDiagnosticReportNote
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport-note
define DiagnosticReportNote:
  [DiagnosticReport] D

// QICoreEncounter
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter
define Encounter:
  [Encounter]

define EncounterPerformed:
  Encounter E
    where E.status = 'finished'

// QICoreFamilyMemberHistory
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-familymemberhistory
define FamilyMemberHistory:
  [FamilyMemberHistory]

// QICoreFlag
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-flag
define Flag:
  [Flag]

// QICoreGoal
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-goal
define Goal:
  [Goal]

// QICoreImagingStudy
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-imagingstudy
define ImagingStudy:
  [ImagingStudy]

// QICoreImmunization
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-immunization
define Immunization:
  [Immunization] I
    where I.status = 'completed'

// QICoreImmunizationEvaluation
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-immunizationevaluation
define ImmunizationEvaluation:
  [ImmunizationEvaluation]

// QICoreImmunizationNotDone
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-immunizationnotdone
define ImmunizationNotDone:
  [Immunization] I
    where I.status = 'not-done'

// QICoreImmunizationRecommendation
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-immunizationrec
define ImmunizationRecommendation:
  [ImmunizationRecommendation]

// USCoreImplantableDevice
// @profile: http://hl7.org/fhir/us/core/StructureDefinition/us-core-implantable-device
define ImplantableDevice:
  [Device]

// QICoreLocation
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location
define Location:
  [Location]

// QICoreMedication
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medication
define Medication:
  [Medication]

// QICoreMedicationAdministration
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationadministration
define MedicationAdministration:
  [MedicationAdministration] M
    where M.status in { 'in-progress', 'on-hold', 'completed' }

// QICoreMedicationAdministrationNotDone
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-mednotadministered
define MedicationAdministrationNotDone:
  [MedicationAdministration] M
    where M.status = 'not-done'

// QICoreMedicationDispense
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationdispense
define MedicationDispense:
  [MedicationDispense] D
    where D.status in { 'preparation', 'in-progress', 'on-hold', 'completed' }

// QICoreMedicationDispenseDeclined
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationdispensedeclined
define MedicationDispenseDeclined:
  [MedicationDispense] D
    where D.status in { 'cancelled', 'declined' }

// QICoreMedicationNotRequested
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-mednotrequested
define MedicationNotRequested:
  [MedicationRequest] R
    where R.status = 'completed'
      and R.doNotPerform is true

// QICoreMedicationRequest
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationrequest
define MedicationRequest:
  [MedicationRequest] R
    where R.status in { 'active', 'on-hold', 'completed', 'draft' }
      and R.doNotPerform is not true

// QICoreMedicationStatement
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationstatement
define MedicationStatement:
  [MedicationStatement]

// QICoreNutritionOrder
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-nutritionorder
define NutritionOrder:
  [NutritionOrder]

// QICoreObservation
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-observation
define Observation:
  [Observation] O
    where O.status in { 'registered', 'preliminary', 'final', 'amended', 'corrected' }

// QICoreObservationCancelled
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-observationcancelled
define ObservationCancelled:
  [Observation] O
    where O.status = 'cancelled'

// FHIR Vital Signs

// Respiratory rate - 9279-1
// @profile: http://hl7.org/fhir/StructureDefinition/resprate
define RespiratoryRate:
  [Observation: QICoreCommon."Respiratory rate"] O

// Heart rate - 8867-4
// @profile: http://hl7.org/fhir/StructureDefinition/heartrate
define HeartRate:
  [Observation: QICoreCommon."Heart rate"] O

// Oxygen saturation - 2708-6
// @profile: http://hl7.org/fhir/StructureDefinition/oxygensat
define OxygenSaturation:
  [Observation: QICoreCommon."Oxygen saturation"] O

// Body temperature - 8310-5
// @profile: http://hl7.org/fhir/StructureDefinition/bodytemp
define BodyTemperature:
  [Observation: QICoreCommon."Body temperature"] O

// Body height - 8302-2
// @profile: http://hl7.org/fhir/StructureDefinition/bodyheight
define BodyHeight:
  [Observation: QICoreCommon."Body height"] O

// Head circumference - 9843-4
// @profile: http://hl7.org/fhir/StructureDefinition/headcircum
define HeadCircumference:
  [Observation: QICoreCommon."Head circumference"] O

// Body weight - 29463-7
// @profile: http://hl7.org/fhir/StructureDefinition/bodyweight
define BodyWeight:
  [Observation: QICoreCommon."Body weight"] O

// Body mass index - 39156-5
// @profile: http://hl7.org/fhir/StructureDefinition/bmi
define BodyMassIndex:
  [Observation: QICoreCommon."Body mass index"] O

// Blood pressure systolic and diastolic - 85354-9
// Systolic blood pressure - 8480-6
// Diastolic blood pressure - 8462-4
// @profile: http://hl7.org/fhir/StructureDefinition/bp
define BloodPressure:
  [Observation: QICoreCommon."Blood pressure"] O

// USCore Smoking Status
// @profile: http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus
define SmokingStatus:
  [Observation: QICoreCommon."Smoking status"] O

// USCore Laboratory Result
// @profile: http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
define LaboratoryResult:
  [Observation: category ~ QICoreCommon."Laboratory"] O

// USCore Pediatric BMI for Age - 59576-9
// @profile: http://hl7.org/fhir/us/core/StructureDefinition/pediatric-bmi-for-age
define PediatricBMIForAge:
  [Observation: QICoreCommon."Pediatric BMI for age"]

// USCore Pediatric Weight for Height - 77606-2
// @profile: http://hl7.org/fhir/us/core/StructureDefinition/pediatric-weight-for-height
define PediatricWeightForHeight:
  [Observation: QICoreCommon."Pediatric weight for height"]

// USCore Pulse Oximetry - 59408-5
// @profile: http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry
define PulseOximetry:
  [Observation: QICoreCommon."Pulse oximetry"]

// QICoreOrganization
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-organization
define Organization:
  [Organization]

// QICorePatient
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient
define Patient:
  [Patient]

// QICorePractitioner
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-practitioner
define Practitioner:
  [Practitioner]

// QICorePractitionerRole
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-practitionerrole
define PractitionerRole:
  [PractitionerRole]

// QICoreProcedure
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-procedure
define Procedure:
  [Procedure] P
    where P.status in { 'preparation', 'in-progress', 'on-hold', 'completed' }

define ProcedurePerformed:
  Procedure P
    where P.status = 'completed'

// QICoreProcedureNotDone
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-procedurenotdone
define ProcedureNotDone:
  [Procedure] P
    where P.status = 'not-done'

// QICoreRelatedPerson
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-relatedperson
define RelatedPerson:
  [RelatedPerson]

// QICoreServiceNotRequested
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-servicenotrequested
define ServiceNotRequested:
  [ServiceRequest] SR
    where SR.status = 'completed'
      and SR.doNotPerform is true

// QICoreServiceRequest
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-servicerequest
define ServiceRequest:
  [ServiceRequest] SR
    where SR.status in { 'draft', 'active', 'on-hold', 'completed' }
      and SR.doNotPerform is not true

// QICoreSpecimen
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-specimen
define Specimen:
  [Specimen]

// QICoreSubstance
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-substance
define Substance:
  [Substance]

// QICoreTask
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-task
define Task:
  [Task] T
    where T.status in { 'draft', 'requested', 'received', 'accepted', 'ready', 'in-progress', 'on-hold', 'completed' }

// QICoreTaskRejected
// @profile: http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-taskrejected
// TODO: What about cancelled and failed?
define TaskRejected:
  [Task] T
    where T.status = 'rejected'