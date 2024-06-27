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


<a id="top"></a>

# **診療情報提供書HL7FHIR記述仕様第1版 実装ガイド **

## 実装ガイドと仕様書
実装ガイドとは、HL7FHIR（以下、単に「FHIR」という）に準拠して記述するための仕様と、注意点や使用するコードなど、システムを実装するために必要な、技術的情報をまとめたもので、FHIRリソースの構造的な情報やFHIRのベース仕様からの異なっている点などを人が理解し、計算機が機械的に記述されたデータが仕様に準拠し、文法ルールに従っているかを検証（バリデーション）する目的などで利用される。

仕様は、以下のPDF版もあわせて参照すること。
  - 診療情報提供書
    - [診療情報提供書 HL7FHIR 記述仕様(PDF版) v1.2.0-rc1 ] 
  (https://std.jpfhir.jp/stddoc/eReferralFHIR_v120-rc1.pdf)
    - [診療情報提供書 HL7FHIR 記述仕様(PDF版) v1.1.5r ] 
  (https://std.jpfhir.jp/stddoc/eReferralFHIR_v1x.pdf)

  - 退院時サマリー
    - [退院時サマリー HL7FHIR 記述仕様(PDF版) v1.2.0-rc1] (準備中)
    - [退院時サマリー HL7FHIR 記述仕様(PDF版) v1.1.5]
  (https://std.jpfhir.jp/stddoc/eDischargeSummaryFHIR_v1x.pdf)


## 主要なリソースのプロファイルに関する表

### 診療情報提供書、退院時サマリー固有のリソースのプロファイル

<table class="grid">
      <col style="width:20%"/>
      <tbody>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Bundle-eReferral.html" title="StructureDefinition/JP-Bundle-eReferral">JP_Bundle_eReferral</a>
            </td>
            <td>
<p>診療情報提供書 Bundle</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Composition-eReferral.html" title="StructureDefinition/JP-Composition-eReferral">JP_Composition_eReferral</a>
            </td>
            <td>
<p>診療情報提供書情報　Composition</p>
</td>
         </tr>
          <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Bundle-eDischargeSummary.html" title="StructureDefinition/JP-Bundle-eDischargeSummary">JP_Bundle_eDischargeSummary</a>
            </td>
            <td>
<p>退院時サマリー Bundle</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Composition-eDischargeSummary.html" title="StructureDefinition/JP-Composition-eDischargeSummary">JP_Composition_eDischargeSummary</a>
            </td>
            <td>
<p>退院時サマリー Composition</p>
</td>
         </tr>
  </table>
<br>

### 　6情報に該当するリソースと患者リソースのプロファイル

<table>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-AllergyIntolerance-eCS.html" title="StructureDefinition/JP-AllergyIntolerance-eCS">JP_AllergyIntolerance_eCS</a>
            </td>
            <td>
<p>eCS/CLINS AllergyIntoleranceリソース（アレルギー情報／薬剤アレルギー等）</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Condition-eCS.html" title="StructureDefinition/JP-Condition-eCS">JP_Condition_eCS</a>
            </td>
            <td>
<p>eCS/CLINS Conditionリソース（傷病名情報）</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-MedicationRequest-eCS.html" title="StructureDefinition/JP-MedicationRequest-eCS">JP_MedicationRequest_eCS</a>
            </td>
            <td>
<p>eCS/CLINS 診療情報・サマリー汎用 MedicationRequestリソース（処方オーダの１処方薬情報）</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Observation-LabResult-eCS.html" title="StructureDefinition/JP-Observation-LabResult-eCS">JP_Observation_LabResult_eCS</a>
            </td>
            <td>
<p>eCS/CLINS 診療情報・サマリー汎用 Observationリソース（検体検査結果／感染症検体検査結果）</p>
</td>
         </tr>
<tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Patient-eCS.html" title="StructureDefinition/JP-Patient-eCS">JP_Patient_eCS</a>
            </td>
            <td>
<p>eCS/CLINS Patientリソース（患者情報）</p>
</td>
         </tr>
   </table>
<br>
### 　6情報の各リソースに埋め込まれるリソースのプロファイル
* ２文書にも含めることができる。
<table>
<tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Encounter-eCS.html" title="StructureDefinition/JP-Encounter-eCS">JP_Encounter_eCS</a>
            </td>
            <td>
<p>eCS/CLINS Encounterリソース（受診時・入院時等のEncounter情報）</p>
</td>
         </tr>
<tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Practitioner-eCS.html" title="StructureDefinition/JP-Practitioner-eCS">JP_Practitioner_eCS</a>
            </td>
            <td>
<p>eCS/CLINS 診療情報・サマリー汎用 Practitionerリソース（医療者情報）</p>
</td>
         </tr>
                  <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-ServiceRequest.html" title="StructureDefinition/JP-ServiceRequest">JP_ServiceRequest</a>
            </td>
            <td>
<p>オーダー情報　JP-ServiceRequest</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Specimen.html" title="StructureDefinition/JP-Specimen">JP_Specimen</a>
            </td>
            <td>
<p>検査検体情報　JP-Specimen</p>
</td>
         </tr>
</table>
<br>
### ２文書に含めることのできるその他のリソースのプロファイル

  <table>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Coverage-eCS-insurance.html" title="StructureDefinition/JP-Coverage-eCS-insurance">JP_Coverage_eCS_insurance</a>
            </td>
            <td>
<p>保険情報　Coverage</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Coverage-eCS-publicPayment.html" title="StructureDefinition/JP-Coverage-eCS-publicPayment">JP_Coverage_eCS_publicPayment</a>
            </td>
            <td>
<p>公費負担情報　Coverage</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-DocumentReference.html" title="StructureDefinition/JP-DocumentReference">JP_DocumentReference</a>
            </td>
            <td>
<p>参照ドキュメント　DocumentReference</p>
</td>
         </tr>
                  <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Organization-eCS.html" title="StructureDefinition/JP-Organization-eCS">JP_Organization_eCS</a>
            </td>
            <td>
<p>医療機関等の組織・機関情報　Organization</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Organization-eCS-coveragePayer.html" title="StructureDefinition/JP-Organization-eCS-coveragePayer">JP_Organization_eCS_coveragePayer</a>
            </td>
            <td>
<p>保険者または公費の公費受給者　Organization</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Organization-eCS-department.html" title="StructureDefinition/JP-Organization-eCS-department">JP_Organization_eCS_department</a>
            </td>
            <td>
<p>診療科情報　Organization</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-PractitionerRole-eCS-author.html" title="StructureDefinition/JP-PractitionerRole-eCS-author">JP_PractitionerRole_eCS_author</a>
            </td>
            <td>
<p>医療者の資格情報　PractitionerRole</p>
</td>
         </tr>
         <tr>
            <td style="column-width:30%">
               <a href="StructureDefinition-JP-Practitioner-eCSauthor.html" title="StructureDefinition/JP-Practitioner-eCSauthor">JP_Practitioner_eCS_author</a>
            </td>
            <td>
<p>医師情報　JP_Practitioner</p>
</td>
         </tr>
</table>
         
<br><br>
## 仕様策定
令和２年度厚生労働科学特別研究事業「診療情報提供書, 電子処方箋等の電子化医療文書の相互運用性確保のための標準規格の開発研究」研究班 (研究代表：大江和彦（東京大学）)<br>
日本医療情報学会NeXEHRS課題研究会、HL7FHIR 日本実装検討WGでの検討結果を反映している。<br>
https://std.jpfhir.jp/<br>
Authorized by （一社）日本HL7協会 for Ver.1.0<br>
Published and maintaied by （一社）日本医療情報学会 for Ver.1.0<br>

*以下余白*