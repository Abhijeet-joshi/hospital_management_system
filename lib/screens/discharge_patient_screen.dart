import 'package:flutter/material.dart';
import 'package:hospital_management_system/constants/image_urls.dart';
import 'package:hospital_management_system/data/admit_patient_data.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';
import 'package:hospital_management_system/widgets/customized_drop_down.dart';

import '../data/discharged_patient_data.dart';

class DischargePatientScreen extends StatefulWidget {
  const DischargePatientScreen({super.key});

  @override
  State<DischargePatientScreen> createState() => _DischargePatientScreenState();
}

class _DischargePatientScreenState extends State<DischargePatientScreen> {

  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var data = AdmitPatientData.admittedPatientsDb;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset(ImageUrls.dischargeIcon, height: 100, width: 100,)),
        vSpace(20),
        customizedTextField(fieldCtrl: idController, hintText: "Enter patient ID"),
        vSpace(10),
        ElevatedButton(onPressed: (){

          if(idController.text.isNotEmpty){
            bool idFound = false;
            var id = idController.text.toString();
            for(int i=0; i<data.length; i++){
              if(id==data[i]["id"].toString()){
                idFound=true;
                setState(() {
                  DischargedPatientData.dischargedPatientsDb.add(data[i]);
                  AdmitPatientData.admittedPatientsDb.remove(data[i]);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Patient - $id Discharged Successfully")));
                idController.clear();
                break;
              }
            }

            if(idFound==false){
              //then search in discharged db
              bool dataInDischargeDb = false;
              for(int i=0; i<DischargedPatientData.dischargedPatientsDb.length; i++){
                if(id==DischargedPatientData.dischargedPatientsDb[i]["id"].toString()){
                  idFound=true;//found in discharged db
                  dataInDischargeDb=true;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Patient - $id Already Discharged !!")));
                  idController.clear();
                  break;
                }
              }
              if(dataInDischargeDb==false){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Patient - $id does not exist")));
              }

            }
          }

        }, style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ), child: const Text("Discharge Patient"),),
      ],
    );
  }
}
