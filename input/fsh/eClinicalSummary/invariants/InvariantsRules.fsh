

// R1010-  患者IDチェック

Invariant: valid-system-local-patientID
Description: "R1010:施設患者IDを記述する場合には、identifier.systemは、'urn:oid:1.2.392.100495.20.3.51.[1+施設番号10桁]'でなければならない。"
Severity: #error
Expression: "(identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').count()=1 and (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.')).system.substring(31,1) = '1' and (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.')).system.substring(32).matches('^[0-4][0-9][1-3][0-9]{7}$')) or (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').empty())"


Invariant: valid-system-local-patientID-with-institutionNumber
Description: "R1011:施設患者IDを記述する場合には、identifier.systemは、'urn:oid:1.2.392.100495.20.3.51.[1+施設番号10桁]'であり、かつその施設番号10桁はextension[eCS_InstitutionNumber].valueIdentifier.value値と一致しなければならない。"
Severity: #error
Expression: "(identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').count()=1 and (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.')).system.substring(31,11) = '1' + extension('http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').value.ofType(Identifier).value) or (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').empty())"

Invariant: valid-system-insurance-patientIdentifier
Description: "R1012:被保険者識別子情報(identifier.system=\"http://jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_memberID\")は１つだけ必須。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_memberID').count()=1)"

Invariant: valid-value-insurance-patientIdentifier
Description: "R1013:identifier.value 被保険者識別子情報の形式は、\"保険者等番号:被保険者記号:被保険者番号:被保険者証等枝番\"で、それぞれ半角英数字8桁固定、半角または全角文字列(空白を含まない)、半角または全角文字列(同)、半角数字2桁固定(1文字目は0)であり、それぞれ存在しない場合には、空文字列とする。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_memberID').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_memberID').value.matches('^[0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:0[0-9]$'))"
// '^[0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:0[0-9]$''
// '^[0-9]{8}:[^:]*:[^:]*:[0-9]{2}$'

// R1021-  施設IDチェック
Invariant: valid-value-institutionNumber
Description: "R1021:医療機関番号　extension[eCS_InstitutionNumber].valueIdentifier.value値は、２桁都道府県番号、１桁医療機関区分(1|2|3)、７桁保険医療機関番号の連結１０桁とする。"
Severity: #error
Expression: "extension('http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').value.ofType(Identifier).value.matches('[0-4][0-9][1-3][0-9]{7}')"

Invariant: valid-value-institutionNumberExtension
Description: "施設番号　valueIdentifier.value値は、２桁都道府県番号、１桁医療機関区分(1|2|3)、７桁保険医療機関番号の連結１０桁とする。"
Severity: #error
Expression: "value.ofType(Identifier).value.matches('[0-4][0-9][1-3][0-9]{7}')"


Invariant: valid-system-local-doctorID
Description: "R1090:施設医師IDを記述する場合には、identifier.systemは、'urn:oid:1.2.392.100495.20.3.41.[1+施設番号10桁]'でなければならない。"
Severity: #error
Expression: "(identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.41.').count()=1 and (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.41.')).system.substring(31,1) = '1' and (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.41.')).system.substring(32).matches('^[0-4][0-9][1-3][0-9]{7}$')) or (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.41.').empty())"

// R2011-  アレルギー・薬剤アレルギー等関係チェック
Invariant: warning-medication-allergy
Description: "注意喚起：R2011:薬剤アレルギー等情報として本リソース種別を使用するのであれば、category要素は\"medication\"で、criticality要素は\"high\"を設定しなければならない。このままcriticality要素が\"high\"以外で差し支えなければ修正不要。"
Severity: #warning
Expression: "(category.where($this='medication').exists() and criticality='high') or (category.where($this='medication').exists()).not()"


// R2012  薬剤アレルギー等で「YJまたは一般名医薬品コード」を使用すること（電子カルテ情報交換サービスの場合）
Invariant: valid-contraIndication-code
Description: "R2012:薬剤アレルギー等情報としてcategory要素は\"medication\"で、criticality要素は\"high\"の場合には、code要素はYJまたは一般名医薬品コードでなければならない。それ以外の（薬剤アレルギー等でない）場合にはJFAGYコードを使用すること。"
Severity: #error
Expression: "(category.where($this='medication').exists() and criticality='high' and (code.coding.where(system = 'urn:oid:1.2.392.100495.20.1.73').count()=1 or code.coding.where(system = 'urn:oid:1.2.392.100495.20.1.81').count()=1)) or (category.where($this='medication').count()=0 or criticality!='high')"

