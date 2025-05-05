import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/constants/image_urls.dart';
import 'package:hospital_management_system/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ImageUrls imageUrls = ImageUrls();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(ImageUrls.hospitalIcon, height: 100, width: 100,),
      ),
    );
  }
}
