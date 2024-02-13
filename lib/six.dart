
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:lottie/lottie.dart';
import 'package:medical_clinic_app/dialogs/erroDialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class six extends StatefulWidget {
  const six({super.key});

  @override
  State<six> createState() => _sixState();
}

class _sixState extends State<six> {

bool isPasswordVisible=true;
  bool isCheckedBox=false;
  bool isUsernameEmpty=false;
  bool isEmailEmpty=false;
  bool isPasswordEmpty=false;
  bool isCheckBoxChecked=false;
  TextEditingController emailController=TextEditingController();
  TextEditingController userController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  List validatoryChecks=[0,0,0,0];
  int stopPopingOfalreadyRegisterdEmailDialog=0;

userAlreadyExists alreadyExists=userAlreadyExists( text: 'jj',);



  Future<Object>loadingDialog() async
  {
           return showDialog(context: context, builder: (context){
             return Dialog(shadowColor: Colors.transparent,backgroundColor: Colors.transparent,
             child: Container(
               height: 300,
               width: 100,
               child: Lottie.asset("assets/loaders/loading.json"),
             ));
           });
  }

_launchURL() async {
  final Uri url = Uri.parse('https://policies.google.com/privacy?hl=en-US');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(right: 26.w,top: 68.h,bottom: 100.h),
          child:Column(

            children: [

              SvgPicture.asset("assets/logo/logo.svg",  height: 32.h,
                width: 33.w,),
              SizedBox(height: 50.h),
              GestureDetector(
                onTap: (){
                  loadingDialog();
                },
                child: Container(
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.lato(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1C1F1E)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 25.h),

              Container(
padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Full Name",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                        Text("*",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xffFF6C52)),),
                        Spacer(),
                        (validatoryChecks[0]==2)?Text("Please fill the Name",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w500,color:Color(0xffFF6C52)),):Text(""),
                      ],
                    ),
                    SizedBox(height: 6.h),

                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffEFF2F1),
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: (isUsernameEmpty==false)?Color(0xffA7A6A5):Colors.red)),
                        child: TextField(
                          controller: userController,
                          scrollPadding: EdgeInsets.only(bottom:400.h),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 18.w,top: 13.h,bottom: 14.h),
                              hintText: "Full Name",
                              hintStyle: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Color(0xffCDCFCE)),
                              border: InputBorder.none),)),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              Container(
                padding: EdgeInsets.only(left: 20.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Email",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                        Text("*",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xffFF6C52)),),
                        Spacer(),
                        (validatoryChecks[1]==2)?Text("Please fill the Email",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w500,color:Color(0xffFF6C52))):Text(""),
                      ],
                    ),
                    SizedBox(height: 6.h),

                    Container(
                        decoration: BoxDecoration(color: Color(0xffEFF2F1),borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: (isEmailEmpty==false)?Colors.transparent:Colors.red)),
                        child: TextField(
                          controller: emailController,
                          scrollPadding: EdgeInsets.only(bottom:400.h),decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 18.w,top: 13.h,bottom: 14.h),hintText: "Email",hintStyle: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Color(0xffCDCFCE)),border: InputBorder.none),)),
                  ],
                ),
              ),

              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.only(left: 20.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                    SizedBox(height: 6.h),

                    Container(
                        decoration: BoxDecoration(color: Color(0xffEFF2F1),borderRadius: BorderRadius.all(Radius.circular(5.r)), border: Border.all(color: (validatoryChecks[2]==2)?Colors.red:Colors.transparent)),
                        child: TextField(
                          controller: passwordController,
                          scrollPadding: EdgeInsets.only(bottom:300),obscureText:isPasswordVisible,decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 18.w,top: 13.h),hintText: "Password",hintStyle: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Color(0xffCDCFCE)),suffixIcon: GestureDetector(onTap: (){
                          if(isPasswordVisible==false){
                            isPasswordVisible=true;
                          }
                          else{
                            isPasswordVisible=false;
                          }
                          setState(() {

                          });
                        },child: Icon(Icons.remove_red_eye)),border: InputBorder.none),)),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                padding: EdgeInsets.only(left: 10.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(

                      children: [
                        Checkbox(
                          side: BorderSide(color: (validatoryChecks[3]==2)?Colors.red:Colors.black),
activeColor: Color(0xff66CA98),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                            value: isCheckedBox, onChanged: (value)
                        {
                          if(isCheckedBox==false)
                            {
                              isCheckedBox=true;

                            }
                          else
                            {
                              isCheckedBox=false;
                            }

                          setState(() {

                          });
                          print(value.toString());

                        }),
                        Text("I agree with Terms and ",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5)),),

                        GestureDetector(onTap: (){
                          _launchURL();
                          /*showDialog(context: context, builder: (context){
                            return
                          });
                          Dialog(
                            child: Container(
                              color: Colors.red,
                              child: Text(""),
                            ),
                          );*/

                        },child: Text("Privacy Policy",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xff66CA98),decoration: TextDecoration.underline),)),

                      ],

                    ),
                    Container(
padding: EdgeInsets.only(left: 10.w),
                        child: (isCheckBoxChecked)?Text("Please complete the form",style:GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xffFF6C52)),):Text("")),
                  ],

                ),
              ),

              Spacer(),

              ElevatedButton(onPressed: () async{

//                  validation();


              /// this function checks the if the fields are empty or they provide the optimal feedback from user and  will either return true if everything is accordingly or false on when fucked up
                validationRenewed().then((value) {
                  /// return statement from function
                  if(value==true)
                    {
                      loadingDialog();
                    }
                  else
                    {
                      Fluttertoast.showToast(msg: "Bhole");
                    }
                });


      /// this condition checks if the list contains 2 in it, dont let user  or call the api when everything is met
                if(validatoryChecks.contains(2))
                  {
                    Fluttertoast.showToast(msg: "Something's wrong");
                  }
                else
                  {
                    /// api call
                    registrationApiCall();

                  }

                },   child: Text("Sign Up",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w600),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff66CA98),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
                  fixedSize: Size(180.w, 40.h),
                ),
              ),

              SizedBox(height: 13.h),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Already have account? ",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5))),
                    GestureDetector(onTap: (){
                      Navigator.pushNamed(context, '5');
                    },child: Text("Sign In",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff66CA98),decoration: TextDecoration.underline))),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


 /* void validation()
  {

    if(userController.text.isNotEmpty)
    {
      isUsernameEmpty=false;

      RegExp reg = RegExp(r'^[1234567890 *]*$');
      if(!reg.hasMatch(userController.text))
        {
          if(emailController.text.isNotEmpty)
          {
            isEmailEmpty=false;
            RegExp regx=RegExp(r'^\S+@\S+\.\S+$');
            if(regx.hasMatch(emailController.text))
            {
              if(passwordController.text.isNotEmpty)
              {
                isPasswordEmpty=false;
            RegExp regg=RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$');
                if(regg.hasMatch(passwordController.text)){
                  if(isCheckedBox==true){
                    isCheckBoxChecked=false;

                    registrationApiCall().then((value) {
                      if(value)
                      {
                        Navigator.pushNamed(context, '7');
                      }

                    });
                  }
                  else{
                    isCheckBoxChecked=true;
                  }
                }

                else
                {

                  isPasswordEmpty=true;

                }
              }
              else
              {

                isEmailEmpty=true;
              }
            }
            else
            {
              print("no int please");
              isUsernameEmpty=true;

            }
          }
          else
          {
            isUsernameEmpty=true;

          }}
                }






    setState(() {

    });
  }*/





  Future<bool> validationRenewed() async
  {
    bool? abc;
    RegExp regForUsername = RegExp(r'^[1234567890 *]*$');
    RegExp regesforEmails=RegExp(r'^\S+@\S+\.\S+$');
    RegExp passwordRegex=RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$');



    if(userController.text.isNotEmpty && !regForUsername.hasMatch(userController.text.trim()))
      {
        validatoryChecks[0]=1;
        abc=true;


        if(emailController.text.isNotEmpty && regesforEmails.hasMatch(emailController.text.trim()))
          {
            validatoryChecks[1]=1;
            abc=true;


            if(passwordController.text.isNotEmpty && passwordRegex.hasMatch(passwordController.text.trim()))
              {
                validatoryChecks[2]=1;
                FocusScope.of(context).unfocus();
                abc=true;


                if(isCheckedBox)
                  {
                    validatoryChecks[3]=1;
                    abc=true;
                    setState(() {


                    });

                  }
                else

                {
                  validatoryChecks[3]=2;
                  abc= false;
                  setState(() {


                  });

                }


              }
            else
              {
                validatoryChecks[2]=2;
                abc= false;


              }


          }
        else
          {
            validatoryChecks[1]=2;
            abc= false;


          }

      }
    else
      {
        validatoryChecks[0]=2;
        abc=false;

      }
    Fluttertoast.showToast(msg: validatoryChecks.toString());
    setState(() {


    });

return abc!;


  }


  Future<bool> registrationApiCall() async

  {
   // bool? result;
    SharedPreferences pref= await SharedPreferences.getInstance();

      var req = await http.post(
          Uri.parse("http://192.168.0.78/dbMedical/signup.php"),
          body: {"name": userController.text,
            "email": emailController.text,
            "password":passwordController.text,
          });

      var json=jsonDecode(req.body);
    print(json);

    if(json['status']=='200')
      {
       print(json['id']);
        pref.setString("name", userController.text);
        pref.setString("email", emailController.text);
       pref.setString('id', json['id']);

       Future.delayed(Duration(seconds: 3)).then((value) {
Navigator.pop(context);
          Navigator.pushNamed(context, '7');

        });

        return true;

      }
else if(json["status"]=="300")
  {
    stopPopingOfalreadyRegisterdEmailDialog=1;
    Navigator.pop(context);
  showDialog(context: context, builder: (builder){
    return alreadyExists;
  });
  setState(() {

  });
    return false;
  }
      else
      {
     return false;
      }





  }
}