// R2013  アレルギーではJFAGYを使用すること（電子カルテ情報交換サービスの場合）
Invariant: valid-allergy-code
Description: "R2013:薬剤アレルギー等でないアレルギーの場合にはJFAGYコードを使用すること。"
Severity: #error
Expression: "(category.where($this='medication').count()=1 and criticality='high') or ((category.where($this='medication').count()=0 or criticality!='high') and (code.coding.where(system = 'http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS').count()=1 or  code.coding.where(system = 'http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyNonFoodNonMedicationAllergen_CS').count()=1 or code.coding.where(system = 'http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyMedicationAllergen_CS').count()=1 ))"

// 医療機関番号１０桁：[0-4][0-9][1-3][0-9]{7}
// 保険者番号８桁：[0-9]{8}
// 被保険者記号：[^:^\\\\s^　]* 
// 被保険者番号：[^:^\\\\s^　]*
// 被保険者枝番：0[0-9]
// 被保険者識別子: ^[0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:0[0-9]$
// 医療機関内Bundle識別子：[A-Z0-9\\\\-]{1,128}

// R0211-   Bundle CLINSのチェック
Invariant: first-bundle-entry-is-Patient
Description: "R0211:最初のentryはPatientでなければならない。"
Severity: #error
Expression: "entry.first().resource.is(Patient)"

// バージョン指定部分を除くURLを一致チェック
Invariant: patients-profile-is-JP-Patient-CLINS-eCS
Description: "R0212:最初のentryであるPatientは、JP_Patient_eCSプロファイルに準拠していなければならない。"
Severity: #error
Expression: "entry.first().resource.meta.where(profile.substring(0,60)='http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Patient_eCS').exists()"

Invariant: bundle-profile-is-JP-Bundle-CLINS
Description: "R0213:BundleはJP-Bundle-CLINSプロファイルに準拠していなければならない。"
Severity: #error
Expression: "meta.profile.where($this.substring(0,63) ='http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_CLINS').exists()"


// Bundleルール meta.tag には system = 'http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS'
// が存在し、
// meta.tag.where(system = 'http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS').extsis() 
// その.code は 'AllergyIntolerance', 'Observation', 'Condition'のいずれかであること
// meta.tag.where(system = 'http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS').code in ('AllergyIntolerance', 'Observation', 'Condition')
Invariant: bundle-meta-tag-resourceType-exists
Description: "R02141:Bundle.meta.tagに、収納するresourceTypeを記述しなければならない。"
Severity: #error
Expression: "meta.tag.where(system='http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS').exists()"

Invariant: bundle-meta-tag-resourceType-valid
Description: "R02142:Bundle.meta.tagに記述されたresourceTypeは、'AllergyIntolerance', 'Observation', 'Condition'のいずれかであること。"
Severity: #error
Expression: "meta.tag.where(system='http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS').code='AllergyIntolerance' or meta.tag.where(system='http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS').code='Observation' or meta.tag.where(system='http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS').code='Condition'"


// Bundle のidentifier. [\\\\^]
// Bundle.identifier.system : system値として、”http://jpfhir.jp/fhir/clins/bundle-identifier” を設定する。\r\n
// Bundle.identifier.value : 実装ガイド本文 6情報送信仕様--Bundleリソースを識別するIdentifier要素-- に記載の[Bundle-ID]の仕様とする。"
Invariant: valid-system-bundleIdenfifier
Description: "R02151:Bundle.identifier.sysyemは、http://jpfhir.jp/fhir/clins/bundle-identifier"
Severity: #error
Expression: "identifier.where(system='http://jpfhir.jp/fhir/clins/bundle-identifier').exists()"

// R02152- BundleIDチェック　要修正
Invariant: valid-value-bundleIdenfifier
Description: "R2152:Bundle.identifier.value は、医療機関番号10桁^西暦４件^36文字以内の半角文字列（英字、数字、ハイフン記号のみ可）であること。'^[0-4][0-9][1-3][0-9]{7}[\\^]20[2-3][0-9][\\^][A-Za-z0-9\\-]{1,36}$'"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^[0-4][0-9][1-3][0-9]{7}[\\\\^]20[2-3][0-9][\\\\^][A-Za-z0-9\\\\-]{1,36}$'))"


// R3010 医薬品コードの妥当性チェック（標準コードなしもOK）
Invariant: needs-anyOfStandardCode-medication
Description: "R3010:medicationCodeableConcept は、電子カルテ共有サービスで使用する場合には、YJコード、厚生労働省一般名コード、標準コードなし、のいずれかを必須とする。その上でそれ以外のコード体系が存在してもよい。"
/*
Alias: $JP_MedicationCodeYJ_CS = urn:oid:1.2.392.100495.20.1.73
Alias: $JP_MedicationCodeHOT7_CS = urn:oid:1.2.392.200119.4.403.2
Alias: $JP_MedicationCodeHOT9_CS = urn:oid:1.2.392.200119.4.403.1
Alias: $JP_MedicationCodeCommon_CS = urn:oid:1.2.392.100495.20.1.81
Alias: $JP_eCS_MedicationCodeNocoded_CS = http://jpfhir.jp/fhir/eCS/CodeSystem/MedicationCodeNocoded_CS
*/
Severity: #error
Expression: "(medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.100495.20.1.73').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.100495.20.1.81').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'http://jpfhir.jp/fhir/eCS/CodeSystem/MedicationCodeNocoded_CS').count()=1)"

