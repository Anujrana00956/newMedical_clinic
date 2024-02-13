import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/sucessLoader.dart';
import 'package:medical_clinic_app/dialogs/sucessupdate.dart';
import 'package:medical_clinic_app/userProfile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class passwordReset extends StatefulWidget {
  const passwordReset({super.key});

  @override
  State<passwordReset> createState() => _passwordResetState();
}

class _passwordResetState extends State<passwordReset> {
  TextEditingController passwordController=TextEditingController();
  TextEditingController NewpasswordController=TextEditingController();
  TextEditingController userController=TextEditingController();
  bool scrollAble=false;
  List bitflip=[0,0,0];
  String pass="";
  loadingDialog loader =loadingDialog();
  sucessupdate sucess=sucessupdate();
@override
  void initState() {
bottomState.onPageChange=8;
  // TODO: implement initState
    super.initState();
getPass();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color(0xffF4F6F5),
        title: Text("Reset Password"),
        leading: Builder(builder: (BuildContext context){
          return IconButton(onPressed: (){
            bottomState.screenController.add(userProfile());
          }, icon: Icon(Icons.arrow_back_ios));
        }),
      ),
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
color: Color(0xffF4F6F5),
          height:MediaQuery.sizeOf(context).height,
            padding: EdgeInsets.only(left: 22,right: 22,top: MediaQuery.sizeOf(context).height*.09,bottom: MediaQuery.sizeOf(context).height*.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Text("Email",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
                    Text("*",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.red)),
                    Spacer(),
                    (bitflip[0]==2)?Text("please fill the email",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.red),):Text(""),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: (bitflip[0]==2)?Colors.red:Colors.black38)),
                    child: TextField(scrollPadding: EdgeInsets.only(bottom: 200),controller: userController,decoration: InputDecoration(icon: Icon(Icons.email,color: Colors.black38),border: InputBorder.none,hintText: "enter your email",hintStyle: GoogleFonts.lato(color: Colors.black12,fontSize: 18,fontWeight: FontWeight.w600),),)),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Current Password",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
                    Spacer(),
                    (bitflip[1]==2)?Text("please fill the password",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.red),):Text(""),

                  ],
                ),
                SizedBox(height: 10,),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: (bitflip[1]==2)?Colors.red:Colors.black38)),
                    child: TextField(scrollPadding: EdgeInsets.only(bottom: 300),controller: passwordController,decoration: InputDecoration(icon: Icon(Icons.key_outlined,color: Colors.black38),border: InputBorder.none,hintText: "enter current password",hintStyle: GoogleFonts.lato(color: Colors.black12,fontSize: 18,fontWeight: FontWeight.w600),),)),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("New password",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
                    Spacer(),
                    (bitflip[2]==2)?Text("please fill the password",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.red)):Text(" "),

                  ],
                ),
                SizedBox(height: 10,),
                Container(
                    padding: EdgeInsets.only(left: 20),

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: (bitflip[2]==2)?Colors.red:Colors.black38)),
                    child: TextField(controller: NewpasswordController,decoration: InputDecoration(icon: Icon(Icons.key_rounded,color: Colors.black38),border: InputBorder.none,hintText: "enter new password",hintStyle: GoogleFonts.lato(color: Colors.black12,fontSize: 18,fontWeight: FontWeight.w600),),)),
        Spacer(),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: (){

                        fieldEmpty();
setState(() {

});
                      }, child: Text("RESET",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white)),style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),backgroundColor: Color(0xff66CA98),fixedSize: Size(160,   50)
                      )),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Cancel",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),)
                      ,style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFF6C52),shape: StadiumBorder(),fixedSize: Size(160,   50))),
                    ],
                  ),
                ),
              ],
            )


        ),
      ),
    );
  }
  fieldEmpty() async{
    RegExp rg=RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
    RegExp passwordRegex=RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$');


    if(userController.text.isNotEmpty && rg.hasMatch(userController.text)){
        bitflip[0]=1;
          if(passwordController.text.isNotEmpty ){
          bitflip[1]=1;


          if(NewpasswordController.text.isNotEmpty && passwordRegex.hasMatch(NewpasswordController.text)){
            bitflip[2]=1;
            if(passwordController.text==NewpasswordController.text && NewpasswordController.text==pass){
              Fluttertoast.showToast(msg: "your current and new password was same",gravity: ToastGravity.CENTER);

            }
            else{
              var req= await http.post(Uri.parse('http://192.168.0.78/dbMedical/update.php'),
                  body: {
                    "email":userController.text,
                    "oldpassword":passwordController.text,
                    "newpassword":NewpasswordController.text,
                  }
              );
              var json=jsonDecode(req.body);
              print(json);
              if(json["status"]=="100"){
                Fluttertoast.showToast(msg: "your current password was incorrect",gravity: ToastGravity.CENTER);
              }
            else{
                showDialog(context: context, builder: (context){
                  return loader;
                });
                Future.delayed(Duration(seconds: 3)).then((value) {
                  Navigator.pop(context);
                  showDialog(context: context, builder: (context){
                    return sucess;

                  });
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    Navigator.pop(context);
                    bottomState.screenController.add(userProfile());

                  });
                });
              }

            }

setState(() {

});
      }
      else{
        bitflip[2]=2;
        setState(() {

        });
      }

    }
    else{
      bitflip[1]=2;
    }
  }
    else
      {
        bitflip[0]=2;
        Fluttertoast.showToast(msg: "cdc d cjc");

      }
setState(() {

});
  }
getPass() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pass = pref.getString('password').toString();
  setState(() {

  });
}
updatePassword() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('password', NewpasswordController.text);
      setState(() {

      });
}

}
