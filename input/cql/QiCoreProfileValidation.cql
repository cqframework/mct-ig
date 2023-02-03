library QiCoreProfileValidation version '1.0.0'

using QICore version '4.1.1'
include FHIRHelpers version '4.0.1'


include FHIRHelpers version '4.0.1'
include QiCoreProfilePatterns version '1.0.0' called Profiles

context Patient

define "Initial Population": true

define "SDE AdverseEvent":
    Profiles.AdverseEvent

define "SDE AllergyIntolerance":
    Profiles.AllergyIntolerance

define "SDE BodyStructure":
    Profiles.BodyStructure

define "SDE CarePlan":
    Profiles.CarePlan

define "SDE CareTeam":
    Profiles.CareTeam

define "SDE Claim":
    Profiles.Claim

define "SDE Communication":
    Profiles.Communication

define "SDE CommunicationNotDone":
    Profiles.CommunicationNotDone

define "SDE CommunicationRequest":
    Profiles.CommunicationRequest

define "SDE Condition":
    Profiles.Condition

define "SDE Coverage":
    Profiles.Coverage

define "SDE Device":
    Profiles.Device

define "SDE DeviceNotRequested":
    Profiles.DeviceNotRequested

define "SDE DeviceRequest":
    Profiles.DeviceRequest

define "SDE DeviceUseStatement":
    Profiles.DeviceUseStatement

define "SDE DiagnosticReportLab":
    Profiles.DiagnosticReportLab

define "SDE DiagnosticReportNote":
    Profiles.DiagnosticReportNote

define "SDE Encounter":
    Profiles.Encounter

define "SDE EncounterPerformed":
    Profiles.EncounterPerformed

define "SDE FamilyMemberHistory":
    Profiles.FamilyMemberHistory

define "SDE Flag":
    Profiles.Flag

define "SDE Goal":
    Profiles.Goal

define "SDE ImagingStudy":
    Profiles.ImagingStudy

define "SDE Immunization":
    Profiles.Immunization

define "SDE ImmunizationEvaluation":
    Profiles.ImmunizationEvaluation

define "SDE ImmunizationNotDone":
    Profiles.ImmunizationNotDone

define "SDE ImmunizationRecommendation":
    Profiles.ImmunizationRecommendation

define "SDE ImplantableDevice":
    Profiles.ImplantableDevice

define "SDE Location":
    Profiles.Location

define "SDE Medication":
    Profiles.Medication

define "SDE MedicationAdministration":
    Profiles.MedicationAdministration

define "SDE MedicationAdministrationNotDone":
    Profiles.MedicationAdministrationNotDone

define "SDE MedicationDispense":
    Profiles.MedicationDispense

define "SDE MedicationDispenseDeclined":
    Profiles.MedicationDispenseDeclined

define "SDE MedicationNotRequested":
    Profiles.MedicationNotRequested

define "SDE MedicationRequest":
    Profiles.MedicationRequest

define "SDE MedicationStatement":
    Profiles.MedicationStatement

define "SDE NutritionOrder":
    Profiles.NutritionOrder

define "SDE Observation":
    Profiles.Observation

define "SDE ObservationCancelled":
    Profiles.ObservationCancelled

define "SDE Organization":
    Profiles.Organization

define "SDE Patient":
    Profiles.Patient

define "SDE Practitioner":
    Profiles.Practitioner

define "SDE PractitionerRole":
    Profiles.PractitionerRole

define "SDE Procedure":
    Profiles.Procedure

define "SDE ProcedurePerformed":
    Profiles.ProcedurePerformed

define "SDE ProcedureNotDone":
    Profiles.ProcedureNotDone

define "SDE RelatedPerson":
    Profiles.RelatedPerson

define "SDE ServiceNotRequested":
    Profiles.ServiceNotRequested

define "SDE ServiceRequest":
    Profiles.ServiceRequest

define "SDE Specimen":
    Profiles.Specimen

define "SDE Substance":
    Profiles.Substance

define "SDE Task":
    Profiles.Task

define "SDE TaskRejected":
    Profiles.TaskRejected