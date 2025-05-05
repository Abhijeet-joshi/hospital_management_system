import 'package:flutter/material.dart';

class AllDischargedPatientsScreen extends StatefulWidget {
  const AllDischargedPatientsScreen({super.key});

  @override
  State<AllDischargedPatientsScreen> createState() => _AllDischargedPatientsScreenState();
}

class _AllDischargedPatientsScreenState extends State<AllDischargedPatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("All Discharged Patients Screen"),
      ),
    );
  }
}
