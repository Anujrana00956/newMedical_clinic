import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medical_clinic_app/bottom.dart';
class chats extends StatefulWidget {
  const chats({super.key});

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  void initState(){
    super.initState();
    convertingMonthtoString();
    bottomState.onPageChange=3;
  }

  DateTime currenttime = DateTime.now();

  int monthInFucntion=1;
  String monthName="Jan";

  List<String> months=["Jan","Feb","Mar","Apr","May","june","july","Aug","Sep","Oct","Nov","Dec"];
  List<String> Names=["Dr. Floyd Miles","Dr. Guy Hawkins","Dr. Jane Cooper","Dr. Jacob Jones","Dr. Savannah Nguyen","Dr. Annette Black"];
  List<String> Profession=["Pediatrics","Dentist","Cardiologist","Nephrologyst","Urologyst","Urologyst"];
  List<String> Description=["Vivamus varius odio non dui gravida, qui...","Suspendisse efficitur orci eget nisl euismod...","Suspendisse efficitur orci eget nisl euismod...","Suspendisse efficitur orci eget nisl euismod...","Suspendisse efficitur orci eget nisl euismod...","Suspendisse efficitur orci eget nisl euismod..."];

  void convertingMonthtoString(){

    monthInFucntion=currenttime.month;
    monthName=months[monthInFucntion!-1];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          child: Column(

            children: [
              Container(
padding: EdgeInsets.only(top: 70,left: 24,right: 26),
child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    Row(
              children: [
                Text("< Back",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff1C1F1E)),),
                Spacer(),
                SvgPicture.asset("assets/logo/icon notification.svg",width: 24,height: 24,),
              ],
    ),
    SizedBox(height: 12,),
    Column(
              children: [
                Text("Chat",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),)
              ],
    ),

    //box 1..........................................................................................................................................

    SizedBox(height: 13,),
    Container(
              height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

              child: ListView.separated(itemBuilder: (BuildContext context, int index) {
                return   Slidable(

endActionPane: ActionPane(motion: ScrollMotion(), children: [
  SlidableAction(onPressed: (value){},
  backgroundColor: Color(0xff6295E2),
  icon: Icons.call,
  borderRadius: BorderRadius.circular(5),),

],),






                  child: GestureDetector(onTap: (){
                    Navigator.pushNamed(context, "9",arguments: {"name":Names[index],"des":Profession[index]});
                  },
                    child: Container(

                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.only(left: 10),
                      child: Row(

                        children: [
                          Container(

                            child: Stack(

                              children: [
                                Align(
                                  alignment:Alignment.center,
                                  child: Container(
                                    height: 45,
                                    width: 45,

                                    decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(8)),
                                    child: SvgPicture.asset("assets/logo/female-doctor-icon.svg"),

                                  ),
                                ),
                                Align(alignment: Alignment.bottomCenter,child: Row(
                                  children: [
                                    SizedBox(width: 30,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.circle,color: Colors.green,size: 20,),
                                        SizedBox(height: 15,),
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 7,),
                              Text(Names[index],style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
                              Text(Profession[index],style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                              SizedBox(height: 6,),
                              Text(Description[index],style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Text(currenttime.hour.toString()+":"+currenttime.minute.toString()),
                              SizedBox(height: 31,),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(color: Color(0xffFF6C52),borderRadius: BorderRadius.circular(50)),
                                child: Text("1",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 12,);}, itemCount: Names.length,

              ),
    ),
    //box2..........................................................................................................................................
  ],
),
              ),












            ],
          ),
        ),
      ),
    );
  }
}
