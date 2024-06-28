
Profile: JP_Bundle_eReferral
Parent: Bundle
Id: JP-Bundle-eReferral
Description: "診療情報提供書 Bundle"
* ^url = "http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_eReferral"
* ^version = "1"
* ^status = #active
* . ^short = "電子カルテ情報共有サービスに送信可能な診療情報提供書のための文書 Bundleリソース"
* . ^definition = "電子カルテ情報共有サービスに送信可能な診療情報提供書のための文書 Bundleリソース"
* meta.lastUpdated 1.. MS
* meta.profile 1.. MS
//* meta.profile = "http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_eReferral"

* identifier 1.. MS
* identifier ^short = "この文書Bundleの固定識別番号。Bundle作成時にシステムが設定し、サーバ間で移動、コピーされても変更されないID。"
* identifier ^definition = "この文書Bundleの固定識別番号。identifierがグローバルに一意になるように生成される必要がある。"
* identifier.system 1.. MS
* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/documentInstance-identifier" (exactly)
* identifier.value 1.. MS

* type = #document (exactly)
* type ^definition = "このバンドルの目的コード。本プロファイルでは document 固定とする。\r\n（document | message | transaction | transaction_response | batch | batch_response | history | searchset | collection）"
* type MS
* timestamp 1.. MS
* timestamp ^short = "このバンドルリソースのインスタンスが作成された日時。"
* timestamp ^definition = "このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。　例：\"2021-02-01T13:28:17.239+09:00\""

* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    composition 1..1 MS  // 文書構成情報
and patient 1..1 MS  //  患者情報
and practitioners 1.. MS
and organization 2.. MS // 文書作成機関*、文書管理責任機関*、紹介先医療機関*、紹介元医療機関*
//and organizationFrom 1..* MS
//and department 0.. MS
//and departmentOfissuer  0..* MS
//and referralDoctor 1..* MS
//and cdaDocument 0..1 MS
and referralEncounter 0.. MS
and problem 0..* MS
and allergy 0..* MS
and familyHistory 0..* MS
and observation 0..* MS
and immunization 0..* MS
and procedure 0..* MS
and medicationRequest 0..* MS
and documentReference 0..* MS
and carePlan 0..* MS
and medicalDeviceUse 0..* MS
and medicalDevice 0..* MS
and imageStudy 0..* MS
and diagReport 0..* MS
and advancedDirective 0..* MS
and researchSubject 0..* MS   // 臨床研究情報
and researchStudy 0..* MS   // 臨床研究参加情報
and relatedPerson 0..* MS   // 関係者情報                       
and bundleData 0..* MS   // 他のBundle情報（たとえば処方や退院時サマリー）                  

* entry[composition] ^short = "documentタイプのBundleリソースの先頭entryはCompositionリソース。"
* entry[composition] ^definition = "compositionリソースのエントリー。"
* entry[composition].fullUrl 1.. MS
* entry[composition].fullUrl ^short = "埋め込まれているCompositionリソースを一意に識別するためのUUID"
* entry[composition].fullUrl ^definition = "埋め込まれているCompositionリソースを一意に識別するためのUUID。"
* entry[composition].resource 1.. MS
* entry[composition].resource only  JP_Composition_eReferral
* entry[composition].resource ^short = "Compositionリソースのインスタンス本体"
* entry[composition].resource ^definition = "Compositionリソースのインスタンス本体。"
* entry[composition].search ..0
* entry[composition].request ..0
* entry[composition].response ..0

* entry[patient] ^short = "Patientリソース"
* entry[patient] ^definition = "Patientリソースのエントリー。"
* entry[patient].fullUrl 1.. MS
* entry[patient].fullUrl ^short = "埋め込まれているPatientリソースを一意に識別するためのUUID"
* entry[patient].fullUrl ^definition = "埋め込まれているPatientリソースを一意に識別するためのUUID。"
* entry[patient].resource 1.. MS
* entry[patient].resource only JP_Patient_eCS  // 患者情報エントリ Composition.subject
* entry[patient].resource ^short = "Patientリソースのインスタンス本体"
* entry[patient].resource ^definition = "Patientリソースのインスタンス本体。"
* entry[patient].search ..0
* entry[patient].request ..0
* entry[patient].response ..0

