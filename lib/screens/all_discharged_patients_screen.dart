import 'package:flutter/material.dart';
import 'package:hospital_management_system/data/admit_patient_data.dart';
import 'package:hospital_management_system/data/discharged_patient_data.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';

import '../utility/app_utility.dart';

class AllDischargedPatientsScreen extends StatefulWidget {
  const AllDischargedPatientsScreen({super.key});

  @override
  State<AllDischargedPatientsScreen> createState() => _AllDischargedPatientsScreenState();
}

class _AllDischargedPatientsScreenState extends State<AllDischargedPatientsScreen> {

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
              Center(child: textBox(data: "Discharged Patients", setFontSize: 25, setTextColor: Colors.black)),
              vSpace(10),
              Align(
                  alignment: Alignment.centerRight,
                  child: customizedTextField(
                    fieldCtrl: searchController,
                    hintText: "Enter patient name/id",
                    onEnterPress: (value){
                      if(value.isNotEmpty){
                        bool dataFound = false;
                        for(int i=0; i<DischargedPatientData.dischargedPatientsDb.length; i++){
                          if(value==DischargedPatientData.dischargedPatientsDb[i]["id"] || value==DischargedPatientData.dischargedPatientsDb[i]["name"]){
                            dataFound = true;
                            //show alert
                            AppUtility().patientDetailsDialog(context, DischargedPatientData.dischargedPatientsDb[i]);
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
                      child: textBox(data: "Patient ID", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
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
                    flex: 1,
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
                    flex:3,
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
                      child: textBox(data: "Discharge Date", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        border: Border.all(width: 0.5, color: Colors.black,),
                      ),
                      child: textBox(data: "Admit Days", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
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
                      child: textBox(data: "Bill Amount", setFontWeight: FontWeight.w500, setFontSize: 19, setTextColor: Colors.white),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: DischargedPatientData.dischargedPatientsDb.length,
                  itemBuilder: (_,index){
                    var data = DischargedPatientData.dischargedPatientsDb;
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
                            child: textBox(data: data[index]["id"].toString(), isSelectable: true),
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
                            child: textBox(data: data[index]["name"].toString(), isSelectable: true),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: index%2==0 ? Colors.blue.shade50 : Colors.white,
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            child: textBox(data: data[index]["age"].toString()),
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
                            child: textBox(data: data[index]["department"].toString()),
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
                            child: textBox(data: data[index]["type"].toString()),
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
                            child: textBox(data: data[index]["admit-date"].toString()),
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
                            child: textBox(data: data[index]["discharge-date"].toString()),
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
                            child: textBox(data: data[index]["days-admit"].toString()),
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
                            child: textBox(data: "Rs. ${data[index]["bill-amount"].toString()}"),
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
