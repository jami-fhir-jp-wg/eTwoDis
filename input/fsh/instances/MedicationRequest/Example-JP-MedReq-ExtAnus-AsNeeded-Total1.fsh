Instance: Example-JP-MedReq-ExtAnus-AsNeeded-Total1
InstanceOf: JP_MedicationRequest_eCS
Usage: #example
Description: "入院処方　外用(坐剤)頓用全量処方　頓用と1回量をコードで記述できない例"
* note.text = "入院処方　外用(坐剤)頓用全量処方　頓用と1回量をコードで記述できない例"

//* text.status = #additional
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>入院処方　外用(坐剤)頓用全量処方　頓用と1回量をコードで記述できない例</p> </div>"


* id = "Example-JP-MedReq-ExtAnus-AsNeeded-Total1"

* extension[eCS_InstitutionNumber].url = $JP_eCS_InstitutionNumber 
* extension[eCS_InstitutionNumber].valueIdentifier.system = $JP_InstitutionNumber
* extension[eCS_InstitutionNumber].valueIdentifier.value = "1318814790"
* extension[eCS_Department].url = $JP_eCS_Department
* extension[eCS_Department].valueCodeableConcept = $JP_Department_SsMix_CS#01 "内科"


// * contained[+] = Example-Patient-minimun
* contained[+] = Example-JP-Encounter-IMP
* contained[+] = Example-Practitioner-minimun-R001

* meta.lastUpdated = "2021-07-14T16:14:35.000+09:00"
* meta.profile = $JP_MedicationRequest_eCS


//* identifier[rpNumber].system = "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber" // 
* identifier[rpNumber].value = "1"
//* identifier[orderInRp].system = "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" // "http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex" // 
* identifier[orderInRp].value = "1"
//* identifier[requestIdentifierCommon].system = "http://jpfhir.jp/fhir/core/mhlw/IdSystem/PrescriptionDocumentID" // "urn:oid:1.2.392.100495.20.3.11"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11" // 
* identifier[requestIdentifierCommon].value = "1318814790-9990767-0A172220B35F172021071410514001-1"
* identifier[requestIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[requestIdentifier].value = "1318814790-9990767-0A172220B35F172021071410514001-1"
* status = #completed
* intent = #order
* category.coding[0] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category.text = "入院臨時処方"
* medicationCodeableConcept.coding[0] = $JP_MedicationCodeHOT9_CS#104937401 "新レシカルボン坐剤"
* medicationCodeableConcept.coding[+] = $JP_MedicationCodeYJ_CS#2359800J1035 "新レシカルボン坐剤"
* medicationCodeableConcept.coding[+] = $Icode#I3344500 "新レシカルボン坐剤"
* medicationCodeableConcept.text = "新レシカルボン坐剤"
* subject.identifier.system = $JP_Insurance_memberID
* subject.identifier.value = "00012345:あいう:１８７:05"

* subject.type = "Patient"
* encounter = Reference(Example-JP-Encounter-IMP)

* authoredOn = "2021-07-14T10:52:26+09:00"

* requester = Reference(Practitioner/Example-Practitioner-minimun-R001) "医学 一郎"
* requester.type = "Practitioner"
* recorder = Reference(Practitioner/Example-Practitioner-minimun-R001) "医学 一郎"
* recorder.type = "Practitioner"

* groupIdentifier.value = "1318814790-9990767-0A172220B35F172021071410514001-1"
* dosageInstruction.extension[periodOfUse].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[periodOfUse].valuePeriod.start = "2021-07-14"
* dosageInstruction.text = "坐薬 便秘時 1回1個 肛門へ挿入"
* dosageInstruction.timing.event = "2021-07-14T08:00:00+09:00"
* dosageInstruction.timing.code.text = "坐薬 便秘時 1回1個 肛門へ挿入"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dispenseRequest.quantity = 10 $JP_MedicationUnitMERIT9_CS#KO "個"