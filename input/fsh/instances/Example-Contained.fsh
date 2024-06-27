//--------

Instance: Example-Patient-minimun
InstanceOf: JP_Patient
Usage: #example
Description: "埋め込み　患者情報最小限 サンプル"


// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　患者情報最小限 サンプル</p> </div>"

//* meta.profile[+] = $JP_Patient_eCS
* id = "Example-Patient-minimun"

* identifier[+].system = $JP_Hospital_PatientID
* identifier[=].value = "000999739"
//---
* identifier[+].system = "http://jpfhir.jp/fhir/clins/Idsysmem/JP_Insurance_memberID"
* identifier[=].value = "00012345:あいう:１８７:05"

//-------- 埋め込み　患者情報01
Instance: Example-JP-Patient-eCS-01-Contained
InstanceOf: JP_Patient
Usage: #example
Description: "埋め込み　患者情報01 サンプル"


// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　患者情報01 サンプル</p> </div>"

* meta.profile[+] = $JP_Patient

* id = "Patient1"

* identifier[+].system = "urn:oid:1.2.392.100495.20.3.51.11234567890"
* identifier[=].value = "826739"
* identifier[+].system = "http://jpfhir.jp/fhir/clins/Idsysmem/JP_Insurance_memberID"
* identifier[=].value = "00012345:あいう:３８７４７６:01"
* name[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension[=].valueCode = #IDE
* name[=].text = "田中 太郎"
* name[=].family = "田中"
* name[=].given = "太郎"

* gender = #male
* birthDate = "1955-05-04"

//-------- 埋め込み　患者情報02
Instance: Example-JP-Patient-eCS-02-Contained
InstanceOf: JP_Patient
Usage: #example
Description: "埋め込み　患者情報02 サンプル"
// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　患者情報02 サンプル</p> </div>"


* meta.profile[+] = $JP_Patient

* id = "Patient2"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.51.11234567890"
* identifier[=].value = "989"
* identifier[+].system = "http://jpfhir.jp/fhir/clins/Idsysmem/JP_Insurance_memberID"
* identifier[=].value = "00012345:あいう:3294837:05"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "田中 太郎"
* name[=].family = "田中"
* name[=].given = "太郎"

* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "タナカ タロウ"
* name[=].family = "タナカ"
* name[=].given = "タロウ"

* gender = #male
* birthDate = "1955-05-04"

//-------- 埋め込み　外来受診01
Instance: Example_JP_Encounter_AMB
InstanceOf: JP_Encounter
Usage: #example
Description: "埋め込み　外来受診01 サンプル"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　外来受診01 サンプル</p> </div>"

* id = "Example-JP-Encounter-AMB"
* identifier.system = $JP_ResourceInstanceIdentifier
* identifier.value = "192844"
* status = #finished

* class.system = $v3-ActCode
* class.code = #AMB
* class.display = "外来"

//-------- 埋め込み　入院01
Instance: Example_JP_Encounter_IMP
InstanceOf: JP_Encounter
Usage: #example
Description: "埋め込み　入院01 サンプル"


// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　入院01 サンプル</p> </div>"


* id = "Example-JP-Encounter-IMP"
* status = #finished
* class = $v3-ActCode#IMP "入院中"
* period.start = "2021-07-05"

//-------- 埋め込み　医療者R001
Instance: Example_Practitioner_minimun_R001
InstanceOf: JP_Practitioner
Usage: #example
Description: "埋め込み　医療者R001 サンプル"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　医療者R001 サンプル</p> </div>"


* id = "Example-Practitioner-minimun-R001"
* name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name.extension.valueCode = #IDE
* name.text = "医学 一郎"

//-------- 埋め込み　医療者D001
Instance: Example_Practitioner_minimun_D001
InstanceOf: JP_Practitioner
Usage: #example
Description: "埋め込み　医療者D001 サンプル"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　医療者D001 サンプル</p> </div>"


* id = "Example-Practitioner-minimun-D001"
* name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name.extension.valueCode = #IDE
* name.text = "医療 太郎"

//-------- 埋め込み　医療者D002
Instance: Example_Practitioner_minimun_D002
InstanceOf: JP_Practitioner
Usage: #example
Description: "埋め込み　医療者D002 サンプル"
// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　医療者D002 サンプル</p> </div>"


* id = "Example-Practitioner-minimun-D002"
* name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name.extension.valueCode = #IDE
* name.text = "田中 宏"

//-------- 埋め込み　医療者D003
Instance: Example_Practitioner_minimun_D003
InstanceOf: JP_Practitioner
Usage: #example
Description: "埋め込み　医療者D003 サンプル"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　医療者D003 サンプル</p> </div>"

* id = "Example-Practitioner-minimun-D003"
* name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name.extension.valueCode = #IDE
* name.text = "診療 和子"



//----  埋め込み　検体検査材料　血清
Instance: Example_LaboMaterial_Serum
InstanceOf: JP_Specimen
Usage: #example
Description: "埋め込み　検体検査材料　血清"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　検体検査材料　血清</p> </div>"

//* meta.profile[+] = $JP_Patient_eCS
* id = "Example-LaboMaterial-Serum"

* type.coding[+] = $JP_ObservationSampleMaterialCode_CS#023  "血清"
* type.coding[+] = http://terminology.hl7.org/CodeSystem/v2-0487#SER "Serum"
* type.text = "血清"

//----  埋め込み　検体検査材料　尿（その他を含む）
Instance: Example_LaboMaterial_Urine
InstanceOf: JP_Specimen
Usage: #example
Description: "埋め込み　検体検査材料　尿(含むその他)"

// * text.status = #additional
// * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> <p>埋め込み　検体検査材料　尿(含むその他)</p> </div>"

//* meta.profile[+] = $JP_Patient_eCS
* id = "Example-LaboMaterial-Urine"

* type.coding[+] = $JP_ObservationSampleMaterialCode_CS#001  "尿(含むその他)"
* type.coding[+] = http://terminology.hl7.org/CodeSystem/v2-0487#UR	"Urine"
* type.text = "尿"

