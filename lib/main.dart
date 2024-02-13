


import 'package:flutter/material.dart';
import 'package:medical_clinic_app/Mydetails.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/chat2.dart';
import 'package:medical_clinic_app/firstpage.dart';
import 'package:medical_clinic_app/five.dart';
import 'package:medical_clinic_app/fourthpage.dart';
import 'package:medical_clinic_app/passwordReset.dart';
import 'package:medical_clinic_app/payment.dart';
import 'package:medical_clinic_app/secondpage.dart';
import 'package:medical_clinic_app/seven.dart';
import 'package:medical_clinic_app/six.dart';
import 'package:medical_clinic_app/thirdpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medical_clinic_app/updateEmail.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref=await SharedPreferences.getInstance();

  runApp(ScreenUtilInit(


    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,

    builder:(context,child)=> MaterialApp(
       builder: EasyLoading.init(),
      home: (pref.getString("loggedIn").toString()=="true")?bottom():five(),

debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      routes: {
        '1' :(context) => firstpage(),
        '2' :(context) => secondpage(),
        '3' :(context)=> thirdpage(),
        '4' :(context)=> fourthpage(),
        '5':(context)=>five(),
        '6':(context)=>six(),
        '7':(context)=>seven(),
        '8':(context)=>bottom(),
        '9':(context)=>chat2(),
        '10':(context)=>updateEmail(),
        '11':(context)=>passwordReset(),
        '12':(context)=>mydetails(),
        '13':(context)=>payment(),
  },

    ),
  ));
}
