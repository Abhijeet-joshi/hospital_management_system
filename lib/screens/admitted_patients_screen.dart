import 'package:flutter/material.dart';
import 'package:hospital_management_system/data/admit_patient_data.dart';
import 'package:hospital_management_system/data/discharged_patient_data.dart';
import 'package:hospital_management_system/utility/app_utility.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';

class AdmittedPatientsScreen extends StatefulWidget {
  const AdmittedPatientsScreen({super.key});

  @override
  State<AdmittedPatientsScreen> createState() => _AdmittedPatientsScreenState();
}

class _AdmittedPatientsScreenState extends State<AdmittedPatientsScreen> {

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: textBox(data: "Admitted Patients", setFontSize: 25, setTextColor: Colors.black)),
              vSpace(10),
              Align(
                  alignment: Alignment.centerRight,
                  child: customizedTextField(
                      fieldCtrl: searchController,
                      hintText: "Enter patient name/id",
                      onEnterPress: (value){
                        if(value.isNotEmpty){
                          bool dataFound = false;
                          for(int i=0; i<AdmitPatientData.admittedPatientsDb.length;i++){
                            if(value==AdmitPatientData.admittedPatientsDb[i]["id"] || value==AdmitPatientData.admittedPatientsDb[i]["name"]){
                              dataFound = true;
                              //show alert
                              AppUtility().patientDetailsDialog(context, AdmitPatientData.admittedPatientsDb[i]);
                              break;
                            }
                          }
                          if(dataFound==false){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Patient with reference $value Not Found")));
                          }
                        }


                      },
                  )),
              vSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Patient ID", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white,),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Patient Name", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Age", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Department", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Patient Type", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex:4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Admit Date", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Action", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: AdmitPatientData.admittedPatientsDb.length,
                  itemBuilder: (_,index){
                    var dataSource = AdmitPatientData.admittedPatientsDb;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: dataSource[index]["id"].toString(), isSelectable: true),
                          ),
                        ),
                        Expanded(
                          flex:3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: dataSource[index]["name"].toString(), isSelectable: true),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: dataSource[index]["age"].toString()),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: dataSource[index]["department"].toString()),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: dataSource[index]["type"].toString()),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: dataSource[index]["admit-date"].toString()),
                          ),
                        ),
                        Expanded(
                          flex:3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black,),
                            ),
                            child: InkWell(
                                onTap: (){
                                  setState(() {
                                    int getRandomDays = AppUtility().getRandomDays();
                                    DateTime dischargeDate = DateTime.now().add(Duration(days: getRandomDays));
                                    String dateString = dischargeDate.toString();
                                    //2025-05-11
                                    int year =  int.parse((dateString[0]+dateString[1]+dateString[2]+dateString[3]).toString());
                                    int month =  int.parse((dateString[5]+dateString[6]).toString());
                                    int day =  int.parse((dateString[8]+dateString[9]).toString());
                                    AdmitPatientData.admittedPatientsDb[index]["discharge-date"] = "$day/$month/$year - ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
                                    AdmitPatientData.admittedPatientsDb[index]["days-admit"] = getRandomDays.toString();
                                    AdmitPatientData.admittedPatientsDb[index]["bill-amount"] = AppUtility().generateBill(getRandomDays).toString();
                                    DischargedPatientData.dischargedPatientsDb.add(dataSource[index]);
                                    AdmitPatientData.admittedPatientsDb.remove(dataSource[index]);
                                  });
                                },
                                child: textBox(data: "Discharge Patient", setFontWeight: FontWeight.w500, setTextColor: Colors.red)),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }




}
