import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic_app/Appointment.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/doctorview2.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'doctorview.dart';


class eight extends StatefulWidget {
  const eight({super.key});

  @override
  State<eight> createState() => _eightState();
}

class _eightState extends State<eight> {
  TextEditingController _searchContorller=TextEditingController();
  List<String> _doctorsList=["A","B","C"];
  List<String> _CopydoctorsList=["A","B","C"];
 static String recentVisitDoctor="";
static String recentVisitDoctor2="";
  static String date="";
  static String month="";
  static String time="";
  List<String> abc=[];
  Map<String,dynamic> fromBack={};
  List<Map<String,dynamic>> tempList=[];

bool isVisiblity=false;
  @override
  void initState() {
    DatelTimeMonth();
setState(() {

});
    super.initState();
    convertingMonthtoString();
    bottomState.onPageChange=1;
    /// search for doctors in list view
    _searchContorller.addListener(() {
      copyName=Names.where((element) => element.contains(_searchContorller.text)).toList();
      copyPes=pes.where((element) => element.contains(_searchContorller.text)).toList();
      setState(() {

      });
    });
    Fluttertoast.showToast(msg:bottomState.onPageChange.toString());
    fetchRecentVisits();
  }

  void fetchRecentVisits()async
  {
    print("anuj12");
    SharedPreferences prefs=await SharedPreferences.getInstance();
   /* recentVisitDoctor=(await prefs.getString("nameuser"))!;
    recentVisitDoctor2=(await prefs.getString("pesuser"))!;*/
    abc=await prefs.getStringList("date")!;
    print("abc"+abc.toString());
    String n='';


    for(int i=0;i<abc.length;i++)
      {
        n=abc[i];
        fromBack=jsonDecode(n);

        tempList.add(fromBack);


      }
    print("nnbb"+n!.toString());
    print("nnbbmap"+fromBack!.toString());
    print("nnbblist"+tempList.toString());


    setState(() {

    });


  }







  List<String> facilitySuggestions = [
    "#heart",
    "#teeth",
    "#mouth",
    "#surgeon",
    "#eyes",
    "#nose"
  ];
  List<String> categoriesName=["Cardiologyst","Ophthalmologyst","Dentist","Surgeon"];
  List<String> categoriesPic=["assets/logo/icon heart.svg","assets/logo/icon eye.svg","assets/logo/icon tooth.svg","assets/logo/icon tooth.svg"];
  DateTime currenttime = DateTime.now();
  int monthInFucntion=1;
  String monthName="Jan";
List<String> Names=["Dr.Floyd Miles","Dr.Guy Hawkwins","Dr.Jane Cooper"];
List<String> pes=["Pediatrics","Dentist","Cardiologist"];
List<String> copyName=["Dr.Floyd Miles","Dr.Guy Hawkwins","Dr.Jane Cooper"];
List<String> copyPes=["Pediatrics","Dentist","Cardiologist"];

   static List<String> name=["Dr.Eleanor Pena"];
   static List<String> pesa=["Pediatrics"];

  List<String> months=["Jan","Feb","Mar","Apr","May","june","july","Aug","Sep","Oct","Nov","Dec"];






