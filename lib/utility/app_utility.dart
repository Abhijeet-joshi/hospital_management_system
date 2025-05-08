import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/data/admit_patient_data.dart';

import '../widgets/app_widgets.dart';

class AppUtility{
  String generatePatientID(){
    String idNumber =  DateTime.now().microsecondsSinceEpoch.toString().replaceRange(0, 9, "");
    return "PAT_$idNumber";
  }

  Future<void> patientDetailsDialog(BuildContext context, Map<String, String> db) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(15),
          insetPadding: EdgeInsets.all(0),
          titlePadding: EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.white,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            color: Colors.red,
            child: textBox(data: "Patient Data", setTextColor: Colors.white, setFontSize: 18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              patientInfoCard(title: "Patient ID : ", data: db["id"].toString()),
              patientInfoCard(title: "Patient Name : ", data: db["name"].toString()),
              patientInfoCard(title: "Patient Age : ", data: db["age"].toString()),
              patientInfoCard(title: "Patient Department : ", data: db["department"].toString()),
              patientInfoCard(title: "Patient Type : ", data: db["type"].toString()),
              patientInfoCard(title: "Admit Date : ", data: db["admit-date"].toString()),
              patientInfoCard(title: "Discharge Date : ", data: db["discharge-date"].toString()),
              patientInfoCard(title: "Days Admit : ", data: db["days-admit"].toString()),
              patientInfoCard(title: "Per Day Charge : ", data: "Rs. 550"),
              patientInfoCard(title: "Bill Amount : ", data: "Rs. ${db["bill-amount"].toString()}"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
            ),
          ],
        );
      },
    );
  }

  int getIndoorPatients(){
    int count=0;
    for(int i=0; i<AdmitPatientData.admittedPatientsDb.length; i++){
      if(AdmitPatientData.admittedPatientsDb[i]["type"]=="Indoor"){
        count++;
      }
    }
    return count;
  }

  int getOutdoorPatients(){
    int count=0;
    for(int i=0; i<AdmitPatientData.admittedPatientsDb.length; i++){
      if(AdmitPatientData.admittedPatientsDb[i]["type"]=="Outdoor"){
        count++;
      }
    }
    return count;
  }

  int getEmergencyPatients(){
    int count=0;
    for(int i=0; i<AdmitPatientData.admittedPatientsDb.length; i++){
      if(AdmitPatientData.admittedPatientsDb[i]["type"]=="Emergency"){
        count++;
      }
    }
    return count;
  }

  int getRandomDays(){
    int min=3;
    int max=7;
    Random random = Random();
    int randomNumber = random.nextInt(max - min + 1) + min;
    return randomNumber;
  }

  double generateBill(int days){
    return days*550;
  }

}