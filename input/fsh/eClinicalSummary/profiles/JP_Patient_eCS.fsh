// ==================================================
//   Profile 定義 診療情報・サマリー汎用
//   電子カルテ情報共有サービス対応プロファイル
//   患者情報 リソースタイプ Patient
//   親プロファイル:JP_MedicationRequest
// ==================================================

Profile: JP_Patient_eCS
Parent: JP_Patient
Id: JP-Patient-eCS
Title: "eCS/CLINS:JP_Patient_eCS"
Description: "eCS/CLINS Patientリソース（患者情報）プロファイル"

* obeys valid-system-local-patientID
* obeys valid-system-insurance-patientIdentifier
* obeys valid-value-insurance-patientIdentifier

//* obeys institurionNumber

/*
* extension contains JP_eCS_InstitutionNumber named eCS_InstitutionNumber ..1 MS
* extension[eCS_InstitutionNumber] 0..1 MS
*/

* ^url = $JP_Patient_eCS

* ^version = "1"
* ^status = #active
* ^date = "2024-06-24"
* ^publisher = "（一社）日本医療情報学会"
* ^copyright = "（一社）日本医療情報学会. CC BY-ND 4.0"
* ^fhirVersion = #4.0.1

* . ^short = "患者情報の記述に使用する。"
* . ^definition = "患者情報の記述に使用する。電子カルテ共有サービスで使用できる。"
* . ^comment = "本プロファイルは、患者を識別するidentifierとして、被保険者個人識別子を必須としている。また、name.family, name.given, gender, birthDate, address.text, address.city, address.stateを必須としている。"

* meta.versionId ^short = "バージョン固有の識別子"
* meta.versionId ^definition = "バージョン固有の識別子"
* meta.lastUpdated 0.. MS
* meta.lastUpdated ^short = "最終更新日"
* meta.lastUpdated ^definition = "この患者情報の内容がサーバ上で最後に格納または更新された日時、またはこのFHIRリソースが生成された日時"
* meta.profile 1..1 MS
  * insert relative_short_definition("準拠しているプロファイルとして次のURLを指定する。http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Patient_eCS")
//* meta.profile = "http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Patient_eCS"


* identifier ^short = "保険者・被保険者番号情報、自施設の患者番号など。"
* identifier ^definition = "保険者・被保険者番号情報(system=\"http://jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_memberID\")はあれば必須（電子カルテ情報共有サービスでは必須）。被保険者個人識別子の仕様は「被保険者個人識別子」の文字列仕様を参照のこと。それが取得できていない場合や、同時に施設での患者番号も記述したい場合には、自施設の患者番号（system=\"urn:oid:1.2.392.100495.20.3.51.[1+施設番号10桁]\"）とし、その施設での患者番号を記述する。"

* name 1.. MS
* name.family 1.. MS
* name.given 1.. MS

* gender 1.. MS
* birthDate 1.. MS
* address 1..1 MS
* address ^definition = "患者の住所。必須。"

* address.text 1.. MS


