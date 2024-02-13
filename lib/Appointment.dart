import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/doctorview.dart';
import 'package:medical_clinic_app/payment.dart';

class appointment extends StatefulWidget {
  Map<String,String> backvalues={};
   appointment({super.key,required this.backvalues});

  static int onPageChange=0;
  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomState.onPageChange=6;
  }
  @override
  List<String> name=["Dr.Eleanor Pena"];
  List<String> pesa=["Pediatrics"];

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        return false;

      },
      child: Scaffold(
            body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Color(0xffF4F6F5),
                  child: Column(
                  children: [
                    Container(
                      height: 340,
                      decoration: BoxDecoration(color: Color(0xff66CA98),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))),
                      padding: EdgeInsets.only(left: 24,top: 68,right: 24,bottom: 20),
                      child: Column(
            children: [
              Row(

                children: [

                  GestureDetector(
                    onTap:(){
                      bottomState.screenController.add(doctorview(backvalues: {"name":name[0],"pes":pesa[0]}));

                    } ,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,size: 12,color: Color(0xffF4F6F5),),
                        Text("Back",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffF4F6F5)),),
                      ],
                    ),
                  ),
                  SizedBox(width: 60,),
                  SvgPicture.asset("assets/logo/logo1.svg",height: 33,width: 32,),
                  SizedBox(width: 11,),
                  Text("Self Care",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xffF4F6F5)),)
                ],
              ),
              SizedBox(height: 24,),
              Text("Thank you!",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),
              SizedBox(height: 12,),
              Icon(Icons.check_circle,size: 58,color: Color(0xffFFFFFF),),
              SizedBox(height: 11,),
              Text("Your visit has been successfully reserved,",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),
              Text("please pay for it to get an appointment ",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),
              Text("with the selected doctor",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),
            ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    Container(
                      padding: EdgeInsets.only(left: 26,right: 26),
                      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
            Container(
                  decoration:BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
              height: 45,
              width: 45,
              child: SvgPicture.asset("assets/logo/female-doctor-icon.svg",fit: BoxFit.scaleDown,height:5)),
                  SizedBox(width: 10,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(widget.backvalues["name"]!,style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),),
                              SizedBox(width: 45,),
                              Text("(101 reviews)",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5)),),
                              SizedBox(width: 5),

                              Icon(Icons.star,color: Colors.pinkAccent,size: 16,),
                              SizedBox(width: 5,),

                              Text("4.9",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5)),),
                            ],
                          ),
                          Text("Pediatrics",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5)),),
                        ],
                      ),

                    ],
                  ),

                ],
              ),
              SizedBox(height: 28,),
              Row(
                children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Date :",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                     SizedBox(width: 100,),
                    Row(
                      children: [
                        Text(widget.backvalues['Date']!,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xffA7A6A5)),),
                        SizedBox(width: 5,),
                        Text(widget.backvalues['month']!,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xffA7A6A5)),)
                      ],
                    ),
                   ],
                 ),
                  SizedBox(width: 120),
                  Column(

                    children: [Text("Time :",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),

                      Text(widget.backvalues['Time']!,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xffA7A6A5)),),

                    ],
                  ),
                ],

              ),


              SizedBox(height: 18,),
              Text("Locatiion:",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
              SizedBox(height: 11,),
              Row(

                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3891 Ranchview",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                      Text("Dr. Richardson",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                      Text("San Francisco 62639",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Icon(Icons.local_hospital),
                  SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Jane Cooper:",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                      Text("Medical College",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 28,),
            Row(
                  children: [
                    Text("Cost:",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                    SizedBox(width: 5,),
                    Text("95 Rs",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                  ],
            ),
              SizedBox(height: 28,),
            Center(
                  child:   ElevatedButton(onPressed: (){
            bottomState.screenController.add(payment());

                  }, child: Text("Go to payment",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white)),style:

                    ElevatedButton.styleFrom(

                  backgroundColor: Color(0xff66CA98),

                  shape: StadiumBorder(),

                  fixedSize: Size(200, 50)

                    )),
            ),
              SizedBox(height: 4,),
              Center(child: Text("Cancel reservation",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)))),

            ],
                      ),
                    )
                  ],
                  ),
            ),
      ),
    );
  }
}
