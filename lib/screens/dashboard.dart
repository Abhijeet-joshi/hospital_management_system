import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
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
            buildDrawerItem(
              context,
              tabIndex: 0,
              title: 'Add Patient',
              icon: Icons.add,
              onTap: () {
                changeIndex(0);
              },
            ),
            buildDrawerItem(
              context,
              tabIndex: 1,
              title: 'Discharge Patient',
              icon: Icons.person,
              onTap: () {
                changeIndex(1);
              },
            ),
            buildDrawerItem(
              context,
              tabIndex: 2,
              title: 'Show All Admitted Patients',
              icon: Icons.data_saver_on_rounded,
              onTap: () {
                changeIndex(2);
              },
            ),
            buildDrawerItem(
              context,
              tabIndex: 3,
              title: 'Show All Discharged Patients',
              icon: Icons.people,
              onTap: () {
                changeIndex(3);
              },
            ),
            buildDrawerItem(
              context,
              tabIndex: 4,
              title: 'Filter by Department',
              icon: Icons.sort,
              onTap: () {
                changeIndex(4);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: Text("Hospital Management System", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
    );
  }

  Widget buildDrawerItem(
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
          borderRadius: BorderRadius.all(Radius.circular(11)),
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
