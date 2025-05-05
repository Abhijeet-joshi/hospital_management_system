import 'package:flutter/material.dart';

import '../widgets/app_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
          dataWidget: textBox(data: "154", setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
        vSpace(20),
        statusBox(
          defaultBoxColor: Color(0X55b8e994),
          titleWidget: textBox(data: "Indoor patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: "26", setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
        vSpace(20),
        statusBox(
          defaultBoxColor: Color(0X55fffa65),
          titleWidget: textBox(data: "Outdoor patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: "47", setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
        vSpace(20),
        statusBox(
          defaultBoxColor: Color(0X55079992),
          titleWidget: textBox(data: "Emergency patients", setFontSize: 18, setFontWeight: FontWeight.w500),
          dataWidget: textBox(data: "78", setFontSize: 43, setFontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget row2(){
    return statusBox(
      defaultBoxColor: Color(0X55ffb8b8),
      titleWidget: textBox(data: "Discharged Patients", setFontSize: 18, setFontWeight: FontWeight.w500),
      dataWidget: textBox(data: "132", setFontSize: 43, setFontWeight: FontWeight.w600),
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
