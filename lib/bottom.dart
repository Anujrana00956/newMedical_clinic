import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_clinic_app/chats.dart';
import 'package:medical_clinic_app/doctorview.dart';
import 'package:medical_clinic_app/eight.dart';
import 'package:medical_clinic_app/payment.dart';
import 'package:medical_clinic_app/recipe.dart';
import 'package:medical_clinic_app/seven.dart';
import 'package:medical_clinic_app/updateEmail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic_app/userProfile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'eight.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => bottomState();
}

class bottomState extends State<bottom> {
  static StreamController<Widget> screenController =
      StreamController.broadcast();
  static Stream<Widget> screenChangeStream = screenController.stream;
  static int onPageChange = 0;
  List<String> name = ["Dr.Eleanor Pena"];
  List<String> pesa = ["Pediatrics"];

  int initialpage = 0;
  String? pageChangeToString;
  List pages = [eight(), recipe(), chats(), userProfile(), payment()];
  Widget page = eight();
  bool changeColor = true;
  bool changeColor2 = false;
  bool changeColor3 = false;
  bool changeColor4 = false;
  bool changeColor5 = false;

  @override
  void initState() {
    screenChangeStream.listen((event) {
      Fluttertoast.showToast(msg: event.toString());
      page = event;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onPageChange == 2 ||
            onPageChange == 3 ||
            onPageChange == 4 ||
            onPageChange == 12) {
         bottomState.screenController.add(eight());
          changeColor2 = false;
          changeColor3 = false;
          changeColor4 = false;
          changeColor5 = false;
          changeColor = true;
          return false;

        } else if (onPageChange == 7 ||
            onPageChange == 8 ||
            onPageChange == 9) {
          bottomState.screenController.add(userProfile());
        }


        else if (onPageChange == 6 ) {

          bottomState.screenController
              .add(doctorview(backvalues: {"name": name[0], "pes": pesa[0]}));
          return false;
        }




        else if (onPageChange == 1) {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text("Are you sure?",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800))),
                        Center(
                            child: Text("you want to exit the app?",
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800))),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.lato(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: Text(
                                  "EXIT",
                                  style: GoogleFonts.lato(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }

        Fluttertoast.showToast(msg: onPageChange.toString());
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF4F6F5),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.r),
                  topLeft: Radius.circular(50.r)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
          height: 69.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    page = pages[0];
                    if (changeColor) {
                      changeColor = true;
                    } else {
                      changeColor = true;
                      changeColor3 = false;
                      changeColor4 = false;
                      changeColor5 = false;
                    }
                    setState(() {});
                  },
                  child: SvgPicture.asset(
                    "assets/logo/akar-icons_home-alt1.svg",
                    color: (changeColor) ? Color(0xff66CA98) : Colors.black54,
                  )),
              GestureDetector(
                  onTap: () {
                    if (changeColor5) {
                      changeColor5 = true;
                    } else {
                      changeColor5 = true;
                      changeColor = false;
                      changeColor3 = false;
                      changeColor4 = false;
                    }
                    page = pages[1];
                    setState(() {});
                  },
                  child: SvgPicture.asset("assets/logo/icon receipt.svg",
                      color:
                          (changeColor5) ? Color(0xff66CA98) : Colors.black54)),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xff66CA98),
                      borderRadius: BorderRadius.circular(50)),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: SvgPicture.asset("assets/logo/icon plus.svg",
                          height: 40.h, width: 34.w, color: Colors.white))),
              GestureDetector(
                  onTap: () {
                    if (changeColor3) {
                      changeColor3 = true;
                    } else {
                      changeColor3 = true;
                      changeColor = false;
                      changeColor4 = false;
                      changeColor5 = false;
                    }
                    page = pages[2];
                    setState(() {});
                  },
                  child: SvgPicture.asset("assets/logo/ph_chat-circle-dots.svg",
                      color:
                          (changeColor3) ? Color(0xff66CA98) : Colors.black54)),
              GestureDetector(
                  onTap: () {
                    if (changeColor4) {
                      changeColor4 = true;
                    } else {
                      changeColor4 = true;
                      changeColor = false;
                      changeColor3 = false;
                      changeColor5 = false;
                    }
                    page = pages[3];
                    setState(() {});
                  },
                  child: SvgPicture.asset("assets/logo/user 1.svg",
                      color:
                          (changeColor4) ? Color(0xff66CA98) : Colors.black54)),
            ],
          ),
        ),
        body: page,
      ),
    );
  }
}
