import 'package:flutter/material.dart';
import 'package:hospital_management_system/data/admit_patient_data.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';
import 'package:hospital_management_system/widgets/customized_drop_down.dart';

class FilterByDepartmentScreen extends StatefulWidget {
  const FilterByDepartmentScreen({super.key});

  @override
  State<FilterByDepartmentScreen> createState() => _FilterByDepartmentScreenState();
}

class _FilterByDepartmentScreenState extends State<FilterByDepartmentScreen> {

  String dept = "Cardiology";

  List<Map<String, String>> viewList = [];

  List<String> departments = [
    "Cardiology",
    "Neurology",
    "Orthopedics",
    "ENT",
    "Nephrology"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeDepartment(dept);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBox(data: "Select Department"),
                vSpace(8),
                CustomDropdown(items: departments, value: departments.first, onChanged: (selectedDept){
                  dept=selectedDept!;
                  changeDepartment(dept);
                  },),
                vSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
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
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewList.length,
                    itemBuilder: (_,index){
                      var data = viewList;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
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
                            flex: 2,
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
                        ],
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  void changeDepartment(String setDept){
    viewList.clear();
    for(int i=0; i<AdmitPatientData.admittedPatientsDb.length; i++){
      if(setDept==AdmitPatientData.admittedPatientsDb[i]["department"].toString()){
        viewList.add(AdmitPatientData.admittedPatientsDb[i]);
      }
    }
    setState(() {

    });
  }

}
