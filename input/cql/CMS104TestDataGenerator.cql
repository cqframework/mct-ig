library CMS104TestDataGenerator version '1.0.0'

using FHIR version '4.0.1'

define Test_CMS104_In_InitialPopulation:
    BuildBundle({
        BuildPatient('test-in-initial-population', 'Jane', 'Doe', 'female', @2000-01-01),
        BuildCondition('test-in-initial-population', 'http://hl7.org/fhir/sid/icd-10-cm', 'I63.011', 'Patient/test-in-initial-population'),
        BuildeEncounter('test-in-initial-population', 'finished', '32485007', 'Patient/test-in-initial-population', Interval[@2022-10-20T12:30, @2022-10-22T09:00], 'Condition/test-in-initial-population', null, null)
    })

define Test_CMS104_Patient_Not_18:
    BuildBundle({
        BuildPatient('test-patient-not-18', 'Jane', 'Doe', 'female', @2006-01-01),
        BuildCondition('test-patient-not-18', 'http://hl7.org/fhir/sid/icd-10-cm', 'I63.011', 'Patient/test-patient-not-18'),
        BuildeEncounter('test-patient-not-18', 'finished', '32485007', 'Patient/test-patient-not-18', Interval[@2022-10-20T12:30, @2022-10-22T09:00], 'Condition/test-patient-not-18', null, null)
    })

define function BuildBundle(resources List<FHIR.Resource>):
    FHIR.Bundle {
        type: FHIR.BundleType { value: 'transaction'},
        entry: BuildBundleEntry(resources)
    }

define function BuildBundleEntry(resources List<FHIR.Resource>):
    resources resource
        let FHIRType: 
            case 
                when resource is FHIR.Patient then 'Patient/'
                when resource is FHIR.Encounter then 'Encounter/'
                when resource is FHIR.Condition then 'Condition/'
                when resource is FHIR.MedicationRequest then 'MedicationRequest/'
                when resource is FHIR.ServiceRequest then 'ServiceRequest/'
                else ''
            end
        return 
            FHIR.Bundle.Entry {
                resource: resource,
                request: FHIR.Bundle.Entry.Request {
                    method: FHIR.HTTPVerb { value: 'PUT' },
                    url: FHIR.url { value: FHIRType + resource.id.value }
                }
            }

define function BuildMeta(profile String):
    FHIR.Meta {
        profile: List<FHIR.canonical> {
            FHIR.canonical { value: profile }
        }
    }

define function BuildCodeableConcept(system String, code String):
    FHIR.CodeableConcept {
        coding: List<FHIR.Coding> {
            BuildCoding(system, code)
        }
    }

define function BuildCoding(system String, code String):
    FHIR.Coding { 
        system: FHIR.uri { value: system }, 
        code: FHIR.code { value: code }
    }

define function BuildPatient(id String, firstName String, lastName String, gender String, birthDate Date):
    FHIR.Patient {
        id: FHIR.id { value: id },
        meta: BuildMeta('http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient'),
        identifier: List<FHIR.Identifier> {
            FHIR.Identifier {
                system: FHIR.uri { value: 'urn:oid:1.2.36.146.595.217.0.1' },
                value: FHIR.string { value: '12345' }
            }
        },
        name: List<FHIR.HumanName> {
            FHIR.HumanName {
                use: FHIR.NameUse { value: 'official' },
                family: FHIR.string { value: lastName },
                given: List<FHIR.string> {
                    FHIR.string { value: firstName }
                }
            }
        },
        gender: FHIR.AdministrativeGender { value: gender },
        birthDate: FHIR.date { value: birthDate }
    }

define function BuildCondition(id String, codeSystem String, codeCode String, subject String):
    FHIR.Condition {
        id: FHIR.id { value: id },
        meta: BuildMeta('http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-condition'),
        verificationStatus: BuildCodeableConcept('http://terminology.hl7.org/CodeSystem/condition-ver-status', 'confirmed') ,
        category: List<FHIR.CodeableConcept> {
            BuildCodeableConcept('http://terminology.hl7.org/CodeSystem/condition-category', 'encounter-diagnosis')
        },
        code: BuildCodeableConcept(codeSystem, codeCode),
        subject: FHIR.Reference { reference: FHIR.string { value: subject } }
    }

define function BuildeEncounter(id String, status String, type String, subject String, period Interval<DateTime>, condition String, dischargeSystem String, dischargeCode String):
    FHIR.Encounter {
        id: FHIR.id { value: id },
        meta: BuildMeta('http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-encounter'),
        status: FHIR.EncounterStatus { value: status },
        class: BuildCoding('http://terminology.hl7.org/CodeSystem/v3-ActCode', 'IMP'),
        type: List<FHIR.CodeableConcept> {
            BuildCodeableConcept('http://snomed.info/sct', type)
        },
        subject: FHIR.Reference { reference: FHIR.string { value: subject } },
        period: FHIR.Period { start: FHIR.dateTime { value: start of period }, end: FHIR.dateTime { value: end of period } },
        diagnosis: List<FHIR.Encounter.Diagnosis> {
            FHIR.Encounter.Diagnosis { 
                condition: FHIR.Reference { reference: FHIR.string { value: condition } }, 
                rank: FHIR.positiveInt { value: 1 } 
            }
        },
        hospitalization: if dischargeSystem is not null 
            then FHIR.Encounter.Hospitalization {
                dischargeDisposition: BuildCodeableConcept(dischargeSystem, dischargeCode)
            }
            else null
    }