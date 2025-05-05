import 'package:flutter/material.dart';

class FilterByDepartmentScreen extends StatefulWidget {
  const FilterByDepartmentScreen({super.key});

  @override
  State<FilterByDepartmentScreen> createState() => _FilterByDepartmentScreenState();
}

class _FilterByDepartmentScreenState extends State<FilterByDepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Filter by Department Screen"),
      ),
    );
  }
}
