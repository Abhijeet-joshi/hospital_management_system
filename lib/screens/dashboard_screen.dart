import 'package:flutter/material.dart';
import 'package:hospital_management_system/data/admit_patient_data.dart';
import 'package:hospital_management_system/data/discharged_patient_data.dart';
import 'package:hospital_management_system/utility/app_utility.dart';


import '../widgets/app_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  AppUtility appUtility = AppUtility();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  row1(),
                  hSpace(20),
                  row2(),
                  hSpace(20),
                  line(),
                  hSpace(20),
                  row3(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget line(){
    return Container(
      width: 1,
      height: 520,
      color: Colors.grey,
    );
  }

  Widget row1(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statusBox(
          defaultBoxColor: Color(0X5582ccdd),
          titleWidget: textBox(data: "Currently Admit Patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: AdmitPatientData.admittedPatientsDb.length.toString(), setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
        vSpace(20),
        statusBox(
          defaultBoxColor: Color(0X55b8e994),
          titleWidget: textBox(data: "Indoor patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: appUtility.getIndoorPatients().toString(), setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
        vSpace(20),
        statusBox(
          defaultBoxColor: Color(0X55fffa65),
          titleWidget: textBox(data: "Outdoor patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: appUtility.getOutdoorPatients().toString(), setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
        vSpace(20),
        statusBox(
          defaultBoxColor: Color(0X55079992),
          titleWidget: textBox(data: "Emergency patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: appUtility.getEmergencyPatients().toString(), setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget row2(){
    return statusBox(
      defaultBoxColor: Color(0X55ffb8b8),
      titleWidget: textBox(data: "Discharged Patients", setFontSize: 18, setFontWeight: FontWeight.w500),
      dataWidget: textBox(data: DischargedPatientData.dischargedPatientsDb.length.toString(), setFontSize: 43, setFontWeight: FontWeight.w600),
    );
  }

  Widget row3(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBox(data: "Booked Appointments", setFontSize: 21, setFontWeight: FontWeight.w500),
        vSpace(20),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
        appointmentCard(patName: "Prateek Singh", dctName: "Abhijeet Joshi", appFor: "Headache"),
      ],
    );
  }
}
