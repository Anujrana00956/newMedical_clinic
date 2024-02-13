import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class thirdpage extends StatefulWidget {
  thirdpage({super.key});

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
bool changecolor=false;
bool changecolorDoctor=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 896.w,
        padding: EdgeInsets.only(top: 68.h,bottom:60.h,left: 22.w,right: 22.w ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/logo/logo.svg',
                height: 32.h,
                width: 33.w,
              ),
              SizedBox(height: 40.h),
              Container(
                child: Text(
                  "Let's get acquainted",
                  style: GoogleFonts.lato(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1F1E)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 13.h),
              Container(
                child: Text(
                    "Pellentesque placerat arcu in risus facilisis, sed laoreet eros laoreet.",
                    style: GoogleFonts.lato(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffA7A6A5),
                    ),
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 62.h),






              InkWell(
                splashColor: Colors.white,
                overlayColor: MaterialStatePropertyAll(Colors.white),
                onTap: (){
                if(changecolor)
                {
                  changecolor=false;
                }
                else{
                  changecolor=true;
                  changecolorDoctor=false;
                }
                setState(() {

                });
              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(color:(changecolor)?Color(0xff66CA98):Color(0xffF4F6F5),borderRadius: BorderRadius.circular(10)),
                      height: 53.h,
                      width: 63.w,
                      child: SvgPicture.asset(
                        'assets/logo/icon.svg', width: 10.w, height: 10.h,color: Colors.black,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("I’m a patient",
                              style: GoogleFonts.lato(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: (changecolor)?Color(0xff66CA98):Color(0xff1C1F1E))),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text("Proin convallis libero ac nisl ",
                              style: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA7A6A5))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
              InkWell(
                splashColor: Colors.white,
                overlayColor: MaterialStatePropertyAll(Colors.white),
                onTap: (){if(changecolorDoctor){
                  changecolorDoctor=false;

                }else{
                  changecolorDoctor=true;
                  changecolor=false;
                }
                setState(() {

                });},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: (changecolorDoctor)?Color(0xff66CA98):Color(0xffF4F6F5),borderRadius: BorderRadius.circular(10)),
                        height: 53.h,
                        width: 63.w,
                        child: SvgPicture.asset(
                          "assets/logo/icon2.svg",
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I’m a doctor",
                              style: GoogleFonts.lato(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: (changecolorDoctor)?Color(0xff66CA98):Color(0xff1C1F1E)),
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Text("Proin convallis libero ac nisl ",
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA7A6A5))),
                          ],
                        ),
                      )
                    ],
                  ),
              ),

              Spacer(),

              ElevatedButton(
                onPressed: () {
                  if(changecolor){
                  Navigator.pushNamed(context, '4');
                  }
                  else if(changecolorDoctor){
                    Navigator.pushNamed(context, '4');

                  }
                  else{
                    Fluttertoast.showToast(msg:"please select first");
                    HapticFeedback.heavyImpact();
                  }
                },
                child: Text("Continue",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w800),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: (changecolor)?Color(0xff66CA98):(changecolorDoctor)?Color(0xff66CA98):Colors.grey,
                  shape: StadiumBorder(),
                  shadowColor: Colors.black12,
                  fixedSize: Size(180.w, 40.h),
                ),
              )
            ],
          ),
        ),
      ),

    );

  }

}
