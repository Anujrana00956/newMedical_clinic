import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SplashService.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  SplashService Splash = SplashService();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Splash.Splash(context);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 200.h,bottom: 98.h),
      color: Color(0xffF4F6F5),

child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Center(child: Text("Self Care",style: GoogleFonts.lato( fontSize: 28.sp,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)))),
    SizedBox(height: 32.h,),
    SvgPicture.asset('assets/logo/logo.svg'),
    Spacer(),

    Text("Loading...",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xffCDCFCE)))
  ],

),


    ),
    );
  }
}




