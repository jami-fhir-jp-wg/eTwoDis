Instance: Example-JP-MedReq-PO-SID-90-AMB
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "外来院外処方　内服1日1回１回1錠 標準用法フルコード化90日分処方例"
* note.text = "外来院外処方　内服1日1回１回1錠 標準用法フルコード化90日分処方例"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>外来院外処方　内服1日1回１回1錠 標準用法フルコード化90日分処方例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-PO-SID-90-AMB"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-D002

* meta.lastUpdated = "2023-09-14T14:03:37.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-0009997023-0A172BAD00C8F82023091412502302-1"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-0009997023-0A172BAD00C8F82023091412502302-1"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#OHO "院外処方"
* category.coding[+] = $JP_MedicationCategoryMERIT9_CS#OHP "外来処方"
* category.text = "院外処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeHOT9_CS#121431401 "アムロジピンＯＤ錠１０ｍｇ"
* medicationCodeableConcept.coding[+] = $JP_MedicationCodeYJ_CS#2171022F6276 "アムロジピンＯＤ錠１０ｍｇ"
* medicationCodeableConcept.coding[+] = $Icode#I1042350 "アムロジピンＯＤ錠１０ｍｇ"
* medicationCodeableConcept.text = "アムロジピンＯＤ錠１０ｍｇ"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"
* authoredOn = "2023-09-14T12:50:36+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-D002) "田中　宏"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-D002)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-0009997023-0A172BAD00C8F82023091412502302-1"

* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2023-09-14"
* dosageInstruction.text = "1日1回 朝食後 １回 1錠  (１日  1錠) 90日分"
* dosageInstruction.timing.event = "2023-09-14T00:00:00+09:00"
* dosageInstruction.timing.repeat.boundsDuration = 90 'd' "日"
* dosageInstruction.timing.repeat.count = 90
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d

* dosageInstruction.timing.code.coding =  urn:oid:1.2.392.200250.2.2.20#1011000400000000 "内服 １日１回 朝食後"
* dosageInstruction.timing.code.text = "1日1回 朝食後"
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#PO "口"
* dosageInstruction.route.text = "経口"
* dosageInstruction.method = $JP_MedicationMethodJAMIBasicUsage_CS#1 "内服"

* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 90 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 90 'd' "日"