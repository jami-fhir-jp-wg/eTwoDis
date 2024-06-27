// ==================================================
//   Profile 定義 診療情報・サマリー汎用
//   このプロファイルは、電子カルテ情報共有サービスに２文書（診療情報提供書、退院時サマリー）に含める処方情報にも用いられる。
//   処方オーダの１処方薬情報 リソースタイプ:MedicationRequest
//   親プロファイル:JP_MedicationRequest
// ==================================================
Profile: JP_MedicationRequest_eCS
Parent: JP_MedicationRequest
Id: JP-MedicationRequest-eCS
Title:  "eCS/CLINS:JP_MedicationRequest_eCS"
Description: "eCS/CLINS 診療情報・サマリー汎用 MedicationRequestリソース（処方オーダの１処方薬情報）プロファイル"

* extension contains JP_eCS_InstitutionNumber named eCS_InstitutionNumber ..1 MS
* extension contains JP_eCS_Department named eCS_Department ..* MS

* ^url = $JP_MedicationRequest_eCS


* ^version = "1"
* ^status = #active
* ^date = "2024-06-24"
* ^publisher = "（一社）日本医療情報学会"
* ^copyright = "（一社）日本医療情報学会. CC BY-ND 4.0"
* ^fhirVersion = #4.0.1


* . ^short = "診療情報として処方オーダの１処方薬情報の格納に使用する"
* . ^definition = "診療情報として処方オーダの１処方薬情報の格納に使用する"
* . ^comment = "このプロファイルは、電子カルテ情報共有サービスに２文書（診療情報提供書、退院時サマリー）に含める処方情報にも用いられる。"

* meta 1..1 MS
* meta.versionId ^short = "バージョン固有の識別子"
* meta.versionId ^definition = "バージョン固有の識別子"
* meta.lastUpdated 1..1 MS
  * insert relative_short_definition("このリソースのデータが最後に作成、更新、複写された日時。最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz　例:2015-02-07T13:28:17.239+09:00")
  * ^comment = "この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。本要素に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。"

* meta.profile 0.. MS
  * insert relative_short_definition("準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_MedicationRequest_eCS　を設定する。")

* meta.tag 0..
  * insert relative_short_definition("電子カルテ情報共有サービスでは、長期保存フラグの設定する場合に使用する。")

* meta.tag 0.. MS
* meta.tag
  * insert relative_short_definition("電子カルテ情報共有サービスでは、サービス側でのデータ取扱いを各種フラグで指定するために使用する。")
* meta.tag  ^slicing.discriminator.type = #value
* meta.tag  ^slicing.discriminator.path = "$this"
* meta.tag  ^slicing.rules = #open
* meta.tag contains lts 0..1 MS

* meta.tag[lts] from $JP_ehrshrs_indication_VS 
* meta.tag[lts] = $JP_ehrshrs_indication_CS#LTS 
  * insert relative_short_definition("電子カルテ情報共有サービスで長期保存フラグの設定する場合に使用する。")
  * system 1..1 MS
    * insert relative_short_definition("固定値 http://jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication　を設定する。" )
  * code 1..1 MS
    * insert relative_short_definition("長期保存フラグ　固定値 LTSを設定する。")


// Patinet、Specimen、オーダ医療機関、は最低限の情報をContainedリソースとして記述する
* contained ^slicing.discriminator.type = #profile
* contained ^slicing.discriminator.path = "$this"
* contained ^slicing.rules = #open
* contained contains 
  /* patient 1..1
    and */
    encounter 0..1
    and requester 0..1
    and order 0..1
//    and patient 0..1 MS

* contained[encounter] only  JP_Encounter
  * insert relative_short_definition("処方情報を作成したときの入院外来受診情報をコンパクトに格納したEncounterリソース")
  * ^comment = "encounter要素から参照される場合には、そのJP_Encounterリソースの実体。JP_Encounterリソースにおける必要最小限の要素だけが含まれればよい。ここで埋め込まれるJP_Encounterリソースでは、Encounter.classにこの情報を記録したときの受診情報（入外区分など）を記述して使用する。"

* contained[requester] only  JP_Practitioner
  * insert relative_short_definition("処方情報を作成したときの作成医療者情報をコンパクトに格納したPractitionerリソース")
  * ^comment = "recorder要素から参照される場合には、そのJP_Practitionerリソースの実体。JP_Practitionerリソースにおける必要最小限の要素だけが含まれればよい。"

* contained[order] only  JP_ServiceRequest
  * insert relative_short_definition("処方オーダ識別番号情報などをコンパクトに格納したServiceRequestリソース")
  * ^comment = "recorder要素から参照される場合には、そのJP_ServiceRequestリソースの実体。JP_ServiceRequestリソースにおける必要最小限の要素だけが含まれればよい。"