  void convertingMonthtoString(){

    monthInFucntion=currenttime.month;
    monthName=months[monthInFucntion!-1];

  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
titleSpacing: 0,
scrolledUnderElevation: 0,
leading: Container(),
        leadingWidth: 22,
        toolbarHeight: 220,
        backgroundColor: Color(0xffF4F6F5),
        title: Column(

          children: [
            Container(
              padding: EdgeInsets.only(right: 22.w),
              child: Column(

                children: [

                  Container(
                    child: Row(

                      children: [
                        Text(
                          "Wellcome Back, Mark!",
                          style: GoogleFonts.lato(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff1C1F1E)),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          "assets/logo/icon notification.svg",
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/logo/icon location.svg"),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Warsaw, Poland",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Color(0xffA7A6A5)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 18.w),
                          width: 260.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
child: TextField(
  controller: _searchContorller,
  decoration: InputDecoration(border: InputBorder.none,icon: Icon(Icons.search,color: Colors.black12,),hintText: "Search Here",hintStyle: GoogleFonts.lato(color:Colors.black12,fontWeight: FontWeight.w500,fontSize: 16)),
),






                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff66CA98),
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.only(left: 9.w, right: 9.w),
                          height: 40.h,
                          width: 40.w,
                          child: SvgPicture.asset("assets/logo/icon filter.svg"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //cont 1 en.......................................................................................................................
            SizedBox(
              height: 14.h,
            ),
            //list.......................................................................
            Container(
              height: 26.h,
              child: ListView.separated(

                scrollDirection: Axis.horizontal,
                itemCount: facilitySuggestions.length,
                itemBuilder: (context, index) {
                  return Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 17.w, right: 18.w, top: 5.h, bottom: 6.h),
                      decoration: BoxDecoration(
                          color: Color(0xffEFF2F1),
                          borderRadius: BorderRadius.circular(2.r)),
                      child: Text(
                        facilitySuggestions[index],
                        style: GoogleFonts.lato(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA7A6A5)),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
              ),
            ),

          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF4F6F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //cont 1 start.................................................................................................................


              Container(
                padding: EdgeInsets.only(left: 22.w,right: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(" Recent",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
                        Spacer(),
                        TextButton(onPressed: () {
                          isVisiblity=true;

                        },
                        child: Text("See all",style: GoogleFonts.lato(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E))),),
                      ],
                    ),
                    SizedBox(height: 11.h,),
                    //dr 1.................................................................
                    GestureDetector(onTap: (){
                      bottomState.screenController.add(doctorview(backvalues: {"name":name[0],"pes":pesa[0]}));

                    },
                      child:  (tempList.isEmpty)?Container():Visibility(
                        visible: true,
                        child: ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context ,index){
                          return Container(
                            padding: EdgeInsets.only(left: 13.w,right: 10.w),
                            height: 90.h,
                            width: 362.w,
                            decoration: BoxDecoration(
                                color: Color(0xff6295E2),
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5)]),
                            child: Row(
                              children: [
                                Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 36.h,
                                              width: 36.w,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.r),),
                                              child: SvgPicture.asset("assets/logo/female-doctor-icon.svg", height: 71.h, width: 48.w),
                                            ),
                                            SizedBox(width: 8.w,),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    tempList[index]['name'].toString(),
                                                    style: GoogleFonts.lato(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 16.sp,
                                                        color: Color(0xffFFFFFF)),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    tempList[index]['pes'].toString(),
                                                    style: GoogleFonts.lato(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 12.sp,
                                                        color: Color(0xffE0EAF9)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                      Container(
                                        child:Row(
                                          children: [
                                            Icon(Icons.calendar_today_outlined,
                                                color: Color(0xffFFFFFF)),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(tempList[index]['date']+"-"+tempList[index]['month'],
                                              style: GoogleFonts.lato(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                            SizedBox(
                                              width: 22.w,
                                            ),
                                            Icon(Icons.lock_clock, color: Color(0xffFFFFFF)),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(tempList[index]['time'],
                                              style: GoogleFonts.lato(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(

                                      child: Row(

                                        children: [
                                          Text("(220 reviews)",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 12.sp,color: Color(0xffE0EAF9),)),
                                          SizedBox(width: 2.w),
                                          Icon(Icons.star,color: Color(0xffF4A3EC)),
                                          SizedBox(width: 2.w),
                                          Text("4.8",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 33.h),
                                    Text("80",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                  ],
                                ),

                              ],
                            ),
                          );
                        }, separatorBuilder: (BuildContext context,int index){
                          return SizedBox(height: 10,);
                        }, itemCount: tempList.length),
                      )
                    ),
//dr 1 end............................................................................................................................

//blood test............................................................................................................................
                SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.only(left: 13.w),
                      height: 90.h,
                      width: 362.w,
                      decoration: BoxDecoration(
                          color: Color(0xffFF6C52),
                          borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5)]),
                      child: Row(
                        children: [
                          Container(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Blood test",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),
                                SizedBox(height: 1.h),
                                Text("Duis hendrerit ex nibh, non",style: GoogleFonts.lato(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Color(0xffE0EAF9))),
                                SizedBox(height: 14.h),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today_outlined,color: Color(0xffFFFFFF),),
                                    SizedBox(width: 5.w),
                                    Text(currenttime.day.toString()+"-"+monthName,style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Color(0xffF4F6F5)),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60.w),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/logo/blood.svg"),
                                SizedBox(height: 7.h),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/logo/blood.svg",height: 22.h,width: 17.w,),
                                      SizedBox(width: 43.w),
                                      SvgPicture.asset("assets/logo/blood.svg",height: 22.h,width: 17.w,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    //blood test end...........................................................................................................
                    //categories...................................................................................................
                    SizedBox(height: 20.h,),
                    Text("Categories",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18.sp,color: Color(0xff1C1F1E)),),
                    //categories end....................................................................................
                  ],
                ),
              ),
              SizedBox(height:11.h ,),
              Container(
                height: 70.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesName.length,

                  itemBuilder: (context, index) {
                    return Flexible(
                      child: Container(

                        padding: EdgeInsets.only(
                            left: 17.w, right: 17.w, top: 5.h, bottom: 4.h),
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(categoriesPic[index]),
                            SizedBox(height: 9.h),
                            Text(
                              categoriesName[index],
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA7A6A5)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h,),
              //dr 2...........................................................................................................................
                 Container(
                  padding: EdgeInsets.only(left: 22.w,right: 22.w),
                  child:
                      Row(
                        children: [
                          Text("Popular Doctors",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
                          Spacer(),
                          GestureDetector(
                              onTap: (){

                              },
                              child: Text("See all",style: GoogleFonts.lato(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),)),
                        ],
                      ),



                ),
              SizedBox(height: 12.h),
              Container(
padding: EdgeInsets.only(left: 22.w,right: 22.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),


                  itemCount: copyName.length ,
                  itemBuilder: (BuildContext context, int index) {

                    return      IgnorePointer(
                      ignoring: false,
                      child: GestureDetector(
                        onTap: ()async{
                          // SharedPreferences prefs=await SharedPreferences.getInstance();
                         bottomState.screenController.add(doctorview(backvalues:{"name":copyName[index].toString(),"pes":copyPes[index]}));
                         // prefs.setString("recentVisit", copyName[index].toString());
                         // prefs.setString("pes", copyPes[index].toString());
                        //Navigator.pushNamed(context, '11' ,arguments: {"name":Names[index],"pes":pes[index]});
                        /*PersistentNavBarNavigator.pushNewScreen(
                          context,
                            screen: doctorview(),



                        );*/


                        },

                        child: Container(

                          padding: EdgeInsets.only(left: 13.w),
                          height: 62.h,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            children: [
                              Container(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 36.h,
                                            width: 36.w,
                                            decoration: BoxDecoration(color: Color(0xffA7A6A5), borderRadius: BorderRadius.circular(5.r)),
                                            child: SvgPicture.asset("assets/logo/female-doctor-icon.svg", height: 71.h, width: 48.w),
                                          ),
                                          SizedBox(width: 10.w),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  copyName[index],
                                                  style:GoogleFonts.lato(fontWeight: FontWeight.w400,
                                                      fontSize: 16.sp,
                                                      color: Color(0xff1C1F1E)),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  pes[index],
                                                  style: GoogleFonts.lato(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12.sp,
                                                      color: Color(0xffA7A6A5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(top: 16.w,right: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Row(

                                        children: [
                                          Text("(220 reviews)",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 12.sp,color: Color(0xffE0EAF9),)),
                                          SizedBox(width: 2.w,),
                                          Icon(Icons.star,color: Color(0xffF4A3EC)),
                                          SizedBox(width: 2.w,),
                                          Text("4.8",style: GoogleFonts.lato(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),),
                    );

                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );

  }
  void DatelTimeMonth() async{
    SharedPreferences prf=await SharedPreferences.getInstance();
   /* date=prf.getString("date").toString();
    month=prf.getString("month").toString();
    time=prf.getString("time").toString();*/

    setState(() {

    });
  }
}
