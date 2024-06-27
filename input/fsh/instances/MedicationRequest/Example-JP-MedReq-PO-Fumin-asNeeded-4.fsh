Instance: Example-JP-MedReq-PO-Fumin-asNeeded-4
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "入院処方　内服頓用　頓用と1回量をコードで記述する例"
* note.text = "入院処方　内服頓用　頓用と1回量をコードで記述する例"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>入院処方　内服頓用　頓用と1回量をコードで記述する例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-PO-Fumin-AsNeeded-4"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-D001

* meta.lastUpdated = "2021-07-27T01:31:19.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // 
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // 
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A172AE334669A2021070515574101-1"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A172AE334669A2021070515574101-1"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "入院臨時処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeYJ_CS#1190027F1022 "デエビゴ錠２．５ｍｇ"
* medicationCodeableConcept.coding[+] = $Icode#I1379700 "デエビゴ錠２．５ｍｇ"
* medicationCodeableConcept.text = "デエビゴ錠２．５ｍｇ"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-05T16:00:40+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-D001) "医療 太郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-D001)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-0A172AE334669A2021070515574101-1"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-05"
* dosageInstruction.text = "不眠時  4　回分"
* dosageInstruction.timing.event = "2021-07-05T08:00:00+09:00"
* dosageInstruction.timing.code.text = "不眠時"
* dosageInstruction.asNeededBoolean = true
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.quantity = 4 $JP_MedicationUnitMERIT9_CS#TAB "錠"