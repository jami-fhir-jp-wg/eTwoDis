Instance: Example-JP-MedReq-PO-4timez-7days
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "入院処方　内服処方1日4回7日分　例"
* note.text = "入院処方　内服処方1日4回7日分　例"
// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>入院処方　内服処方1日4回7日分　例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-PO-4timez-7days"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-D003

* meta.lastUpdated = "2021-07-13T19:21:18.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // 
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // 
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A172BC10398DD2021071314262201-1"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A172BC10398DD2021071314262201-1"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "入院臨時処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeHOT9_CS#123812902 "カロナール錠５００"
* medicationCodeableConcept.coding[+] = $JP_MedicationCodeYJ_CS#1141007F3023 "カロナール錠５００"
* medicationCodeableConcept.coding[+] = $Icode#I1187300 "カロナール錠５００"
* medicationCodeableConcept.text = "カロナール錠５００mg"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-13T15:01:29+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-D003) "診療 和子"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-D003)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-0A172BC10398DD2021071314262201-1"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-13"
* dosageInstruction.text = "1日4回 毎食後と就寝前 １回 1錠  (１日  4錠) 7　日分"
* dosageInstruction.timing.event = "2021-07-13T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsDuration = 8 'd' "日"
* dosageInstruction.timing.repeat.count = 28
* dosageInstruction.timing.repeat.frequency = 4
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "1日4回 毎食後と就寝前"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 4 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 28 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 7 'd' "日"