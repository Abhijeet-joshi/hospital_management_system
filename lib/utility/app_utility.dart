import 'package:flutter/material.dart';

import '../widgets/app_widgets.dart';

class AppUtility{
  int generatePatientID(){
    return DateTime.now().microsecondsSinceEpoch;
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

}