
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class secondpage extends StatelessWidget {
  const secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        color: Color(0xffF4F6F5),
        child: Column(
          children: [
            Container(


              child: Stack(
                children: [
                  Image.asset("assets/logo/image1.png"),
                    Container(
                      padding: EdgeInsets.only(top: 72.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/logo/logo1.svg',width: 33.w,height: 32.h),
                          SizedBox(width: 11.w),

                          Center(child: Text("Self Care",style: GoogleFonts.lato( fontSize: 20.sp,fontWeight: FontWeight.w600,color: Color(0xffF4F6F5)))),

                        ],
                      ),
                    ),
      ]
                  ),




              ),

        Container(width:362.w,child: Text("Manage Your Health and Happy Future",style: GoogleFonts.lato(fontSize: 28.sp,fontWeight: FontWeight.w700,),textAlign: TextAlign.center),),
        SizedBox(height: 30.h),
            ElevatedButton(onPressed: (){Navigator.pushNamed(context, '3');}, child: Text("Get Started",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w900),),style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff66CA98),
              shape: StadiumBorder(),
              shadowColor: Colors.black12,
              fixedSize: Size(160.w, 40.h)

            ),),





          ],
        ),
      )
    );
  }
}


