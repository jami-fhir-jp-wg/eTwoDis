<style type="text/css">

table {
  border: solid 1px black;
  border-collapse: collapse;
}
 
table td {
  border: solid 1px black;

}

table th {
  border: solid 1px black;
}
   h1 {
      counter-reset: chapter;
    }

    h2 {
      counter-reset: sub-chapter;
    }

    h3 {
      counter-reset: section;
    }

    h4 {
      counter-reset: sub-section;
    }

    h5 {
      counter-reset: composite;
    }

    h6 {
      counter-reset: sub-composite;
    }

    h1:before {
      color: black;
      counter-increment: bchapter;
      content:  " ";
    }

    h2:before {
      color: black;
      counter-increment: chapter;
      content: counter(chapter) ". ";
    }

    h3:before {
      color: black;
      counter-increment: sub-chapter;
      content: counter(chapter) "."counter(sub-chapter) ". ";
    }


    h4:before {
      color: black;
      counter-increment: section;
      content: counter(chapter) "."counter(sub-chapter) "."counter(section) " ";
    }

    h5:before {
      color: black;
      counter-increment: sub-section;
      content: counter(chapter) "."counter(sub-chapter) "."counter(section) "."counter(sub-section) " ";
    }

    h6:before {
      color: black;
      counter-increment: sub-sub-section;
      content: "　　"counter(sub-sub-section) "）";
    }

</style>

# 改訂履歴　（新しい順） 診療情報提供書
## 2024.06.23	Ver. 1.2.0-rc1 (リリース候補v1)
  - 電子カルテ情報共有サービス用と汎用診療情報提供書を同一profileで記述するようにprofileを統一。
  - 添付情報セクション、PDFセクションでbinaryリソースへの参照を禁止し、参照はDocumentReferenceリソースへの参照だけできるように改訂。

## 2024.02.29	Ver. 1.1.6
  - 電子カルテ情報共有サービスの6情報仕様と共通するリソースについて、プロファイル記述を共通化（仕様の変更はなし）。

## 2024.02.07	Ver. 1.1.5
  - セクション210 添付情報セクションにBundleリソースも添付可能であることが漏れていたので追記。
  - 表３Bundleリソースに上記に関連してentry要素にBundleリソースが記述可能であることを追記。
  - Organizationの拡張要素による診療科記述を可能とした。
  - Bundle、Compositionのエントリの多重度の記載を修正。
  - 仕様をPDF版（およびそれのHTML版）を参照する記載方式に変更。
  - 電子カルテ情報共有サービスの6情報仕様と共通するリソースについて仕様を6情報仕様を参照する方式に変更。
  - IGpackageのバージョンを仕様のバージョン1.1.5に合わせた。
  

## 2023.05.17	IGpackage 0.9.7
  - 添付情報セクションにBundleリソース添付が可能となった（2023.04.27	Ver.1.1.4）に対応してentryにBundleを追加格納できるように診療情報提供BundleのProfileを修正。

## 2023.05.09	IGpackage 0.9.6 (version変更せず)
  - Compositionリソース定義中のセクションのdisplay要素の値からexactlyを削除して、厳密一致でなくてもよいように変更した。

## 2023.04.27	Ver.1.1.4
  - セクション510 allergiesIIntoleranceSection　→ allergyIntoleranceSection　（スペルミス修正）
  - 表5-1、表5-2も同じ修正。
  - 添付情報セクションのentryにBundleリソースも格納できるように追加。

## 2023.04.27	IGpackage 0.9.5 -> 0.9.6
  - 添付情報セクションのentryの多重度（max）を修正（1から*へ）
  - 臨床経過セクションのentryの多重度（mix）を修正（1から0へ）
  - サンプルインスタンスにlastUpdated要素がないものが多数あったので、lastUpdated要素を追加
  - 添付情報セクションにBundleを追加。