// R3011 医薬品コードの妥当性チェックYJか一般のみ（標準コードなしはX）
Invariant: needs-anyOfYJorGeneral-medication
Description: "R3011:medicationCodeableConcept は、電子カルテ共有サービスで使用する場合には、YJコード、厚生労働省一般名コードのいずれかを必須とする。その上でそれ以外のコード体系が存在してもよい。"
/*
Alias: $JP_MedicationCodeYJ_CS = urn:oid:1.2.392.100495.20.1.73
Alias: $JP_MedicationCodeHOT7_CS = urn:oid:1.2.392.200119.4.403.2
Alias: $JP_MedicationCodeHOT9_CS = urn:oid:1.2.392.200119.4.403.1
Alias: $JP_MedicationCodeCommon_CS = urn:oid:1.2.392.100495.20.1.81
Alias: $JP_eCS_MedicationCodeNocoded_CS = http://jpfhir.jp/fhir/eCS/CodeSystem/MedicationCodeNocoded_CS
*/
Severity: #error
Expression: "((medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.100495.20.1.73').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.100495.20.1.81').count()=1)) and ((medication.ofType(CodeableConcept).coding.where(system = 'http://jpfhir.jp/fhir/eCS/CodeSystem/MedicationCodeNocoded_CS').count()=0))"

// R4011 薬剤アレルギーとその他アレルギー等の情報とを区別するため、電子カルテ情報サービスでは、薬剤アレルギー等情報として本リソース種別を使用する場合には、必ず本要素は"medication"として存在しなければならず、criticality要素は"high"を設定しなければならない。これ以外の場合には、本リソースの情報はやその他のアレルギー情報として取り扱われる。
// Invariant: needs-anyOfStandardCode-medication

// R6021 Observation CLINS ではローカルコードの記述は必須である。
Invariant: needs-localCode-observation-laboresult
Description: "R6021:observation.code.codingには、ローカルコード記述が必須である。（system=\"http://jpfhir.jp/fhir/clins/CodeSystem/JP_CLINS_ObsLabResult_LocalCode_CS\")"
Severity: #error
Expression: "code.coding.where(system ='http://jpfhir.jp/fhir/clins/CodeSystem/JP_CLINS_ObsLabResult_LocalCode_CS').exists()"

//

// R9011  Bundleに含まれるリソースには、医療機関識別IDが必須である。
Invariant: all-entries-needs-extension-of-institutionNumber
Description: "R9011:Bundleに含まれるPatient以外のリソースには、医療機関識別IDが必須である。"
Severity: #error
Expression: "enrty.tail().all(resource.extension.where(url='http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').exists())"

// r901101 リソースには、医療機関識別IDが必須である。
Invariant: resource-needs-extension-of-institutionNumber
Description: "R901101:リソースには、医療機関識別IDが必須である。"
Severity: #error
Expression: "extension.where(url='http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').exists()"


// R9012  Bundleに含まれるリソースには、医療機関識別IDが記述され10桁数字であることが必須である。
Invariant: all-entries-needs-valid-institutionNumber
Description: "R9012:Bundleに含まれるPatient以外のリソースには、医療機関識別IDが記述され10桁数字であることが必須である。"
Severity: #error
Expression: "enrty.tail().all(resource.extension.where(url='http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').valueIdentifier.where(system='http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no').value.matches('^[0-4][0-9][1-3][0-9]{7}$'))"



// R9013C  Bundleに含まれるConditonリソースには、JP_Encounterリソースが必須である。
Invariant: condition-needs-contained-of-Encounter
Description: "R9013C:Bundleに含まれるConditionのリソースには、Contained JP_Encounterリソース"
Severity: #error
Expression: "entry.select(resource as Condition).all(resource.contained.where(resourceType='Encounter').exists())"

// R9013O Bundleに含まれるObservationリソースには、JP_Encounterリソースが必須である。
Invariant: observation-needs-contained-of-Encounter
Description: "R9013O:Bundleに含まれるObservationのリソースには、Contained JP_Encounterリソース"
Severity: #error
Expression: "entry.select(resource as Observation).all(resource.contained.where(resourceType='Encounter').exists())"

// R9014C  Bundleに含まれるConditonリソースには、診療科拡張が必須である。
Invariant: condition-needs-extension-of-Department
Description: "R9014C:BBundleに含まれるConditonリソースには、診療科拡張が必須である。"
Severity: #error
Expression: "entry.select(resource as Condition).all(resource.extension.where(url='http://jpfhir.jp/fhir/eCS/Extension/StructureDefinition/JP_eCS_Department').exists())"

