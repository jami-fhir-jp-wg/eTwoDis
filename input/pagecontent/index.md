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

<br><br>
## 仕様策定
令和２年度厚生労働科学特別研究事業「診療情報提供書, 電子処方箋等の電子化医療文書の相互運用性確保のための標準規格の開発研究」研究班 (研究代表：大江和彦（東京大学）)<br>
日本医療情報学会NeXEHRS課題研究会、HL7FHIR 日本実装検討WGでの検討結果を反映している。<br>
https://std.jpfhir.jp/<br>
Authorized by （一社）日本HL7協会 for Ver.1.0<br>
Published and maintaied by （一社）日本医療情報学会 for Ver.1.0<br>

*以下余白*