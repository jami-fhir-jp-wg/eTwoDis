Instance: Example-JP-MedReq-PO-SID-28days
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "退院時処方　内服1日1回１回1錠 標準用法フルコード化28日分処方例"
* note.text = "退院時処方　内服1日1回１回1錠 標準用法フルコード化28日分処方例"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>退院時処方　内服1日1回１回1錠 標準用法フルコード化28日分処方例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-PO-SID-28days"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-R001

* meta.lastUpdated = "2021-07-13T02:41:19.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // 
* identifier[rpNumber].value = "2"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // 
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-AC1282108E9DAA2021071215222803-2"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-AC1282108E9DAA2021071215222803-2"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#DCG "退院処方"
* category.coding[+] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "退院時処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeCommon_CS#1124030F2ZZZ "【般】クアゼパム錠２０ｍｇ"
* medicationCodeableConcept.coding[+] = $Icode#I1379700 "クアゼパム錠２０ｍｇ"
* medicationCodeableConcept.text = "クアゼパム錠２０ｍｇ"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-12T16:19:06+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-R001) "医学 一郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-R001)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-AC1282108E9DAA2021071215222803-2"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-12"
* dosageInstruction.text = "1日1回 就寝前 １回 1錠  (１日  1錠) 28　日分,自己調節可"
* dosageInstruction.timing.event = "2021-07-12T00:00:00+09:00"
* dosageInstruction.timing.repeat.boundsDuration = 28 'd' "日"
* dosageInstruction.timing.repeat.count = 28
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.coding =  urn:oid:1.2.392.200250.2.2.20#1011100000000000 "内服 １日１回 就寝前"
* dosageInstruction.timing.code.text = "1日1回 就寝前"
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#PO "口"
* dosageInstruction.route.text = "経口"
* dosageInstruction.method = $JP_MedicationMethodJAMIBasicUsage_CS#1 "内服"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 28 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 28 'd' "日"