## 2023.04.25	Ver.1.1.3	
  - 4.3　Compositionリソースを構成するセクションの表：　紹介目的セクション、傷病名・主訴セクション、現病歴セクションの必須記載に注意書きを追加。既往歴セクションの必須を任意に修正。
  - 表３ Bundleリソース：　Bundle.signature の説明を補足。
  - 表5.2　紹介目的セクション、傷病名・主訴セクション、現病歴セクション の多重度の最小値を1に修正（この欄は、親の構造情報セクションが存在する場合の記載であるため）。
  - 表18 Observationリソース： meta.profile の説明から固定値の記載を削除し、実際には格納する検査カテゴリに合わせた値を設定する記載を追加。

## 2023.03.21	Ver.1.1.2	  
### JP-Core V1.1/V1.1.1 対応漏れを修正
　- Patientリソース、RelatedPersonリソース　のname.useは"official"だけではなく、"usual"も使用可能とした。
　- Patientリソース、RelatedPersonリソースのname.text の姓と名は全角空白ではなく半角空白1文字で連結する。
##### Bundleリソース、Compositionリソース以外のリソースで、meta.lastUpdated要素を必須として追加。
##### 同じくmeta.profileを必須から任意に変更し説明を補足。
　- Bundle.entry のEncounter の多重度を1..1から0..* に変更。

## 2022.12.10	Ver.1.1	主な箇所に限り記載
### JP-Core V1.1対応
    1.4の各記載を参照
### 説明の改善、記載漏れ箇所の追記（主な箇所）
    - p6 PDFセクション、CDA参照セクションの取扱い
    - p9 文書管理情報（ヘッダ部）受診情報を追記
    - 診療情報提供書本体（ボディー部）のセクションの必須／任意を修正、Cardinalityを修正
    - 4.3　Compositionリソースを構成するセクションにPDFセクションが漏れていたのを追加し、最大セクション総数を4から7に修正
    - p12の表およびp14記載にも追加。
    - 4.4  要素の任意／必須の記載を明記、セクションコードを本文中にも記載
    - 4.4.6.2 CDAセクションの使い方の記載を補足
    - 4.4.6.3 構造化セクションの子セクション要素に格納すべき情報がない場合のComposition.section.emptyReason要素設定をunavailableからnilknownに修正. 情報を取得していない場合は、notasked を設定することを追記
    - 4.4.6.4 厚生労働省の様式（別紙様式11）に即した診療情報提供書との対応表を新たに追加
    - 4.13  不要な入院時服薬情報セクションの説明が挿入されていたのを削除
    - 4.26  備考・連絡情報セクションの説明が脱落していたのを追加

### 本文の誤記修正
    - p5表　臨床経過情報エントリーのリソースタイプ
        - ClinicalImpression → DocumentReference

