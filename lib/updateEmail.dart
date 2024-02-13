import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/dialogs/erroDialog.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/sucessLoader.dart';
import 'package:medical_clinic_app/dialogs/sucessupdate.dart';
import 'package:medical_clinic_app/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';


class updateEmail extends StatefulWidget {
   updateEmail({super.key});

  @override
  State<updateEmail> createState() => _updateEmailState();
}

class _updateEmailState extends State<updateEmail> {

List bitcoding=[0];
loadingDialog loader =loadingDialog();
sucessupdate sucess=sucessupdate();
userAlreadyExists sameemail=userAlreadyExists(text: "your current and new email same");
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomState.onPageChange=7;
    profiledatasave();

}
  String emailName="";
  String id="";
  bool scroll=false;
TextEditingController userController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      /* *//* leading: ModalRoute.of(context)!.canPop?IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)):null,*/
        leading: Builder(builder: (BuildContext context){
          return IconButton(onPressed: (){
          bottomState.screenController.add(userProfile());
          }, icon: Icon(Icons.arrow_back_ios));
        }),
        titleSpacing: 0,
        backgroundColor: Color(0xffF4F6F5),
        title: Text("Change Email"),


      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
        height: MediaQuery.sizeOf(context).height,
            color: Color(0xffF4F6F5),
          padding: EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height*.09),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your ID",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
                SizedBox(height: 10,),
                Container(width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    padding: EdgeInsets.only(left: 15),

                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Image.asset("assets/logo/id23.png",height: 25,),
                        SizedBox(width: 10),
                        Text(id,style:GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black45)),
                      ],
                    )),
                SizedBox(height: 10,),
                Text("Your Email",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 15),
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/logo/email1.png",height: 25,),
                        SizedBox(width: 10),
                        Text(emailName ,style:GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black54)),
                      ],
                    )),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("New Email",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38),),
                    Spacer(),
                    (bitcoding[0]==2)?Text("please fill the email",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.red)):Text(""),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(border:Border.all(color: (bitcoding[0]==2)?Colors.red:Colors.black38),borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      onTap: (){
                        scroll=true;
                        setState(() {

                        });
                      },
                      scrollPadding:(scroll==true)?EdgeInsets.only(bottom: 300):EdgeInsets.only(bottom: 0),
                      controller: userController,
                      decoration: InputDecoration(icon: Icon(Icons.email_sharp,color: Colors.black38,),
                          border: InputBorder.none,hintText: "enter new email",
                          hintStyle: GoogleFonts.lato(color: Colors.black12,fontSize: 18,fontWeight: FontWeight.w600)),)),

            SizedBox(height: 40),              Center(
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: () async{
                        emailEmptyFielsd();



                      }, child: Text("Update",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),)
                      ,style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xff66CA98),fixedSize: Size(120, 45))),
                     SizedBox(height: 5,),
                      ElevatedButton(onPressed: (){
                        //Navigator.pop(context);
                        //bottomState.screenController.add(userProfile());

                      }, child: Text("Cancel",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
              style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xffFF6C52),fixedSize: Size(120, 45))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  profiledatasave() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    emailName = pref.getString('email').toString();
    id= pref.getString('id').toString();
    setState(() {

    });
  }
updateEmailfunction() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString('email', userController.text);
     setState(() {

     });
  }
 emailEmptyFielsd() async{
    RegExp rg=RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
    if(userController.text.isNotEmpty && rg.hasMatch(userController.text))
      {
        bitcoding[0]=1;
        if(userController.text!=emailName){
          var req=await http.post(Uri.parse("http://192.168.0.78/dbMedical/up.php"),
              body:{
                "email":userController.text,
                "id":id,

              });
          print(req.body);
          updateEmailfunction();
          showDialog(context: context, builder: (context){
            return loader;});
          Future.delayed(Duration(seconds: 2)).then((value) {
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
else
  {

    showDialog(context: context, builder: (context){
      return sameemail;
    });
  }


        setState(() {

        });
      }
    else
      {
        bitcoding[0]=2;
       setState(() {

       });
      }

 }
}
