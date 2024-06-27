// Patientリース
// JP_Patient
// 000mn_ExampleJPPatient(ARGinstancename)
// 001mn_Description(ARGtxt)
// 002or_ValidationProfile(ARGmetaprofile)
// 002or_ValidationProfile_JPPatient()
// 0E1or_患者宗教(ARGcode)
// 0E1or_患者生誕地住所TEXT(ARGtext)
// 0E1or_患者人種(ARGcode)
// 010mn_患者ID(ARG)
// 020on_患者アクティブ
// 030on_患者漢字氏名(ARGfirstname,ARGgivenname)
// 030on_患者カナ氏名(ARGfirstnamekana,ARGgivennamekana)
// 040or_患者電話番号(ARG)
// 040or_患者自宅電話番号(ARG)
// 040or_患者携帯番号(ARG)
// 040or_患者職場電話番号(ARG)
// 050on_患者性別(ARG)
// 060on_患者生年月日(ARG)
// 070on_患者死亡()
// 070on_死亡日時(ARG)
// 080or_患者住所(ARGpostal,ARGtext)
// 080or_患者職場住所(ARGpostal,ARGtext)
// 080or_患者構造化住所(ARGpostal,ARGtext,ARGstate,ARGcity,ARGline)
// 080or_患者自宅構造化住所(ARGpostal,ARGtext,ARGstate,ARGcity,ARGline)
// 080or_患者職場構造化住所(ARGpostal,ARGtext,ARGstate,ARGcity,ARGline)

Instance: jppatientExample01Inline
InstanceOf: JP_Patient_eCS
Usage: #inline

Description: "JPPatient患者　例"


* meta.lastUpdated = "2021-11-26T10:00:00+09:00"
* meta.profile[+] = $JP_Patient_eCS

* identifier[+].system = "urn:oid:1.2.392.100495.20.3.51.11318814790"
* identifier[=].value = "000999739"
* identifier[+].system = $JP_Insurance_memberID
* identifier[=].value = "00012345:あいう:１８７:05"
//* identifier[=].value = "50012:あいう:123:05"
//* identifier[=].value = "00012345::１８７:05"
//* identifier[=].value = "00012345:あいう::05"
//* identifier[=].value = "00012345:あいう:１８７:1"
* active = true

* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "牧野 爛漫"
* name[=].family = "牧野"
* name[=].given = "爛漫"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "マキノ ランマン"
* name[=].family = "マキノ"
* name[=].given = "ランマン"
* telecom.system = #phone
* telecom.value = "03-123-1234"
* telecom.use = #home
* telecom.rank = 1
* gender = #female
* birthDate = "1930-06-28"
* address.text = "高知県高知市五台山4200-6"
* address.postalCode = "781-8125"
* address.city = "高知市"
* address.state = "高知県"
* contact.telecom.system = #phone
* contact.telecom.value = "03-0123-4545   99991"
* contact.telecom.use = #work
* contact.telecom.rank = 2