Instance: ErrorExample-JP-MedReq-ExtSkin-Total2
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "意図的エラー例：入院処方　外用（塗布）全量処方　1回量をコードで記述できない例. ただし医薬品コードを「標準コード」「標準コードなし」のいずれでも記述していないためにエラーになる例。"
* note.text = "意図的エラー例：入院処方　外用（塗布）全量処方　1回量をコードで記述できない例. ただし医薬品コードを「標準コード」「標準コードなし」のいずれでも記述していないためにエラーになる例。"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>入院処方　外用（塗布）全量処方　1回量をコードで記述できない例</p> </div>"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* id = "Example-JP-MedReq-ExtSkin-Total2"

// * contained[+] = Example-Patient-minimun
* contained[+] = Example-Practitioner-minimun-R001

* meta.lastUpdated = "2021-07-05T19:07:58.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS

* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" 
* identifier[orderInRp].value = "1"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A172C13361BBE2021070517301001-1"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A172C13361BBE2021070517301001-1"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#XTR "臨時処方"
* category.coding[+] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "時間外処方"

* medicationCodeableConcept.coding[0] = $JP_eCS_MedicationCodeNocoded_CS#NOCODED "標準コードなし"
* medicationCodeableConcept.coding[+] = $Icode#I3240210 "ヒルドイドローション２５ｇ"
* medicationCodeableConcept.text = "ヒルドイドローション２５ｇ"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"


* subject.type = "Patient"

* authoredOn = "2021-07-05T17:31:48+09:00"
* requester = Reference(Practitioner/Example-Practitioner-minimun-R001) "医学 一郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-R001)
* recorder.type = "Practitioner"
* groupIdentifier.value = "1318814790-9990767-0A172C13361BBE2021070517301001-1"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-05"
* dosageInstruction.text = "1日数回 塗布"
* dosageInstruction.timing.event = "2021-07-05T08:00:00+09:00"
* dosageInstruction.timing.code.text = "1日数回 塗布"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dispenseRequest.quantity = 1 $JP_MedicationUnitMERIT9_CS#HON "本"