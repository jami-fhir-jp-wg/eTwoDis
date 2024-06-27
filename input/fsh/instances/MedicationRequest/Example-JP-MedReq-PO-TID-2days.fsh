Instance: Example-JP-MedReq-PO-TID-2days
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "外来院外処方　内服1日1回１回1錠 標準用法コード化90日分処方例　（発行診療科、オーダ番号記載あり）"
* note.text = "外来院外処方　内服1日1回１回1錠 標準用法コード化90日分処方例　（発行診療科、オーダ番号記載あり）"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>外来院外処方　内服1日1回１回1錠 標準用法コード化90日分処方例　（発行診療科、オーダ番号記載あり）</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* extension[eCS_Department].url = $JP_eCS_Department
* extension[eCS_Department].valueCodeableConcept.coding[+] = $JP_Department_SsMix_CS#08 "循環器科"
* extension[eCS_Department].valueCodeableConcept.text = "循環器診療科"

* id = "Example-JP-MedReq-PO-TID-2days"

* meta.lastUpdated = "2021-07-09T14:11:13.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS

* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" //"http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "1"

* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A1720D83807672021070909210705-2"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A1720D83807672021070909210705-2"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-D001

* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "入院臨時処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeHOT9_CS#104195801 "ミヤＢＭ錠"
* medicationCodeableConcept.coding[+] = $Icode#I1656900 "ミヤＢＭ錠（２０ｍｇ／錠）"
* medicationCodeableConcept.coding[+] = $JP_MedicationCodeYJ_CS#2316009F1022 "ミヤＢＭ錠"
* medicationCodeableConcept.text = "ミヤＢＭ錠（２０ｍｇ／錠）"

* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-09T09:47:14+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-D001) "医療 太郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-D001)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-0A1720D83807672021070909210705-2"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-09"
* dosageInstruction.text = "1日3回 毎食後 １回 2錠  (１日  6錠) 2　日分"
* dosageInstruction.timing.event = "2021-07-09T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsDuration = 3 'd' "日"
* dosageInstruction.timing.repeat.count = 6
* dosageInstruction.timing.repeat.frequency = 3
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d

* dosageInstruction.timing.code.coding =  urn:oid:1.2.392.200250.2.2.20#1013044400000000 "内服 １日３回 朝昼夕食後"
* dosageInstruction.timing.code.text = "1日1回 毎食後"

* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 2 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 6 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* dispenseRequest.quantity = 12 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 2 'd' "日"