import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class doctorview2 extends StatefulWidget {
  String name = "";
  String pes = "";
   doctorview2({super.key,required this.name,required this.pes});

  @override
  State<doctorview2> createState() => _doctorview2State();
}

class _doctorview2State extends State<doctorview2> {
  @override
  initState() {
    super.initState();
    creationOfDates();
    convertingMonthtoString();
  }

  List<String> NumberOfDays = [];
  List<Color> colorsOnChane = [];

  creationOfDates() {
    for (int i = DateTime.now().day; i <= 31; i++) {
      NumberOfDays.add(i.toString());
      colorsOnChane.add(Colors.white);
    }
    print(colorsOnChane);
  }

  bool showVisitCanceledString = false;
  DateTime currenttime = DateTime.now();
  List remainingIndex = [];
  Iterable reversedList = [];
  int monthInFucntion = 1;
  String monthName = "Jan";
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

  List<String> selectionTime=["9:00","12:00","13:00","16:00","16:45"];
  void convertingMonthtoString() {
    monthInFucntion = currenttime.month;
    monthName = months[monthInFucntion! - 1];
    setState(() {});
  }

  Color colorOnSelect = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                              widget.name,
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(widget.pes,
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
                    Container(
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
                      height: MediaQuery.of(context).size.height/10,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                for (int i = 0; i < NumberOfDays.length; i++) {
                                  if (i == index) {
                                    colorsOnChane[i] = Colors.green;

                                    continue;
                                  }

                                  colorsOnChane[i] = Colors.white;
                                }

                                setState(() {});
                              },
                              child: Container(

                                width: 79,
                                padding: EdgeInsets.only(top:17),
                                decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color: colorsOnChane[index],),
                                child: Column(
                                  children: [
                                    Text(NumberOfDays[index],style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                                    SizedBox(height: 2,),
                                    Text(monthName,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black12),),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return    SizedBox(
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
              SizedBox(height: 11,),

              Container(
                padding: EdgeInsets.only(left: 26, right: 26),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 0),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectionTime.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent:55,
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 42,
                          width: 83,
                          decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(10)),
                          child: Text(selectionTime[index]),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 29,),
              Container(
                padding: EdgeInsets.only(left: 26,right: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Doctor",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                    SizedBox(height: 11,),
                    Text("Pellentesque placerat arcu in risus facilisis, sed laoreet eros laoreet...",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5)),),
                  ],
                ),


              ),
              SizedBox(height: 29,),
              Container(
                padding: EdgeInsets.only(left: 26,right: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                    SizedBox(height: 11,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.black,size: 24,),
                        SizedBox(width: 6,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("3891 Ranchview Dr.",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                            Text(" Richardson,",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                            Text("San Francisco 62639",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                          ],
                        ),
                        SizedBox(width: 30,),

                        Icon(Icons.local_hospital_sharp,color: Colors.black,size: 24,),
                        SizedBox(width: 6,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jane Cooper,",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                            Text("Medical College",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
                          ],
                        ),

                      ],
                    ),

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
