import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic_app/Mydetails.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/eight.dart';
import 'package:medical_clinic_app/passwordReset.dart';
import 'package:medical_clinic_app/recipe.dart';
import 'package:medical_clinic_app/updateEmail.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomState.onPageChange = 4;
    profiledatasave();
    updateEmailfunction();
    updateName();
    checkImageApi();
    Fluttertoast.showToast(msg: "pop");
  }
loadingDialog loader =loadingDialog();
  List<String> poplist = ["Help", "Sign Out"];
  _launchURL() async {
    final Uri url = Uri.parse(
        'https://support.google.com/googleplay/android-developer/answer/12261419?hl=en');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  File? a;

  String userName = "";
  String pass = "";
  String emailName = "";
  String id = "";
  String image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
                    height: MediaQuery.sizeOf(context).height / 3,
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Image.asset("assets/logo/bubbles.png"),
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    bottomState.screenController.add(eight());
                                  },
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Color(0xffCDCFCE))),
                              Spacer(),
                              PopupMenuButton(
                                shadowColor: Colors.black38,
                                color: Color(0xffF4F6F5),
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(20.r)),
                                onSelected: (value) {
                                  if (value == "Sign Out") {
                                    logOut();
                                    Navigator.pushNamed(context, '5');
                                  } else if (value == "Help") {
                                    _launchURL();
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return poplist
                                      .map((e) => PopupMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.lato(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          )))
                                      .toList();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Color(0xffCDCFCE),
                                      size: 8.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Color(0xffCDCFCE),
                                      size: 8.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Color(0xffCDCFCE),
                                      size: 8.sp,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 150.h, left: 15.w, right: 15.w),
                child: Container(
                  height: 170.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10.r)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Container(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(id.toString(),
                            style: GoogleFonts.lato(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45)),

                        Text(userName.toString(),
                            style: GoogleFonts.lato(
                                fontSize: 20.sp, fontWeight: FontWeight.w600)),

                        Text(emailName,
                            style: GoogleFonts.lato(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45)),
              /*          Text(pass,
                            style: GoogleFonts.lato(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45)),*/
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/logo/face1.png",
                              height: 20.h,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset("assets/logo/twitter2.512.png",
                                height: 20.h, color: Colors.black45),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset("assets/logo/link.png",
                                height: 20.h, color: Colors.black45),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset("assets/logo/insta2.png",
                                height: 20.h, color: Colors.black45),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("This app an organized medical service",
                            style: GoogleFonts.lato(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45)),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                            "offering diagnostic, therapeutic, or preventive outpatient services",
                            style: GoogleFonts.lato(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black38)),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80.h,
                    width: 90.w,
                    margin: EdgeInsets.only(top: 115.h),
                    child: Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (a != null) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 100.r,
                                          child: ClipOval(
                                              child: Image.file(
                                            a!,
                                            width: 200.w,
                                            fit: BoxFit.fill,
                                          )),
                                        ),
                                      );
                                    });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 3.r,
                                )
                              ], borderRadius: BorderRadius.circular(50.r)),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50.r,
                                  child: ClipOval(
                                    child: (a == null)
                                        ? Icon(
                                            Icons.perm_identity,
                                            size: 75.sp,
                                            color: Colors.black38,
                                          )
                                        : Image.file(a!,
                                            height: 100.h,
                                            width: 100.w,
                                            fit: BoxFit.fill),
                                  )),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final pickedFileList =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      a = File(pickedFileList!.path);
                                      setState(() {});
                                      upload(File(a!.path));
/*
                                    Signupload(File(a!.path));

*/

                                    },
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 30.sp,
                                          color: Colors.green,
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 15.w, top: 20.h),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Account Settings",
                    style: GoogleFonts.lato(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38),
                  ))),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Stack(
              children: [
                Container(
                  height: 220.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10.r)
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            bottomState.screenController.add(updateEmail());
                          },
                          child: Row(
                            children: [
                          Image.asset("assets/logo/email1.png",height: 30.h),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Update Email address",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_sharp,
                                  size: 14.sp, color: Colors.black38)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            bottomState.screenController.add(passwordReset());
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/logo/password.png",height: 30.h),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Reset Password",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 15.sp,
                                color: Colors.black38,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            bottomState.screenController.add(mydetails());
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/logo/updateEmail.png",height: 30.h),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Update My details",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 14.sp,
                                color: Colors.black38,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {

                            showDialog(context: context, builder: (context){
                              return loader;
                            });
                            Future.delayed(Duration(seconds: 3)).then((value){
                              Navigator.pop(context);
                              logOut();
                              Navigator.pushNamed(context, "5");
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset("assets/logo/logoutLogo.png",height: 30.h),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Log Out",
                                style: GoogleFonts.lato(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 14.sp,
                                color: Colors.black38,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  profiledatasave() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('id')!;
    userName = pref.getString('name').toString();
    emailName = pref.getString('email').toString();
    pass = pref.getString('password').toString();
    setState(() {});
  }

  logOut() async {
    SharedPreferences prefa = await SharedPreferences.getInstance();
    prefa.clear();
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();
    var uri = await Uri.parse("http://192.168.0.78/dbMedical/signup.php");
    var request = http.MultipartRequest('POST', uri);
    var multipartFile = new http.MultipartFile('uploadfile', stream, length,
        filename: basename(a!.path));
    request.files.add(multipartFile);
    request.fields["email"] = emailName;
    request.fields["name"] = "camera";

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  /*Signupload(File imageFile) async {
    // open a bytestream
    var stream = new http.ByteStream(
        DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();
    var uri = await Uri.parse("http://192.168.0.78/dbMedical/signin.php");
    var request = http.MultipartRequest('POST', uri);
    var multipartFile = new http.MultipartFile('uploadfile', stream, length,
        filename: basename(a!.path));
    request.files.add(multipartFile);
    request.fields["email"]=emailName;
    request.fields["name"]="camera";

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }*/

  updateEmailfunction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    emailName = pref.getString('email').toString();
    setState(() {});
  }

  updateName() async {
    SharedPreferences prefaa = await SharedPreferences.getInstance();
    userName = prefaa.getString('name').toString();
    setState(() {});
  }

  checkImageApi() async {
    var req= await http.post(Uri.parse("http://192.168.0.78/dbMedical/imageditect"),
        body: {
          "email":emailName,
        });
    print(req.body);
  }
  imageFetch() async{
    SharedPreferences prefg=await SharedPreferences.getInstance();
    image=prefg.getString('image').toString();
    setState(() {

    });
  }
}