* extension[eCS_InstitutionNumber] 0..1 MS
  * insert relative_short_definition("本情報を作成発行した医療機関の識別番号を記述するために使用する拡張「eCS_InstitutionNumber」。
本情報は、ServiceRequestの要素として記述することも可能であるが、その場合もこの拡張で記述することとする。")
  * ^comment = "電子カルテ情報サービス(このリソースが２文書に含まれるケース)では、この拡張による記述は必須。医療機関１０桁番号を示すsystem値は\"http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no\"を使用する。"

* extension[eCS_Department] 0..1 MS
  * insert relative_short_definition("本情報を作成発行した診療科または作成発行者の診療科情報を記述するために使用する拡張「eCS_Department」")
  * ^comment = "電子カルテ情報サービス(このリソースが２文書に含まれるケース)では、この拡張による記述は必須。コード化する場合には、JAMI(SS-MIX2) 診療科コード表のsystem値\"http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment\"を使用する。診療科を記述する場合には、そのコード化の有無に関わらずtext要素による記述は必須。"

* identifier MS // JP_MedicationRequestでは2..*が設定されている。 
  * insert relative_short_definition("このリソース情報の識別ID、および必要であれば処方箋における剤グループ番号、剤グループ内の順序番号などを格納する。")
  * ^comment = "リソース一意識別IDの仕様は、「診療情報・サマリー汎用リソース一意識別ID仕様」を参照のこと。"

//* identifier contains requestIdentifier 1..1 MS // 上位Profileで定義済み
* identifier[requestIdentifier].system ^comment = "リソース一意識別IDのsystem値は\"http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier\"　を設定する。"
* identifier[requestIdentifier].value 1..1 MS
  * insert relative_short_definition("「リソース一意識別ID」の文字列。URI形式を使う場合には、urn:ietf:rfc:3986に準拠すること。")


* status = #completed
* intent = #order

// * category 薬剤使用区分（外来、院内、院外などの区分）上位Profileで定義済み
* obeys needs-anyOfStandardCode-medication

* medication[x] ^short = "医薬品コードと医薬品名称。ひとつの 必須のtext 要素と、複数の coding 要素を記述できる。"
* medication[x] ^definition = "本仕様では、処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ず text 要素に格納した上で、coding要素を繰り返すことでHOT9やYJコードなど複数のコード体系で医薬品コードを並記することが可能。coding要素を繰り返すことで複数のコード体系で医薬品コード並記することが可能。\r\n本Profile仕様では、処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。使用できるコード体系は電子カルテ情報共有サービスに利用される場合には、個別医薬品コード（通称YJコード）または厚生労働省一般名処方用医薬品コードのどちらかを必須とする。それ以外のコード体系も追加で記述して構わない。"
// YJ, 一般処方用コードを必須、または未コードとするチェックはInvariant R3010 で行う。
* medication[x] MS
* medication[x].coding ^slicing.discriminator.type = #value
* medication[x].coding ^slicing.discriminator.path = "system"
* medication[x].coding ^slicing.rules = #open
* medication[x].coding contains
    codingHOT7 0..1 MS and
    codingHOT9 0..1 MS and
    codingYJ 0..1 MS and
//    codingGS1 0..1 MS and
    codingGeneralName 0..1 MS and
    nocoded 0..1

* medication[x].coding[nocoded].system 1.. MS
* medication[x].coding[nocoded].system = $JP_eCS_MedicationCodeNocoded_CS (exactly)
  * insert relative_short_definition("標準医薬品コードがない場合のコード割り当てシステム")
* medication[x].coding[nocoded].code 1.. MS
* medication[x].coding[nocoded].code from $JP_eCS_MedicationCodeNocoded_VS
  * insert relative_short_definition("標準コードが存在しない医薬品を意味するコード　NOCODED")
* medication[x].coding[nocoded].display 1.. MS
  * insert relative_short_definition("標準コードなし")

* medication[x].coding[codingHOT9].system 1.. MS
* medication[x].coding[codingHOT9].system = $JP_MedicationCodeHOT9_CS (exactly)
  * insert relative_short_definition("HOT9コードの識別ID")
* medication[x].coding[codingHOT9].code 1.. MS
* medication[x].coding[codingHOT9].code from $JP_MedicationCodeHOT9_VS
  * insert relative_short_definition("HOT9医薬品コード")
* medication[x].coding[codingHOT9].display 1.. MS
  * insert relative_short_definition("医薬品名称。この名称は使用するコード表において選択したコードに対応する文字列とする。")

* medication[x].coding[codingHOT7].system 1.. MS
* medication[x].coding[codingHOT7].system = $JP_MedicationCodeHOT7_CS (exactly)
  * insert relative_short_definition("HOT7コードの識別ID")
* medication[x].coding[codingHOT7].code 1.. MS
* medication[x].coding[codingHOT7].code from $JP_MedicationCodeHOT7_VS
  * insert relative_short_definition("HOT7医薬品コード\(HOT9の末尾２桁である販社コードが不明の場合に限る\)")
* medication[x].coding[codingHOT7].display 1.. MS
  * insert relative_short_definition("医薬品名称。この名称は使用するコード表において選択したコードに対応する文字列とする。")

/*
* medication[x].coding[codingGS1].system = "urn:oid:2.51.1.1" (exactly)
  * insert relative_short_definition("GS1標準の識別コードを示すsystem値")
* medication[x].coding[codingGS1].system MS
* medication[x].coding[codingGS1].code ^definition = "GS1標準の識別コード。医薬品コードおよび医療材料等コードとして、調剤包装単位（最少包装単位、個別包装単位）14桁のフォーマットで使用する。"
* medication[x].coding[codingGS1].code MS
* medication[x].coding[codingGS1].code  from $JP_MedicationCodeGS1_VS
* medication[x].coding[codingGS1].display 1.. MS
  * insert relative_short_definition("医薬品名称。この名称は使用するコード表において選択したコードに対応する文字列とする。")
*/

* medication[x].coding[codingYJ].system 1.. MS
* medication[x].coding[codingYJ].system = $JP_MedicationCodeYJ_CS (exactly)
  * insert relative_short_definition("YJコードを識別するsystem値")
* medication[x].coding[codingYJ].code 1.. MS
* medication[x].coding[codingYJ].code from $JP_MedicationCodeYJ_VS
* medication[x].coding[codingYJ].display 1.. MS
  * insert relative_short_definition("医薬品名称。この名称は使用するコード表において選択したコードに対応する文字列とする。")

* medication[x].coding[codingGeneralName].system = $JP_MedicationCodeCommon_CS (exactly) // urn:oid:1.2.392.100495.20.1.81
  * insert relative_short_definition("厚生労働省保険局が定める一般処方名マスターコードを識別するcsystem値")
* medication[x].coding[codingGeneralName].system MS
* medication[x].coding[codingGeneralName].code ^definition = "厚生労働省保険局が定める一般処方名マスターコード"
* medication[x].coding[codingGeneralName].code MS
* medication[x].coding[codingGeneralName].code from $JP_MedicationCodeCommon_VS
* medication[x].coding[codingGeneralName].display 1.. MS
  * insert relative_short_definition("医薬品名称。この名称は使用するコード表において選択したコードに対応する文字列とする。")

* medication[x].text 1..1 MS
  * insert relative_short_definition("医薬品名称。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ず設定する。")

// 患者情報
* subject 1..1   MS
* subject only  Reference(JP_Patient_eCS)
  * insert relative_short_definition("患者のFHIRリソース\(JP_Patient_eCSに従うPatientリソース\)への参照。")
  * ^comment = "記述方法は、実装ガイド本文の「リソースへの参照方法（2）　Bundleリソースの別のentryのリソースを参照する方法（fullUrlを用いるリテラル参照） 」に従う。"

* encounter 0..1 MS
* encounter only  Reference(JP_Encounter_eCS)
  * insert relative_short_definition("処方を発行したときの受診情報（入外区分など）を記述しているEncounterリソースへの参照")
  * ^comment = "記述方法は、実装ガイド本文の「リソースへの参照方法　(1)」のいずれかを使用すること。"

* requester 0.. MS
* requester only Reference(JP_Practitioner)
* requester ^short = "処方者"
* requester ^definition = "処方者を表すPractitionerリソース（Containedリソース）への参照"
  * ^comment = "記述方法は、実装ガイド本文の「リソースへの参照方法　(1)」のいずれかを使用すること。"

* authoredOn 1..1 MS

* basedOn 0..1   MS
* basedOn ^short = "処方オーダ情報"
* basedOn only Reference(JP_ServiceRequest)
* basedOn ^definition = "処方オーダ番号等の一意識別子を含むServiceRequestリソース（Containedリソース）への参照処方オーダ番号等の一意識別子を含むServiceRequestリソース（Containedリソース）への参照"
* basedOn ^comment = "元のオーダID情報や処方依頼に関する情報（処方者の所属や診療科など）が記述されるContainedリソースに含まれるServiceRequest（処方オーダー情報）リソースをこのリソース内で参照する。記述方法は、実装ガイド本文の「リソースへの参照方法　(1)」のいずれかを使用すること。"

* note ..1 MS
* note ^comment = "単一の薬剤に対する調剤者に対する指示は、本要素ではなく、MedicationRequestリソースのdispenseRequest要素に対して本文書で定義した拡張「InstructionForDispense」（http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense）を使用する。\r\n患者に対する補足指示や注意や、不均等投与指示などは、 MedicationRequestリソースのdosageInstruction.additionalInstructionで記述する。\r\n本要素は、それらでは伝えられない薬剤単位の備考や指示を記述する。"

* note.text ^definition = "備考文字列。markdown 記法により記述できる。"
* note.text ^comment = "例）”4月1日から4日間服用。2週間休薬後、4月19日から4日間服用。患者に書面にて説明済み。”"
* note.text MS

* dosageInstruction only JP_MedicationDosage_eCS

* dispenseRequest 0..1 MS
* dispenseRequest ^definition = "調剤情報。\r\n薬剤オーダー(MedicationRequest, Medication Prescription, Medication Orderなどとしても表現される）や薬剤オーダーとの一部としての薬剤の払い出しあるいは提供。この情報はオーダーとしてかならず伝えられるというわけではないことに注意。薬剤部門で調剤・払い出しを完了するための施設（たとえば病院）やシステムでのサポートに関する設定をしてもよい。"
* dispenseRequest.extension ^slicing.discriminator.type = #value
* dispenseRequest.extension ^slicing.discriminator.path = "url"
* dispenseRequest.extension ^slicing.rules = #open
* dispenseRequest.extension[expectedRepeatCount] MS
* dispenseRequest.quantity.value ^definition = "調剤量。精度を含めた値が暗示される。\r\n例）１日３錠で７日分の場合、この要素には21 が設定される。"
* dispenseRequest.quantity.value MS
* dispenseRequest.quantity.system ^definition = "医薬品単位略号を識別するURL。urn:oid:1.2.392.200119.4.403.1で固定される。\r\n厚生労働省電子処方箋 CDA 記述仕様　別表２０ 医薬品単位略号　コード表を準用。拡張可能性あり。"
* dispenseRequest.quantity.system ^comment = "医薬品単位略号はひとつのリソース記述のなかで１種類のコード体系に統一すること。"
* dispenseRequest.quantity.system MS
* dispenseRequest.quantity.code ^comment = "厚生労働省電子処方箋 CDA 記述仕様　別表２０ 医薬品単位略号　コード表を準用。拡張可能性あり。"
* dispenseRequest.quantity.code ^requirements = "どのような形式であっても医薬品単位略号はひとつのリソース記述のなかで１種類のコード体系に統一すること。"
* dispenseRequest.quantity.code MS
* dispenseRequest.expectedSupplyDuration.value ^definition = "調剤日数。\r\n例）１日３錠で７日分の場合、この要素には 7が設定される。"
* dispenseRequest.expectedSupplyDuration.value MS
* dispenseRequest.performer 
  * ^comment = "当面、診療６情報・サマリー用ではこの情報を記録しないが、記録する場合には display子要素だけとし、別のリソースへの参照をしない。" 

* substitution.allowedCodeableConcept MS
* substitution.allowedCodeableConcept.coding.system ^definition = "後発品変更不可コードを識別するURI。固定値。\r\n厚生労働省電子処方箋CDA規格第１版　別表８ 後発品変更不可コード 　OID: 1.2.392.100495.20.2.41"
* substitution.allowedCodeableConcept.coding.system MS
* substitution.allowedCodeableConcept.coding.code ^definition = "後発品変更不可コード。\r\n不可の場合には1を設定する。\r\n厚生労働省電子処方箋CDA規格第１版　別表８ 後発品変更不可コード 　\r\n0 変更可　（省略可）\r\n1 後発品変更不可\r\n2 剤形変更不可\r\n3 含量規格変更不可"
* substitution.allowedCodeableConcept.coding.code MS
* substitution.allowedCodeableConcept.coding.display ^definition = "後発品変更不可コード表示名。\r\n0 変更可\r\n1 後発品変更不可\r\n2 剤形変更不可\r\n3 含量規格変更不可"
* substitution.allowedCodeableConcept.coding.display MS
* substitution.reason ^definition = "オーダー情報では、後発品変更不可の理由。"
* substitution.reason MS
* substitution.reason.text ^definition = "理由を表す文字列。\r\n例）　\"患者からの強い要望により\""
* substitution.reason.text MS

