import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:medical_clinic_app/dialogs/erroDialog.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/sucessLoader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_clinic_app/dialogs/sucessupdate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class five extends StatefulWidget {
  const five({super.key});

  @override
  State<five> createState() => _fiveState();
}

class _fiveState extends State<five> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
newUser();
  }





  void newUser () async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("loggedIn", "false");

  }




  bool isPasswordVisilble = true;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loadingDialog loading = loadingDialog();
  userAlreadyExists Loginfailed =
      userAlreadyExists(text: "The user does not exist");
  sucessupdate sucess = sucessupdate();
  List changecolor = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF4F6F5),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
              top: 68.h, bottom: 100.h, left: 20.w, right: 26.w),
          child: Column(
            children: [
              SvgPicture.asset("assets/logo/logo.svg",
                  height: 32.h, width: 33.w),
              SizedBox(height: 50.h),
              Container(
                width: 362.w,
                child: Text(
                  "Sign In",
                  style: GoogleFonts.lato(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1F1E)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 64.h),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffA7A6A5)),
                        ),
                        Text(
                          "*",
                          style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                        Spacer(),
                        (changecolor[0] == 2)
                            ? Text(
                                "Please enter the email",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              )
                            : Text(""),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffEFF2F1),
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: (changecolor[0] == 2)
                                    ? Colors.red
                                    : Color(0xffEFF2F1))),
                        child: TextField(
                          controller: userController,
                          scrollPadding: EdgeInsets.only(bottom: 400),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 18.w, top: 13.h, bottom: 14.h),
                              hintText: "Email",
                              hintStyle: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCDCFCE)),
                              border: InputBorder.none),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffA7A6A5)),
                        ),
                        Text(
                          "*",
                          style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                        Spacer(),
                        (changecolor[1] == 2)
                            ? Text(
                                "Please enter the password",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              )
                            : Text(""),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffEFF2F1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                            border: Border.all(
                                color: (changecolor[1] == 2)
                                    ? Colors.red
                                    : Color(0xffEFF2F1))),
                        child: TextField(
                          controller: passwordController,
                          scrollPadding: EdgeInsets.only(bottom: 300),
                          obscureText: isPasswordVisilble,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 18.w, top: 13.h, bottom: 14.w),
                              hintText: "Password",
                              hintStyle: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCDCFCE)),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (isPasswordVisilble == false) {
                                      isPasswordVisilble = true;
                                    } else {
                                      isPasswordVisilble = false;
                                    }
                                    setState(() {});
                                  },
                                  child: Icon(Icons.remove_red_eye)),
                              border: InputBorder.none),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot your password?",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff66CA98)),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  empty();

                  if (changecolor.contains(2)) {
                    Fluttertoast.showToast(msg: "something wents wrong");
                  } else {
                    apiCallForAuthentication();
                  }

                  // Navigator.pushNamed(context, '7');
                },
                child: Text(
                  "Sign in",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff66CA98),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.r))),
                  fixedSize: Size(180.w, 40.h),
                ),
              ),
              SizedBox(height: 13.h),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?",
                        style: GoogleFonts.lato(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A6A5))),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '6');
                        },
                        child: Text("Sign up",
                            style: GoogleFonts.lato(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff66CA98),
                                decoration: TextDecoration.underline))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  empty() {
    RegExp regesforEmails = RegExp(r'^\S+@\S+\.\S+$');

    if (userController.text.isNotEmpty &&
        regesforEmails.hasMatch(userController.text)) {
      changecolor[0] = 1;

      if (passwordController.text.isNotEmpty) {
        changecolor[1] = 1;
      } else {
        changecolor[1] = 2;
      }
    } else {
      changecolor[0] = 2;
    }
    setState(() {});
  }

  apiCallForAuthentication() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var req = await http
        .post(Uri.parse("http://192.168.0.78/dbMedical/signin.php"), body: {
      "email": userController.text,
      "password": passwordController.text,
    });
    var json = jsonDecode(req.body);
    print(json);
    print("json");
    if (json["status"] == "200") {
      pref.setString('id', json['id']);
      pref.setString("name", json['name']);
      pref.setString("email", json['email']);
      pref.setString("image", json['image']);
      Future.delayed(Duration(seconds: 4)).then((value) {
        pref.setString("loggedIn", "true");

      });
      showDialog(
          context: context,
          builder: (context) {
            return loading;
          });
      Future.delayed(Duration(seconds: 1)).then((value) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return sucess;
            });
        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.pop(context);
          Navigator.pushNamed(context, '8');
        });
      });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Loginfailed;
          });
    }
  }
}