### リソース表の修正、変更
    - http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier へ変更
        - 表1 AllergyIntolerance
        - 表4 CarePlan
        - 表5-1と5-2 Composition
        - 表6 Condition
        - 表7 Consent
        - 表8 DeviceUseStatement
        - 表9 Device
        - 表10 DiagnosticReport
        - 表12 Encounter
        - 表13 FamilyMemberHistory
        - 表14 ImagingStudy
        - 表15 Immunization
        - 表17 MedicationStatement
        - 表18 Observation
        - 表19 Organization
        - 表25 ResearchStudy
        - 表26 ResearchSubject
    
        の各 identifier （JP-Core V1.1 対応）

    - 表1 AllergyIntolerance.code（JP-Core V1.1 対応）
        - http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS　
        - code要素に使用できるコード表を追記
        - AllergyIntolerance.reaction.substance.code同上
    - 表3 Binaryエントリーの説明にPDFセクションを追加
    - 表4 CarePlan.category
        - http://jpfhir.jp/fhir/core/CodeSystem/care-plan-category
    - 表5-1 
        - Composition.extension.valueString 文書バージョンの例として"1.0" から "1"に修正
        - Composition.type.coding.code退院時サマリーのコードに修正
        - 入院中経過セクションのリソースをClinicalImpressionからDocumentReferenceに修正
        - Composition.authoｒ 診療科も記述できるよう行を追加
        - Composition.event 要素に入院期間を設定することを必須で追加
        - sectionをひとつ追加し、退院時診断セクションを追加
        - 添付情報セクションとPDFセクションの英語セクション名の最初の1文字をを小文字に変更
    - 表5-2
        - Composition.extension.valueString 文書バージョンの例として"1.0" から "1"に修正
        - Composition.type.coding.code 診療情報提供書のコードに修正
        - Composition.authoｒ 診療科も記述できるよう行を追加
        - 臨床経過セクションのリソースをClinicalImpressionからDocumentReferenceに修正
        - アレルギー、家族歴、身体所見、感染症の各セクションのcardinality を1..*から0..*に修正（必須から任意に修正）
        - 備考・連絡情報セクションの記載がもれていたので追加
        - 添付情報セクションとPDFセクションの英語セクション名の最初の1文字をを小文字に変更
    - 表10 DiagnosticReport.meta.profile
        - http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Commonに変更（JP-Core v1.1対応）
    - 表11 DocumentReference.meta.profile  
        - http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_DocumentReference_eCS に修正
        - classHistory.period  cardinlityを1..1から0..1に変更
    - 表14 ImagingStudy.meta.profile
        - http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology に変更（JP-Core v1.1対応）
    - 表16 MedicationRequest.meta.profile
        - http://jpfhir.jp/fhir/ePrescription/StructureDefinition/JP_MedicationRequest_ePrescriptionData　に修正
    - 表16 MedicationRequest.dispenseRequest.quantity.system  urn:oid:1.2.392.100495.20.2.101 に修正
        - MedicationRequest.dosageInstruction.extension.url 
        http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse　に変更（JP-Core v1.1対応）
    - 表16-1 MedicationRequest.dosageInstruction.timing.code.coding.system
        urn:oid:1.2.392.200250.2.2.20 に修正
    - 表17-1 MedicationStatement.dosage.timing.code.coding.system  urn:oid:1.2.392.200250.2.2.20に修正
    - 表18 Observation.meta.profile http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Observation_Common_eCS （JP-Core v1.1対応し、適切な値を使うことを記載）
    - 表19　Organization 医療機関情報
        - Organization.meta.profile  http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Organization_eCS
          に変更（発行元と先でprofileを同じにした）
        - Organization.extension.valueCoding  および同.code修正
        - Organization.type  cardinality を0..1 に修正
        - Organization.telecom.system    cardinality を0..1 に修正
        - Organization.country    cardinality を0..1 に修正
    - 表20  Organization 診療科情報
        - Organization.meta.profile
            - http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Organization_eCS_department に変更（発行元と先でprofileを同じにした）
        - Organization.partOf　cardinalityを0..1に変更
    - 表21　Patient　患者情報
        - Patient.telecom.system    cardinality を0..1 に修正　
        - Patient.telecom.use    cardinality を0..1 に修正
        - Patient.address.postalCode    cardinality を0..1 に修正
    - 表22 Practitioner 文書作成責任者情報／文書法的責任者情報
        - meta.profile http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Practitioner_eCS に変更（発行元と先でprofileを同じにした）
    - 表23 Procedure 入院中治療処置情報
        - Procedure.category カテゴリーのsystem値http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureCategory_CS に変更し、説明を変更（JP-Core v1.1対応）
        - Procedure.code system=http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureCodesMedical_CSに変更し、説明を変更
        - Procedure.bodySite STEM７のsystem値を変    （JP-Core v1.1に対応）
        - Procedure.outcome カテゴリーのsystem値　http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureOutcome_CS　に変更し、説明を変更（JP-Core v1.1対応）


# 改訂履歴　（新しい順）

## 2024.02.29	Ver. 1.1.6
  - BundleのプロファイルをValidation時のエラーに対応するよう記述修正（仕様の変更はなし）。
  - 電子カルテ情報共有サービスの6情報仕様と共通するリソースについて、プロファイル記述を共通化（仕様の変更はなし）。

## 2024.02.12	Ver. 1.1.5
  - 仕様をPDF版（およびそれのHTML版）を参照する記載方式に変更。
  - 電子カルテ情報共有サービスの6情報仕様と共通するリソースについて仕様を6情報仕様を参照する方式に変更。
