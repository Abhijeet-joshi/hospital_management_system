import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/add_patient_screen.dart';
import 'package:hospital_management_system/screens/admitted_patients_screen.dart';
import 'package:hospital_management_system/screens/all_discharged_patients_screen.dart';
import 'package:hospital_management_system/screens/dashboard_screen.dart';
import 'package:hospital_management_system/screens/discharge_patient_screen.dart';
import 'package:hospital_management_system/screens/filter_by_department_screen.dart';
import 'package:provider/provider.dart';

import '../providers/screen_provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: navigationDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text("Hospital Management System", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: PageView(
        controller: screenProvider.pageController,
        onPageChanged: (index) {
          // Update the current page in the provider.
          Provider.of<ScreenProvider>(context, listen: false).changePage(index);
        },
        children: const [
          DashboardScreen(),
          AddPatientScreen(),
          DischargePatientScreen(),
          AdmittedPatientsScreen(),
          AllDischargedPatientsScreen(),
          FilterByDepartmentScreen(),
        ],
      ),
    );
  }



  Widget navigationDrawer(){
    final screenProvider = Provider.of<ScreenProvider>(context);
    return Drawer(
      width: 325,
      shape: const RoundedRectangleBorder( // Apply to Drawer
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80, // Reduced the height of the header
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Center(
              child: Text(
                'Hospital Management System',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), // Add some space between header and items

          drawerItem(
            context,
            tabIndex: 0,
            title: 'Dashboard',
            icon: Icons.dashboard,
            onTap: () {
              changeIndex(0);
              Navigator.pop(context);
              screenProvider.jumpToPage(0);
            },
          ),

          drawerItem(
            context,
            tabIndex: 1,
            title: 'Add Patient',
            icon: Icons.add,
            onTap: () {
              changeIndex(1);
              Navigator.pop(context);
              screenProvider.jumpToPage(1);
            },
          ),
          drawerItem(
            context,
            tabIndex: 2,
            title: 'Discharge Patient',
            icon: Icons.person,
            onTap: () {
              changeIndex(2);
              Navigator.pop(context);
              screenProvider.jumpToPage(2);
            },
          ),
          drawerItem(
            context,
            tabIndex: 3,
            title: 'Show All Admitted Patients',
            icon: Icons.data_saver_on_rounded,
            onTap: () {
              changeIndex(3);
              Navigator.pop(context);
              screenProvider.jumpToPage(3);
            },
          ),
          drawerItem(
            context,
            tabIndex: 4,
            title: 'Show All Discharged Patients',
            icon: Icons.people,
            onTap: () {
              changeIndex(4);
              Navigator.pop(context);
              screenProvider.jumpToPage(4);
            },
          ),
          drawerItem(
            context,
            tabIndex: 5,
            title: 'Filter by Department',
            icon: Icons.sort,
            onTap: () {
              changeIndex(5);
              Navigator.pop(context);
              screenProvider.jumpToPage(5);
            },
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
      BuildContext context, {
        required int tabIndex,
        required String title,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex==tabIndex ? Colors.redAccent : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(11)),
        ),
        child: ListTile(
          leading: Icon(icon, color: selectedIndex==tabIndex ? Colors.white : Colors.blueGrey,), //Added color
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, color: selectedIndex==tabIndex ? Colors.white : Colors.blueGrey)), // Reduced font weight
          onTap: onTap,
          shape: const RoundedRectangleBorder( //Added Shape
            borderRadius: BorderRadius.zero,
          ),
          hoverColor: Colors.grey.withOpacity(0.1), // Added hover color for better UX
        ),
      ),
    );
  }

  void changeIndex(int passedIndex){
    setState(() {
      selectedIndex=passedIndex;
    });
  }

}
