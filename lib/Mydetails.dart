import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/sucessupdate.dart';
import 'package:medical_clinic_app/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:google_fonts/google_fonts.dart';

class mydetails extends StatefulWidget {
  const mydetails({super.key});

  @override
  State<mydetails> createState() => _mydetailsState();
}

class _mydetailsState extends State<mydetails> {
  String userName="";
  String emailName="";
  TextEditingController userController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  loadingDialog loader =loadingDialog();
  sucessupdate sucess=sucessupdate();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomState.onPageChange=9;
    profiledatasave();

  }
  List bitflip=[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Update Name"),
        leading: Builder(builder: (BuildContext context){
          return IconButton(onPressed: (){
            bottomState.screenController.add(userProfile());
          }, icon: Icon(Icons.arrow_back_ios));
        }),
        elevation: 0,
      ),
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          color: Color(0xffF4F6F5),
          padding: EdgeInsets.only(left: 22,right: 22,top: MediaQuery.sizeOf(context).height*.09),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle),
                      SizedBox(width: 10,),
                      Text(userName,style:GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black45)),
                    ],
                  )),
             SizedBox(height: 10,),
              Text(" Your Email",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/logo/email1.png",height: 25),
                      SizedBox(width: 10),
                      Text(emailName,style:GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black45),),
                    ],
                  )),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("New Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black38)),
                  Spacer(),
                  (bitflip[0]==2)?Text("please fill the field",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.red)):Text(""),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                  height: 50,
                  decoration: BoxDecoration(border: Border.all(color: (bitflip[0]==2)?Colors.red:Colors.black26),borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(scrollPadding: EdgeInsets.only(bottom: 900),controller: userController,decoration: InputDecoration(icon: Icon(Icons.account_circle),border: InputBorder.none,hintText: "enter your name",hintStyle: GoogleFonts.lato(color: Colors.black12,fontSize: 18,fontWeight: FontWeight.w600)),)),
              SizedBox(height: 40,),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () async{

                      emptyUsername();
                    }, child:  Text("Update",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),)
                    ,style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xff66CA98),fixedSize: Size(120, 45))),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),)
                        ,style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xffFF6C52),fixedSize: Size(120, 45))),
        
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  profiledatasave() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    userName= pref.getString('name').toString();
    emailName=pref.getString('email').toString();
    setState(() {

    });
  }
  updateName()async{
  SharedPreferences prefa=await SharedPreferences.getInstance();
  prefa.setString('name', userController.text);
  setState(() {

  });
  }
  emptyUsername() async{
if(userController.text.isNotEmpty){
  bitflip[0]=1;
  var req=await http.post(Uri.parse("http://192.168.0.78/dbMedical/mydetail.php"),
      body:{
        "name":userController.text,
        "email":emailName,

      });
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
  print(req.body);
  updateName();
}
else{
  bitflip[0]=2;

}
setState(() {

});
  }
}