* entry[practitioners] ^short = "正当な権限があって文書を作成した個人の情報"
* entry[practitioners] ^definition = "正当な権限があって文書を作成した個人を表すPractitionerリソースで記述する。\r\nauthorisedAuthorRole要素が参照するPractitionerRoleから参照される。"
* entry[practitioners].fullUrl 1.. MS
* entry[practitioners].fullUrl ^short = "埋め込まれているPractitionerリソースを一意に識別するためのUUID"
* entry[practitioners].fullUrl ^definition = "埋め込まれているPractitionerリソースを一意に識別するためのUUID。"
* entry[practitioners].resource 1.. MS
* entry[practitioners].resource only JP_Practitioner_eCS
* entry[practitioners].resource ^short = "Practitionerリソースのインスタンス本体"
* entry[practitioners].resource ^definition = "Practitionerリソースのインスタンス本体。"
* entry[practitioners].search ..0
* entry[practitioners].request ..0
* entry[practitioners].response ..0

* entry[organization].resource only JP_Organization_eCS
* entry[organization] ^short = "紹介先／元医療機関／文書作成機関／文書管理機関"
* entry[organization] ^definition = "紹介先／元医療機関／文書作成機関／文書管理機関"
* entry[organization].search ..0
* entry[organization].request ..0
* entry[organization].response ..0

//* entry[organizationFrom].resource only JP_Organization_eCS_issuer
//* entry[organizationFrom] ^short = "紹介元医療機関／文書作成機関／文書管理機関"
//* entry[organizationFrom] ^definition = "紹介元医療機関"
//* entry[organizationFrom].search ..0
//* entry[organizationFrom].request ..0
//* entry[organizationFrom].response ..0
/*
* entry[department].resource only JP_Organization_eCS_department
* entry[department] ^short = "紹介先／元医療機関／文書作成機関の診療科"
* entry[department] ^definition = "紹介先／元医療機関／文書作成機関の診療科"
* entry[department].search ..0
* entry[department].request ..0
* entry[department].response ..0
*/
/*
* entry[departmentOfissuer].resource only  JP-Organization-eCS-departmentOfissuer
* entry[departmentOfissuer] ^short = "紹介元文書作成機関の診療科"
* entry[departmentOfissuer] ^definition = "紹介元文書作成機関の診療科"
* entry[departmentOfissuer].search ..0
* entry[departmentOfissuer].request ..0
* entry[departmentOfissuer].response ..0
*/
//* entry[referralDoctor].resource only  JP_Practitioner_eCS
//* entry[referralDoctor] ^short = "紹介先／元医師"
//* entry[referralDoctor] ^definition = "紹介先／元医師"

//* entry[cdaDocument].resource only  JP_DocumentReference_CDAdocument
//* entry[cdaDocument] ^short = "CDA規約文書ファイルへの参照"
//* entry[cdaDocument] ^definition = "CDA規約文書ファイルへの参照"

* entry[referralEncounter].resource only JP_Encounter_eCS
* entry[referralEncounter] ^short = "紹介目的や受診時状況のEncounterリソースを参照"
* entry[referralEncounter] ^definition = "紹介目的や受診時状況のEncounterリソースを参照。"

* entry[problem].resource only  JP_Condition_eCS
* entry[problem] ^short = "必須。傷病名・主訴／現病歴／既往歴を１個以上必ず記述する。"
* entry[problem] ^definition = "必須。傷病名・主訴／現病歴／既往歴を１個以上必ず記述する。1つにつき1つのConditionで記述されたものを参照する。"

* entry[allergy].resource only  JP_AllergyIntolerance_eCS
* entry[allergy] ^short = "アレルギー・不耐性反応情報を記述したAllergyIntoleranceリソースを参照"
* entry[allergy] ^definition = "アレルギー・不耐性反応情報を記述して参照する。"

* entry[familyHistory].resource only  JP_FamilyMemberHistory
* entry[familyHistory] ^short = "家族歴情報を記述したFamilyMemberHistoryリソースを参照"
* entry[familyHistory] ^definition = "家族歴情報情報を記述して参照する。"

* entry[observation].resource only  JP_Observation_Common_eCS
* entry[observation] ^short = "身体所見／感染症情報／社会歴・生活習慣情報／検査結果を記述したObservationリソースを参照"
* entry[observation] ^definition = "身体所見／感染症情報／社会歴・生活習慣情報／検査結果を記述して参照する。"

