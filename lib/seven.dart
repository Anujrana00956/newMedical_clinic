import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/sucessLoader.dart';
import 'package:medical_clinic_app/eight.dart';
class seven extends StatefulWidget {
  const seven({super.key});

  @override
  State<seven> createState() => _sevenState();
}

class _sevenState extends State<seven> {


  @override
  initState(){
    super.initState();
    generatinRandomOTP();
  }


sucessLoader sucess=sucessLoader();


  loadingDialog laodingDialog=loadingDialog();
  List<TextEditingController?> controllers=[TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
  var randomNumber=Random();
  String lengthOfOtp="";
  List otpSepration=[];
  int otp=0;


/// generating a random 4 digit number
Future<int> generatinRandomOTP() async
{
  for(var i=10000;i<1000000;i++)
    {
      otp=randomNumber.nextInt(100000);

    }
  lengthOfOtp=otp.toString();
  otpSepration=lengthOfOtp.split("");
  if(otpSepration.length<5)
  {
    otp=36916;
  }
  print(otpSepration.length);

  setState(() {

  });
return otp;
}





  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        return true;  /// false means that back button is disabled.
      },
      child: Scaffold(
body: SingleChildScrollView(
  child: Container(
padding: EdgeInsets.only(top: 68),
      child: Column(
        children: [
          SvgPicture.asset("assets/logo/logo.svg",  height: 32,
            width: 33,),
          SizedBox(height: 60),
          GestureDetector(
            onTap: (){
              generatinRandomOTP();
              setState(() {

              });
            },
            child: Container(
              width: 362,
              child: Text(
                "OTP --  ${otp.toString()}",
                style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1C1F1E)),
                textAlign: TextAlign.center,

              ),

            ),
          ),
          SizedBox(height: 40),

          Container(
            width: 362,
            child: Text(
              "Your Code",
              style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1C1F1E)),
              textAlign: TextAlign.center,
              
            ),
            
          ),
          SizedBox(height: 12,),
          Text("Please enter the otp",style: GoogleFonts.lato(fontSize:14,fontWeight: FontWeight.w500,color: Color(0xfffA7A6A5) ),),
          SizedBox(height: 42,),
          OtpTextField(

            handleControllers: (c){
              controllers=c;

            },
            numberOfFields: 5,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here


            },
            onSubmit: (value){


              if(value==otp.toString())
                {
                  showDialog(context: context, builder: (context){
                    return sucess;
                  });
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return bottom();
                    }));
                  });

                }
              else
                {
                  showDialog(context: context, builder: (context){
                    return laodingDialog;
                  });
                  Future.delayed(Duration(seconds: 3)).then((value) {
                    Navigator.pop(context);
                    Fluttertoast.showToast(msg: "OTP is wrong");

                  });

                }

            },
            //runs when every textfield is filled
          ),
SizedBox(height: 16,),
          Container(
            padding: EdgeInsets.only(left: 26),
            child: Row(

              children: [
                Text("Resend Code? ",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14,color: Color(0xffA7A6A5)),),
                GestureDetector(onTap: (){
                  showDialog(context: context, builder: (context){
                    return laodingDialog;
                  });
                  Future.delayed(Duration(milliseconds: 500)).then((value) {
                    Navigator.pop(context);
                    generatinRandomOTP();

                  });
                  },child: Text(" Click here",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14,color: Color(0xff66CA98),decoration: TextDecoration.underline),)),

              ],
            ),
          ),
          
          
          
         /* SizedBox(height: 137,),
          ElevatedButton(onPressed: (){


            validation();


          },   child: Text("Verify"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff66CA98),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
              fixedSize: Size(200, 50),
            ),
          ),*/
        ],
      ),
  ),
),
      ),
    );
  }
    void validation() {

      for(int i=0;i<controllers.length;i++)
      {
        if (controllers[i]!.text.isEmpty) {

          Fluttertoast.showToast(msg: "OTP filed cannot be empty");
          return;
        }



      }
      return;
    }
}
