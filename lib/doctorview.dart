import 'dart:async';
import 'dart:convert';

import    'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medical_clinic_app/eight.dart';
import 'package:medical_clinic_app/payment.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class doctorview extends StatefulWidget {
  Map<String, String> backvalues = {};
  doctorview({super.key, required this.backvalues});
  static int onPageChange=0;

  @override
  State<doctorview> createState() => _doctorviewState();
}

class _doctorviewState extends State<doctorview> {
  @override
  initState() {
    super.initState();
    creationOfDates();
    convertingMonthtoString();
    bottomState.onPageChange=12;
    print("onSubmit"+onSubmitSavedData.toString());

  }

  



  List<String> hospitals=["Zonal Hospital, \n Dharamshala","Civil Hospital, \n Palampur","Civil Hospital, \n Kangra"];
  String locationSelected="";
  List addressoflocation=["Dharamshala","Palampur","Kangra"];
  GoogleMapController? _controller;
  String addressOfSelectedlocation="";
  List<dynamic> coordinates=[const LatLng(32.2190 ,76.3234),const LatLng(32.10781006, 76.53469797),const LatLng( 32.099804, 76.269104)];
  LatLng selectedlats=LatLng(72.190 ,06.3234);

  String Timeselectedtime = "";
  bool doneSlide=false;
  bool paySlide=false;

  String dateselectedDate = "";
  String monthSelected = "";
  List<String> NumberOfDays = [];
  List<Color> colorsOnChane = [];
  String appointmentStatus = "Make Appointment";
  String ProceedPayment = "Proceed for Payment";
  loadingDialog loading = loadingDialog();

  static List<String> onSubmitSavedData=[];
  Map<String,dynamic> onSubmitSavedDataMap={};
  creationOfDates() {
    for (int i = DateTime.now().day; i <= 31; i++) {
      NumberOfDays.add(i.toString());
      colorsOnChane.add(Colors.white);
    }
    print(colorsOnChane);
  }


