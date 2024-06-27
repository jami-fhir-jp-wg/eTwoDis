Instance: Example-JP-MedReq-PO-AsNeeded-LimitMax
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "入院処方　内服処方頓用発熱時　1回量記述なし、4回分処方例"
* note.text =  "入院処方　内服処方頓用発熱時　1回量記述なし、4回分処方例"
// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>入院処方　内服処方頓用発熱時　1回量記述なし、4回分処方例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-PO-AsNeeded-LimitMax"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-D001

* meta.lastUpdated = "2021-07-07T21:34:05.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // 
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // 
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A1721342FB30D2021070718303401-1"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A1721342FB30D2021070718303401-1"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#ORD "定期処方"
* category.coding[+] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "入院定期処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeYJ_CS#1141007F1063 "カロナール錠３００"
* medicationCodeableConcept.coding[+] = $Icode#I1187710 "カロナール錠３００"
* medicationCodeableConcept.text = "カロナール錠３００"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-07T18:31:43+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-D001) "医療 太郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-D001)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-0A1721342FB30D2021070718303401-1"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-07"
* dosageInstruction.text = "発熱時  4　回分,37.5度以上で本人希望時　4時間あけて1日3回まで"
* dosageInstruction.timing.event = "2021-07-07T08:00:00+09:00"
* dosageInstruction.timing.code.text = "発熱時"
* dosageInstruction.asNeededBoolean = true
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dispenseRequest.quantity = 4 $JP_MedicationUnitMERIT9_CS#TAB "錠"