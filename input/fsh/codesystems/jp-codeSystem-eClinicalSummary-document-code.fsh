// 医療文書コード（Loinc系）
CodeSystem: Loinc_subset_forDocumentCode
Id: jp-codeSystem-eCS-document-code
Title: "Loincコードのサブセットコード"
Description: "Loincコードのサブセットコード"
* ^url = "http://loinc.org"
* ^title = "Loincコードのサブセットコード"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* ^date = "2023-04-01T00:00:00+09:00"
* ^version = "5.11"

* #18748-4 "Diagnostic imaging study"
* #11506-3 "Progress note"

// 医療文書区分コード
CodeSystem:  JP_codeSystem_documentTypeCode
Id:   jp-codeSystem-documentTypeCode
Description: "FHIR文書の文書区分（医療文書全般）"
* ^url = "http://jpfhir.jp/fhir/Common/CodeSystem/doc-typecodes"
// * ^valueSet = "http://jpfhir.jp/fhir/Common/ValueSet/doc-typecodes"
* ^title = "FHIR文書の文書区分（医療文書全般）"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #JPGCHKUP01 "健診結果報告書"
//* #JPMCHKUP01 "自治体検診結果報告書"
* #18842-5 "退院時サマリー"
* #57133-1 "診療情報提供書"
* #57833-6 "処方箋"