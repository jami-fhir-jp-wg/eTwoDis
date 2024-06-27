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

# ２文書（診療情報提供書・退院時サマリー） FHIR実装ガイド

## 実装ガイドと仕様書
実装ガイドとは、HL7FHIR（以下、単に「FHIR」という）に準拠して記述するための仕様と、注意点や使用するコードなど、システムを実装するために必要な技術的情報をまとめたもので、FHIRリソースの構造的な情報や、仕様の元となっているFHIR R4.0.1(https://hl7.org/fhir/R4/)、JP-Core（https://jpfhir.jp/fhir/core/）からの異なっている点などを、人が理解するとともに、計算機が記述されたデータの仕様適合性を検証（バリデーション）する目的などで利用される。

2文書の仕様詳細は、以下のPDF版もあわせて参照すること。
  - 診療情報提供書
    - [診療情報提供書 HL7FHIR 記述仕様(PDF版) v1.2.0-rc1 ] 
  (https://std.jpfhir.jp/stddoc/eReferralFHIR_v120rc1.pdf)
    - [診療情報提供書 HL7FHIR 記述仕様(PDF版) v1.1.5r ] 
  (https://std.jpfhir.jp/stddoc/eReferralFHIR_v1x.pdf)

  - 退院時サマリー
    - [退院時サマリー HL7FHIR 記述仕様(PDF版) v1.2.0-rc1] 
    - [退院時サマリー HL7FHIR 記述仕様(PDF版) v1.1.5]
  (https://std.jpfhir.jp/stddoc/eDischargeSummaryFHIR_v120rc1.pdf)


## 主要なリソースのプロファイルに関する表

### 診療情報提供書、退院時サマリー固有のリソースのプロファイル

<table>
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



### 謝辞

 <span style="color: black; font-size: 80%;">本実装ガイドは、以下の研究班の方々の貢献と支援により策定されています。</span>

  - <span style="color: black; font-size: 80%;">令和２年度厚⽣労働科学特別研究事業「診療情報提供書、電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」<a href="https://mhlw-grants.niph.go.jp/project/145722">☞</a></span>
  - <span style="color: black; font-size: 80%;">令和３−４年度同「次世代の医療情報の標準規格への改定等に関する研究」<a href="https://mhlw-grants.niph.go.jp/project/164909">☞</a></span>
  - <span style="color: black; font-size: 80%;">令和4年度〜ムーンショット型研究開発事業「病院を家庭に、家庭で炎症コントロール」分担課題7<a href="https://biomse.t.u-tokyo.ac.jp/moonshot/">☞</a></span>
  - <span style="color: black; font-size: 80%;">令和５年度〜戦略的イノベーション創造プログラム「統合型ヘルスケアシステムの構築」サブテーマD1<a href="https://d1www.sip3.jp/">☞</a></span>
  - <span style="color: black; font-size: 80%;">日本医療情報学会NeXERS課題研究会「FHIR日本実装検討WG」<a href="https://jpfhir.jp/">☞</a></span>
  - <span style="color: black; font-size: 80%;">日本医療情報学会標準策定・維持管理部会<a href="https://www.jami.jp/jamistd/standards-development/">☞</a></span>
  
 <br>

*以下余白*