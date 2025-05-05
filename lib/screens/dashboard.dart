import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: navigationDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: Text("Hospital Management System", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
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
                    Column(
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
                    ),
                    hSpace(20),
                    statusBox(
                      defaultBoxColor: Color(0X55ffb8b8),
                      titleWidget: textBox(data: "Discharged Patients", setFontSize: 18, setFontWeight: FontWeight.w500),
                      dataWidget: textBox(data: "132", setFontSize: 43, setFontWeight: FontWeight.w600),
                    ),
                    hSpace(20),
                    Container(
                      width: 1,
                      height: 500,
                      color: Colors.grey,
                    ),
                    hSpace(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textBox(data: "Booked Appointments", setFontSize: 21, setFontWeight: FontWeight.w500),
                        vSpace(20),
                        appointmentCard(patName: "Mahesh Deokar", dctName: "Abhijeet Joshi", appFor: "Headache"),
                        appointmentCard(patName: "Mahesh Deokar", dctName: "Abhijeet Joshi", appFor: "Headache"),
                        appointmentCard(patName: "Mahesh Deokar", dctName: "Abhijeet Joshi", appFor: "Headache"),
                        appointmentCard(patName: "Mahesh Deokar", dctName: "Abhijeet Joshi", appFor: "Headache"),
                        appointmentCard(patName: "Mahesh Deokar", dctName: "Abhijeet Joshi", appFor: "Headache"),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationDrawer(){
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
            tabIndex: -1,
            title: 'Dashboard',
            icon: Icons.dashboard,
            onTap: () {
              changeIndex(-1);
            },
          ),

          drawerItem(
            context,
            tabIndex: 0,
            title: 'Add Patient',
            icon: Icons.add,
            onTap: () {
              changeIndex(0);
            },
          ),
          drawerItem(
            context,
            tabIndex: 1,
            title: 'Discharge Patient',
            icon: Icons.person,
            onTap: () {
              changeIndex(1);
            },
          ),
          drawerItem(
            context,
            tabIndex: 2,
            title: 'Show All Admitted Patients',
            icon: Icons.data_saver_on_rounded,
            onTap: () {
              changeIndex(2);
            },
          ),
          drawerItem(
            context,
            tabIndex: 3,
            title: 'Show All Discharged Patients',
            icon: Icons.people,
            onTap: () {
              changeIndex(3);
            },
          ),
          drawerItem(
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