// R9014O  Bundleに含まれるObservationリソースには、診療科拡張が必須である。
Invariant: observation-needs-extension-of-Department
Description: "R9014O:BBundleに含まれるObservationリソースには、診療科拡張が必須である。"
Severity: #error
Expression: "entry.select(resource as Observation).all(resource.extension.where(url='http://jpfhir.jp/fhir/eCS/Extension/StructureDefinition/JP_eCS_Department').exists())"


//========= 以下、未整理 =========
// 
// Bundleルール
// Profileで書けるものはProfileで書く
//
//
/*
//



## Bundleリソースのタイプ（type要素）は”collection”を使用する。
必須ルール
JP_FHIR Profile
Bundle.type = "collection"

//
## 1回で送信するひとつのBundleリソースには、4タイプのいずれかひとつのリソースタイプのデータと、患者を識別するためのPatientリソース1個だけを格納する。
複数のリソースタイプのデータをひとつのBundleリソースに混在させて送信することはできない。
必須ルール
JP_FHIR Profile
entry contains... で closed slicing で記述されている。

//

## どのリソースタイプを格納しているかの情報を明示的に設定するため、Bundleリソースの　meta.tagにリソースタイプを設定する。
必須ルール
JP_FHIR Profile
Bundle.meta.tag 
Bundle.meta.tag  ^slicing.discriminator.type = #value
Bundle.meta.tag  ^slicing.discriminator.path = "system"
Bundle.meta.tag  ^slicing.rules = #open
Bundle.meta.tag contains resourceType 1..1
meta.tag[resourceType].system = $JP_CLINS_BundleResourceType_CS
meta.tag[resourceType].code from $JP_CLINS_BundleResourceType_VS

//
Invariant: first-bundle-entry-is-Patient
Description: "R0211:最初のentryはPatientでなければならない。"

//
Invariant: patients-profile-is-JP-Patient-CLINS-eCS
Description: "R0212:最初のentryであるPatientは、JP_Patient_eCSプロファイルに準拠していなければならない。" d

## ひとつのBundleリソースには、ひとりの患者の、同時に１回で報告される一連のデータ（１報告単位のデータ）だけを、すべて漏れなく格納する。
必須ルール
運用ルール


## Bundle.identifier.system : system値として、”http://jpfhir.jp/fhir/clins/bundle-identifier” を設定する。
必須ルール
JP_FHIR Profile
* identifier.system = "http://jpfhir.jp/fhir/clins/bundle-identifier" (exactly)

## Bundle.identifier.value : 以下に記載する[報告単位識別ID]　を設定する。
必須ルール
Invariant: valid-value-bundleIdenfifier

## Bundle.entry[] に繰り返しで格納される個々のリソース・インスタンスは、必ずBundle.entry[].fullUrl要素に、uuidをその都度毎回生成して設定しなければならない。
必須ルール
Bundle Profile

## 同じリソースインスタンスを別のBundleリソースにより再送する場合でも、前回使用したuuidを使用してはならない（エラーにはならない）。 
必須ルール
運用ルール　and 受信側チェック

## 1回で送信するひとつのBundleインスタンスの中に同一のuuidが存在してはならない（エラーとなる）。
必須ルール
Bundle Profile

## このuuidによるBundle内のentryの識別子を、前回送信時の特定のentryの内容を受信側に指し示すための識別子として利用することはできない。
必須ルール
運用ルール　and 受信側チェック

## FHIR検査項目情報」の設定パターン、「FHIR検査項目情報」の設定パターン適用規則
必須ルール
JP Profile and JP Terminology

## 感染症情報とそれ以外の検体検査結果情報の区別
必須ルール
JP Profile and JP Terminology

## 薬剤アレルギーとその他アレルギー等の情報の区別
必須ルール
JP Profile and JP Terminology

## 「被保険者個人識別子」の文字列仕様
必須ルール
Invariant: valid-value-insurance-patientIdentifier
Invariant: valid-system-insurance-patientIdentifier

## 「被保険者個人識別子」の指定system
必須ルール
Invariant: valid-system-insurance-patientIdentifier

## 被保険者個人識別子は、Patientリソースのidentifier要素のvalueに記述する。
必須ルール
JP Patinet Profile 

## 長期保存対象とする場合には、そのリソースのデータにおけるmeta要素のtag要素に以下の形式で記述しなければならない。
###　meta.tag.system = “http://jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication”　(この固定値とする)
###　meta.tag.code = “LTS”　(この固定値とする)
必須ルール
JP CLINS Profile 

## 未告知病名】情報の仕様:病名リソース（Conditionリソース）におけるmeta要素のtag要素に以下の形式で記述しなければならない。


*/

