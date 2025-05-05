import 'package:flutter/material.dart';

class AdmittedPatientsScreen extends StatefulWidget {
  const AdmittedPatientsScreen({super.key});

  @override
  State<AdmittedPatientsScreen> createState() => _AdmittedPatientsScreenState();
}

class _AdmittedPatientsScreenState extends State<AdmittedPatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Admitted Patients Screen"),
      ),
    );
  }
}
