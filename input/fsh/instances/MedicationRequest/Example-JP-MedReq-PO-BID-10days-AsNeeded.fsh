Instance: Example-JP-MedReq-PO-BID-10days-AsNeeded
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "入院処方　内服処方1日1回１回2錠（投与指示あり） 2日分処方例"
* note.text = "入院処方　内服処方1日1回１回2錠（投与指示あり） 2日分処方例"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>入院処方　内服処方1日1回１回2錠（投与指示あり） 2日分処方例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-PO-BID-10days-AsNeeded"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-D001

* meta.lastUpdated = "2021-07-13T14:24:21.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // 
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // 
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A17296D729AE72021071219211801-2"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A17296D729AE72021071219211801-2"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#DCG "退院処方"
* category.coding[+] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "退院時処方"
* medicationCodeableConcept.coding[0] = $JP_eCS_MedicationCodeNocoded_CS#NOCODED "標準コードなし"
* medicationCodeableConcept.coding[+] = $Icode#I1692880 "炭酸水素ナトリウム水"
* medicationCodeableConcept.text = "炭酸水素ナトリウム水"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-13T14:22:09+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-D001) "医療 太郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-D001)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-0A17296D729AE72021071219211801-2"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-12"
* dosageInstruction.text = "1日2回 朝夕食後 １回 15ｍＬ  (１日  30ｍＬ) 10　日分,指示あればお飲みください"
* dosageInstruction.timing.event = "2021-07-12T00:00:00+09:00"
* dosageInstruction.timing.repeat.boundsDuration = 10 'd' "日"
* dosageInstruction.timing.repeat.count = 20
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "1日2回 朝夕食後"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 15 $JP_MedicationUnitMERIT9_CS#ML "ｍＬ"
* dosageInstruction.doseAndRate.rateRatio.numerator = 30 $JP_MedicationUnitMERIT9_CS#ML "ｍＬ"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 300 $JP_MedicationUnitMERIT9_CS#ML "ｍＬ"
* dispenseRequest.expectedSupplyDuration = 10 'd' "日"