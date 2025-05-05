import 'package:flutter/material.dart';

class DischargePatientScreen extends StatefulWidget {
  const DischargePatientScreen({super.key});

  @override
  State<DischargePatientScreen> createState() => _DischargePatientScreenState();
}

class _DischargePatientScreenState extends State<DischargePatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Discharge Patients Screen"),
      ),
    );
  }
}
