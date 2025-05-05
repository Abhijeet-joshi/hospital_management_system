import 'dart:ui';

import 'package:flutter/material.dart';

Widget textBox(
    {required String data,
    Color setTextColor = Colors.black,
    FontWeight setFontWeight = FontWeight.normal,
    TextDecoration setDecoration = TextDecoration.none,
    bool isSelectable = false,
    double setFontSize = 16}) {

  return isSelectable ? SelectableText(
  data,
  style: TextStyle(
    color: setTextColor,
    fontWeight: setFontWeight,
    fontSize: setFontSize,
    decoration: setDecoration,
  ),
  ) : Text(
    data,
    style: TextStyle(
      color: setTextColor,
      fontWeight: setFontWeight,
      fontSize: setFontSize,
      decoration: setDecoration,
    ),
  );
}

Widget statusBox(
    {required Widget titleWidget,
    required Widget dataWidget,
    Color defaultBoxColor = Colors.yellow}){
  return Container(
    padding: const EdgeInsets.all(8),
    width: 300,
    decoration: BoxDecoration(
      color: defaultBoxColor,
      borderRadius: const BorderRadius.all(Radius.circular(11)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget,
        dataWidget,
      ],
    ),
  );
}

Widget hSpace(double space){
  return SizedBox(width: space);
}

Widget vSpace(double space){
  return SizedBox(height: space);
}

Widget appointmentCard({required String patName, required String dctName, required String appFor}){
  return Container(
    width: 600,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(11)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appointmentRow(title: "Patient Name", data: patName),
            appointmentRow(title: "Doctor's Name", data: dctName),
          ],
        ),
        appointmentRow(title: "Appointment for", data: appFor),
        vSpace(10),
        Container(width: double.infinity, height: 1, color: Colors.black,),
        vSpace(10),
      ],
    ),
  );
}

Widget patientInfoCard({required String title, required String data}){
  return Container(
    width: 600,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(11)),
    ),
    child: appointmentRow(title: title, data: data),
  );
}

Widget appointmentRow({required String title, required String data}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      textBox(data: title, setFontWeight: FontWeight.w500),
      hSpace(10),
      textBox(data: data),
    ],
  );
}

Widget customizedTextField({
  double defaultFieldWidth = 400,
  required TextEditingController fieldCtrl,
  required String hintText,
  Function(String)? onEnterPress,
}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      width: defaultFieldWidth,
      child: TextField(
        onSubmitted: onEnterPress,
        controller: fieldCtrl,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            contentPadding: const EdgeInsets.all(10),
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )
        ),
      ),
    ),
  );
}