* entry[observation] ^slicing.discriminator.type = #profile
* entry[observation] ^slicing.discriminator.path = "resource"
* entry[observation] ^slicing.rules = #open
* entry[observation] contains
    laboratory 0..* MS  // 検体検査 $JP_SimpleObservationCategory_CS#laboratory

* entry[observation][laboratory] ^short = "検体検査結果を記述したObservationリソースを参照"
* entry[observation][laboratory] ^definition = "検体検査結果を記述して参照する。"
* entry[observation][laboratory].resource only  JP_Observation_LabResult_eCS

* entry[immunization].resource only  JP_Immunization_eCS
* entry[immunization] ^short = "予防接種歴情報を記述したImmunizationリソースを参照"
* entry[immunization] ^definition = "予防接種歴情報を記述して参照する。"

* entry[procedure].resource only  JP_Procedure_eCS
* entry[procedure] ^short = "手術処置/輸血歴情報/処置等を記述したProcedureリソースを参照"
* entry[procedure] ^definition = "手術処置/輸血歴情報/処置等を記述して参照する。"

* entry[medicationRequest].resource only  JP_MedicationRequest_eCS
* entry[medicationRequest] ^short = "処方情報を記述したMedicationRequestリソースを参照"
* entry[medicationRequest] ^definition = "処方情報を記述して参照する。"

* entry[documentReference].resource only  JP_DocumentReference_eCS
* entry[documentReference] ^short = "DocumentReferenceリソースを参照"
* entry[documentReference] ^definition = "DocumentReferenceリソースを参照"

* entry[carePlan].resource only  JP_CarePlan_eCS
* entry[carePlan] ^short = "診療方針指示を記述したCarePlanリソースを参照"
* entry[carePlan] ^definition = "診療方針指示を記述して参照する。"

* entry[medicalDeviceUse].resource only  JP_DeviceUseStatement
* entry[medicalDeviceUse] ^short = "医療機器の使用状況を記述したDeviceUseStatementリソースを参照"
* entry[medicalDeviceUse] ^definition = "医療機器の使用状況を記述したDeviceUseStatementリソースを参照する。"

* entry[medicalDevice].resource only  JP_Device
* entry[medicalDevice] ^short = "医療機器情報を記述したDeviceリソースを参照"
* entry[medicalDevice] ^definition = "医療機器情報を記述したDeviceリソースを参照する。"

* entry[imageStudy].resource only  JP_ImagingStudy_Radiology
* entry[imageStudy] ^short = "画像検査情報を記述したImagingStudyリソースを参照"
* entry[imageStudy] ^definition = "画像検査医療機器情報を記述したImagingStudyリソースを参照する。"

* entry[diagReport].resource only  JP_DiagnosticReport_Common
* entry[diagReport] ^short = "診断レポート情報を記述したDiagnosticReportリソースを参照"
* entry[diagReport] ^definition = "診断レポート情報を記述したDiagnosticReportリソースを参照する。"


* entry[advancedDirective].resource only  JP_Consent
* entry[advancedDirective] ^short = "事前指示を記述したConcentリソースを参照"
* entry[advancedDirective] ^definition = "事前指示を記述して参照する。"

* entry[researchSubject].resource only  JP_ResearchSubject
* entry[researchSubject] ^short = "臨床研究参加情報者を記述したResearchSubject_リソースを参照"
* entry[researchSubject] ^definition = "臨床研究参加者情報を記述して参照する。"

* entry[researchStudy].resource only  JP_ResearchStudy
* entry[researchStudy] ^short = "臨床研究情報を記述したResearchStudyリソースを参照"
* entry[researchStudy] ^definition = "臨床研究情報を記述して参照する。"

* entry[relatedPerson].resource only  JP_RelatedPerson
* entry[relatedPerson] ^short = "親族情報を記述したRelatedPersonリソースを参照"
* entry[relatedPerson] ^definition = "親族情報を記述して参照する。"

* entry[bundleData].resource only  JP_Bundle
* entry[bundleData] ^short = "各種のBudle文書"
* entry[bundleData] ^definition = "各種のBudle文書を参照する。"