  bool showVisitCanceledString = false;
  bool showpayment = false;
  bool Makeappointment = false;
  bool Makepayment = false;
  bool showtime = false;
  bool Showlocation = false;
  bool ShowButton = false;
  bool showAliderArrowOnSuccessfulAppointment = true;
  bool showAliderArrowOnSuccessfulpayment = true;
  bool showAppointmentSlider = false;
  List<Color> appointmentTimeSelectionColors = [
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF)
  ];

  DateTime currenttime = DateTime.now();
  List remainingIndex = [];
  Iterable reversedList = [];
  int monthInFucntion = 1;
  String monthName = "Jan";
  String years = "2024";
  List<String> year=["2024","2025","2026"];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "june",
    "july",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> selectionTime = ["9:00", "12:00", "13:00", "16:00", "16:45"];
  void convertingMonthtoString() {
    monthInFucntion = currenttime.month;
    monthName = months[monthInFucntion! - 1];
    setState(() {});
  }

  Color colorOnSelect = Colors.white;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Material(
          elevation: 0,
          color: Colors.transparent,
          child: Visibility(
            visible: showAppointmentSlider,
            child: Container(width: MediaQuery.sizeOf(context).width*.8,
              height: 150,
              child: FloatingActionButton(
                highlightElevation: 0,
                  elevation: 0,
                  splashColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  child:Column(

                    children: [
                      Visibility(

                        visible: showAppointmentSlider,
                        child: Container(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: HorizontalSlidableButton(
      tristate: true,
                            autoSlide: true,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            buttonWidth: 60.0,
                            color: (Makeappointment)
                                ? Color(0xff66CA98)
                                : Colors.brown.shade200,
                            dismissible: false,
                            label: Visibility(
                              visible: showAliderArrowOnSuccessfulAppointment,
                              child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xff676A69),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ],
                                  )),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: (doneSlide)?SpinKitChasingDots(size: 20,color: Colors.red,):Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.circle_rounded,
                                      size: 8, color: Colors.white),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    appointmentStatus,
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                ],
                              ),
                            ),
                            onChanged: (position)  async{

                                if (position == SlidableButtonPosition.end) {
                                  appointmentStatus =
                                  "Appointment Scheduled Successfully";
                                  showAliderArrowOnSuccessfulAppointment = false;
                                  Makeappointment = true;
                                  doneSlide=true;
                                  setState((){});





                                }
                                ///this is to actually disable the spinkit after 2 seconds of the slide button , ended slide
                                ///
                                await Future.delayed(Duration(seconds: 2));
                                HapticFeedback.heavyImpact();
                                doneSlide=false;
                                showpayment=true;

                                setState((){});


                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Visibility(

                        visible: showpayment,
                        child: Container(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: HorizontalSlidableButton(
                            autoSlide: true,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            buttonWidth: 60.0,
                             color: (Makepayment)?Color(0xff66CA98):Colors.redAccent,
                            dismissible: false,
                            label: Visibility(
                              visible: showAliderArrowOnSuccessfulpayment,
                              child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xff676A69),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ],
                                  )),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: (paySlide)?SpinKitChasingDots(size: 20,color: Colors.red,):Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.circle_rounded,
                                      size: 8, color: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    ProceedPayment,
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                ],
                              ),
                            ),
                            onChanged: (position) async{
                              setState(() {
                                if (position == SlidableButtonPosition.end) {
      paySlide=true;
      setState((){});






      ///this is to actually disable the spinkit after 2 seconds of the slide button , ended slide
      ///




                                  ProceedPayment =
                                  "Please Wait....";
      showAliderArrowOnSuccessfulpayment = false;
                                  Makepayment = true;


                                }
                              });
                              /// inititalxed a maop
                              ///


                              onSubmitSavedDataMap={"name":widget.backvalues['name'],"date":dateselectedDate,"month":monthName,"time":Timeselectedtime,"pes":widget.backvalues['pes']};

                             try
                             {

                                 onSubmitSavedData.add(jsonEncode(onSubmitSavedDataMap))  ;

                               print("onSubmit"+onSubmitSavedData.toString());

                               SharedPreferences prefg= await SharedPreferences.getInstance();
                               prefg.setStringList("date",onSubmitSavedData);
                               List<String> abc= await prefg.getStringList("date")!;
                               print("abc"+abc.toString());
                             }
                             catch (e)
                              {
                                print("try and catch "+e.toString());
                              }


                              /*prefg.setString("month", monthName);
                              prefg.setString("time", Timeselectedtime);
                              prefg.setString("nameuser",widget.backvalues["name"]!);
                              prefg.setString("pesuser",widget.backvalues["pes"]!);*/

setState(() {

});

                              await Future.delayed(Duration(seconds: 2));
                              HapticFeedback.heavyImpact();
                              paySlide=false;
                              showpayment=true;

                              setState((){});
                              Future.delayed(Duration(seconds: 3)).then((value) {
                                Navigator.pop(context);
                                bottomState.screenController.add(payment());
                              });
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return loading;
                                  });
                            },
                          ),
                        ),
                      ),

                    ],
                  ),

                  onPressed: (){

              }),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF4F6F5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //1st child..................................................................................................................

                Container(
                  padding:
                      EdgeInsets.only(left: 26, top: 70, right: 24, bottom: 39),
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          bottomState.screenController.add(eight());
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                            ),
                            Text(
                              "Back",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 92,
                            width: 92,
                            color: Colors.green,
                            child: Stack(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffA7A6A5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: SvgPicture.asset(
                                        "assets/logo/female-doctor-icon.svg")),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 26,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5))),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffF4A3EC),
                                          size: 16,
                                        ),
                                        Text(
                                          "4.8",
                                          style: GoogleFonts.lato(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.backvalues["name"]!,
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(widget.backvalues["pes"]!,
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffA7A6A5))),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Color(0xff66CA98),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.message,
                                      size: 20,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Color(0xff6295E2),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.call,
                                      size: 20,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Color(0xffA7A6A5),
                                    size: 8,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Color(0xffA7A6A5),
                                    size: 8,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Color(0xffA7A6A5),
                                    size: 8,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "@80",
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 14,
                ),

                //2nd child...........................................................................................................................

                Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: false,
                        child: Container(
                          padding: EdgeInsets.only(right: 26),
                          child: HorizontalSlidableButton(
                            autoSlide: true,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            buttonWidth: 60.0,
                            color: (showVisitCanceledString)
                                ? Colors.green
                                : Colors.red,
                            dismissible: false,
                            label: (showVisitCanceledString)
                                ? Center(
                                    child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Color(0xff676A69),
                                      ),
                                      Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ],
                                  ))
                                : Center(
                                    child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xff676A69),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ],
                                  )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (showVisitCanceledString)
                                      ? Text(
                                          "Restore your visit",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        )
                                      : Text(
                                          "Slide to cancel a visit",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                ],
                              ),
                            ),
                            onChanged: (position) {
                              setState(() {
                                if (position == SlidableButtonPosition.end) {
                                  showVisitCanceledString = true;

                                  Fluttertoast.showToast(msg: "Visit Canceled");
                                } else if (position ==
                                    SlidableButtonPosition.start) {
                                  showVisitCanceledString = false;

                                  Fluttertoast.showToast(msg: "Visit Restored");
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Patients",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffA7A6A5)),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 58,
                                  width: 107,
                                  padding: EdgeInsets.only(top: 18, bottom: 18),
                                  decoration:
                                      BoxDecoration(color: Color(0xffEFF2F1)),
                                  child: Text(
                                    "+423",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Experiences",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffA7A6A5)),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 58,
                                  width: 107,
                                  padding: EdgeInsets.only(top: 18, bottom: 18),
                                  decoration:
                                      BoxDecoration(color: Color(0xffEFF2F1)),
                                  child: Text(
                                    "+8 year",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Ratings",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffA7A6A5)),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 58,
                                  width: 105,
                                  padding: EdgeInsets.only(top: 18, bottom: 18),
                                  decoration:
                                      BoxDecoration(color: Color(0xffEFF2F1)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4.8",
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffF4A3EC),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Text(
                        "Schedule",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),

                //3rd child........................................................................................................................

                Container(
                  padding: EdgeInsets.only(left: 26),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 11,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async{
                                  showtime = true;
                                  for (int i = 0; i < NumberOfDays.length; i++) {
                                    if (i == index) {
                                      colorsOnChane[i] = Color(0xff66CA98);
                                      continue;
                                    }

                                    colorsOnChane[i] = Colors.white;
                                  }

                                  dateselectedDate = NumberOfDays[index];
                                  setState(() {});
                                  Fluttertoast.showToast(
                                      msg: NumberOfDays[index].toString());
                                },
                                child: Container(
                                  width: 79,
                                  padding: EdgeInsets.only(top: 17),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorsOnChane[index],
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        NumberOfDays[index],
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        monthName,
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: NumberOfDays.length),
                      ),
                    ],
                  ),
                ),

                //4rth...........................................................................................................................

                SizedBox(
                  height: 29,
                ),
                Visibility(
                  visible: showtime,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 26, right: 26),
                          child: Text(
                            "Time",
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 26, right: 26),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                            padding: EdgeInsets.only(top: 0),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: selectionTime.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              mainAxisExtent: 55,
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Showlocation = true;

                                  if (appointmentTimeSelectionColors[index] ==
                                      Colors.white) {
                                    for (int i = 0;
                                        i < appointmentTimeSelectionColors.length;
                                        i++) {
                                      if (index == i) {
                                        appointmentTimeSelectionColors[index] =
                                            Color(0xff66CA98);
                                      } else {
                                        appointmentTimeSelectionColors[i] =
                                            Colors.white;
                                      }
                                    }
                                  }

                                  Fluttertoast.showToast(
                                      msg: selectionTime[index].toString());
                                  Timeselectedtime =
                                      selectionTime[index].toString();
                                  print(widget.backvalues[Timeselectedtime]);

                                  setState(() {});
                                },
                                child: Center(
                                  child: Container(
                                    height: 42,
                                    width: 83,
                                    decoration: BoxDecoration(
                                        color:
                                            appointmentTimeSelectionColors[index],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      selectionTime[index],
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Doctor",
                        style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        "Pellentesque placerat arcu in risus facilisis, sed laoreet eros laoreet...",
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A6A5)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Visibility(
                        visible: Showlocation,
                        child: Container(

                          height: 60,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: ListView.separated(itemCount: 3,scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return     GestureDetector(
                                onTap: (

                                    ){
                                  showAppointmentSlider=true;
                                  locationSelected=hospitals[index];
                                  addressOfSelectedlocation=addressoflocation[index];
                                  selectedlats=coordinates[index];
                                  _controller?.animateCamera(CameraUpdate.newLatLng(selectedlats));
                                  Fluttertoast.showToast(msg: selectedlats.toString());

                                  setState(() {

                                  });
                                },
                                child: Flexible(
                                  child:
                                  Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                    height: 60,
                                    child: Text(hospitals[index],textAlign: TextAlign.center
                                    ),decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(15),
                                      color: Colors.grey.shade300
                                  ),),

                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 10,); },),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),


                      Visibility(
                        visible: showAppointmentSlider,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                              size: 24,
                            ),
                            Text(  addressOfSelectedlocation
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.local_hospital_sharp,
                              color: Colors.black,
                              size: 24,
                            ),
                            Text(locationSelected),

                            SizedBox(
                              width: 6,
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          onMapCreated: (controller){
                            _controller=controller;
                          },
                          myLocationEnabled: true,


                          mapType: MapType.terrain,
                          initialCameraPosition: CameraPosition(
                            target: selectedlats,
                            zoom: 12.0,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId('India'),
                              position: selectedlats,
                            )
                          },
                        ),
                      )
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

  
}
