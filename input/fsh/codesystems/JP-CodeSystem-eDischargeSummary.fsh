

// 退院時サマリーセクション区分コード
CodeSystem: JP_codeSystem_eDischargeSummary_document_section
Id: jp-codeSystem-eDischargeSummary-document-section
Description: "サマリー情報用セクション区分コード　診療情報用を含む"
* ^url = "http://jpfhir.jp/fhir/eDischargeSummary/CodeSystem/document-section"
* ^title = "サマリー情報用セクション区分コード"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #200	"CDA参照セクション" //  cdaSection
* #210	"添付情報セクション"    //  attachmentSection
* #220	"備考・連絡情報セクション"  //  remarksCommunicatonSection
* #230  "PDFセクション" // pdfSection
* #300	"構造情報セクション"    //  compositionSection
* #312  "入院理由セクション"    // reasonForAdmissionSection
* #322  "入院時詳細セクション"  // detailsOnAdmissionSection
* #324  "退院時詳細セクション"  // diagnosesOnDischargeSection
* #330	"臨床経過セクション"    // clinicalCourseSection
* #333  "入院中経過セクション"  // hospitalCourseSection
* #340	"傷病名・主訴セクション"    //  problemSection
* #342  "入院時診断セクション"  // diagnosesOnAdmissionSection
* #344  "退院時診断セクション"  // diagnosesOnDischargeSection
* #352  "主訴セクション"    //  chiefComplaintsSection
* #360	"現病歴セクション"  //  presentIllnessSection
* #362  "現病歴セクション"  // presentIllnessSection
* #370	"既往歴セクション"  //  pastIllnessSection
* #372  "既往歴セクション"  // pastIllnessSection 入院時既往歴
* #410	"事前指示セクション"    //  advanceDirectiveSection
* #420	"診療方針指示セクション"    //  clinicalInstructionSection
* #424  "退院時方針指示セクション"  // instructionOnDischargeSection
* #430	"投薬指示セクション"    //  medicationSection
* #432  "入院時服薬セクション"  // medicationsOnAdmissionSection
* #444  "退院時投薬指示セクション"  // medicationOnDischargeSection
* #510	"アレルギー・不耐性反応セクション"  //  allergiesIIntoleranceSection
* #520	"感染症情報セクション"  //  infectionInformationSection
* #530	"予防接種歴セクション"  //  immunizationSection
* #550	"家族歴セクション"     //   familiyHistorySection
* #552  "家族歴セクション"  //  familiyHistorySection 入院時情報・退院時サマリー
* #610	"身体所見セクション"    //  physicalStatusSection
* #612  "入院時身体所見セクション"  // physicalStatusOnAdmissionSection
* #614  "退院時身体所見セクション"  // physicalStatusOnDischargeSection
* #620	"検査結果セクション"    //  studySection
* #623  "入院中検査結果セクション"  //  hospitalStudySection
* #640	"社会歴・生活習慣セクション"    //  socialHistorySection
* #642  "社会歴・生活習慣セクション"    // socialHistorySection 入院時情報・退院時サマリー
* #713  "入院中治療セクション"  // hospitalProcedureSection
* #720	"処置セクション"    //  procedureSection
* #730	"手術セクション"    //  surgicalProcedureSection
* #740	"輸血歴セクション"  //  bloodInfustionHistorySection
* #810	"医療機器セクション"    //  medicalDeviceSection
* #830	"臨床研究参加セクション"    //  researchParticipationSection
* #910	"紹介先情報セクション"  //  referralToSection
* #920	"紹介元情報セクション"  //  referralFromSection
* #950	"紹介目的セクション"    //  referralPurposeSection
