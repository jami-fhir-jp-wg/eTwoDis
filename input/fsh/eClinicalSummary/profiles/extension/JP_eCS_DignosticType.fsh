// -----------------------------------------
//JP_eCS_DiagnosisType
// -----------------------------------------
Extension: JP_eCS_DiagnosisType
Id: jp-ecs-diagnosisType
Title: "JP eCS Disgnostic Type Extension"
Description: "傷病名情報に主たる診療対象病名か、あるいはそれ以外の情報をタイプかを付与する拡張"
* ^url = $JP_eCS_DiagnosisType
* ^status = #active
* ^date = "2024-06-17"
* ^purpose = "傷病名情報に主たる診療対象病名か、あるいはそれ以外の情報をタイプかを付与するため。主病名フラグとして傷病名一覧に表示するためにも使用される。"

* ^context[+].type = #element
* ^context[=].expression = "Condition"

* . ^short = "傷病名情報に主たる診療対象病名か、あるいはそれ以外の情報をタイプかを付与する拡張"
* . ^definition = "主病名フラグとして傷病名一覧に表示するためにも使用される。他にも入院時病名、退院時病名、などカルテ管理的な必要性で付与したいタイプ情報を付与するために使用し、ひとつの傷病名に複数付与できる。"
* . ^comment = "CodeSystem(http://terminology.hl7.org/CodeSystem/ex-diagnosistype)からのValueSet (http://hl7.org/fhir/ValueSet/ex-diagnosistype)を使用する。"

* url = $JP_eCS_DiagnosisType (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "Example Diagnosis Type Codeからコードを設定する。"
* value[x] ^definition = "主病名フラグを立てたい傷病名には、principal を設定する。"
* valueCodeableConcept from $ex-diagnosistype-vs
