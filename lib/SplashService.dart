import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_clinic_app/secondpage.dart';


class SplashService{
  void Splash(BuildContext context){
    Timer.periodic(Duration(seconds: 2), (timer) {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>secondpage()));


    });
  }
}