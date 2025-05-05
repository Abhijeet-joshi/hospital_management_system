import 'package:flutter/material.dart';
import 'package:hospital_management_system/constants/image_urls.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';
import 'package:hospital_management_system/widgets/customized_drop_down.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {

  String dept = "";
  String patType = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();


  List<String> departments = [
    "Cardiology",
    "Neurology",
    "Orthopedics",
    "ENT",
    "Nephrology"
  ];

  List<String> patientType = [
    "Indoor",
    "Outdoor",
    "Emergency"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset(ImageUrls.hospitalIcon, height: 100, width: 100,)),
        vSpace(20),
        customizedTextField(fieldCtrl: nameController, hintText: "Enter patient name"),
        customizedTextField(fieldCtrl: ageController, hintText: "Enter patient age"),
        vSpace(3),
        textBox(data: "Department", setFontWeight: FontWeight.w500),
        vSpace(3),
        CustomDropdown(items: departments, value: departments.first, onChanged: (selectedDept){dept=selectedDept!;},),
        textBox(data: "Patient Type", setFontWeight: FontWeight.w500),
        vSpace(3),
        CustomDropdown(items: patientType, value: patientType.first, onChanged: (selectedDept){patType=selectedDept!;},),
        vSpace(20),
        textBox(data: "Admit Date and Time", setFontWeight: FontWeight.w500),
        textBox(data: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}", setFontWeight: FontWeight.normal),
        vSpace(15),
        ElevatedButton(onPressed: (){}, child: Text("Add Patient"), style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),),
      ],
    );
  }
}
