import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic_app/bottom.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/sucessupdate.dart';
import 'package:lottie/lottie.dart';
import 'package:upi_india/upi_app.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  //bool isCheckedBox=false;

  List<String> PaymentMethod = [
    "Paytm",
    "Phone Pay",
    "Google Pay",
    "Amazon Pay",
    "Paypal"
  ];
  List<String> PaymentPic = [
    "assets/logo/Paytm-Logo.wine.svg",
    "assets/logo/PhonePe-Logo.wine.svg",
    "assets/logo/Google_Pay-Logo.wine.svg",
    "assets/logo/Amazon_Pay-Logo.wine.svg",
    "assets/logo/PayPal-Logo.wine.svg"
  ];
  // List listofCheckboxex=List.empty(growable: true);
  List bitImage = [0, 0, 0, 0, 0];
  int? isChecked;
  String bottomSheetImageAssets = "";
  loadingDialog loader = const loadingDialog();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(isChecked.toString());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          title: Text(
            "Back",
            style: GoogleFonts.lato(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          backgroundColor: const Color(0xffF4F6F5),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 18,
                ));
          }),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 26, right: 26),
          color: const Color(0xffF4F6F5),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Paymemt Options",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: ListView.separated(
                        padding: const EdgeInsets.only(top: 70),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return loader;
                                  });
                              Future.delayed(const Duration(seconds: 3))
                                  .then((value) {
                                Navigator.pop(context);
                                showBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            topLeft: Radius.circular(50))),
                                    backgroundColor: Colors.grey.shade300,
                                    context: context,
                                    builder: (contex) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.sizeOf(context)
                                                    .height *
                                                .01,
                                            left: 22,
                                            right: 22),
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                2,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white38,
                                                  blurRadius: 10)
                                            ]),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 8,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            const SizedBox(height: 15),
                                            SvgPicture.asset(
                                                bottomSheetImageAssets,
                                                height: 50),
                                            Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              elevation: 0,
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Lottie.asset(
                                                  "assets/loaders/update.json",
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Transisation Id"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text("Payment status"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text("From"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text("Amount"),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(":"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(":"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(":"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(":"),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("22561024784575895"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text("Paid"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text("Team of HealthCare"),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text("90 Rs"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              });
                              print(PaymentPic[index].toString());
                              bottomSheetImageAssets =
                                  PaymentPic[index].toString();
                              isChecked = index;

                              setState(() {});
                            },
                            child: Container(
                              height: 74,
                              padding:
                                  const EdgeInsets.only(left: 28, right: 28),
                              decoration: BoxDecoration(
                                color: const Color(0xffEFF2F1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      shape: const CircleBorder(),
                                      activeColor: Colors.green,
                                      value: (isChecked == index),
                                      onChanged: (value) {
                                        bottomSheetImageAssets =
                                            PaymentPic[index].toString();
                                        print(PaymentPic[index].toString());
                                        isChecked = index;

                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return loader;
                                            });
                                        Future.delayed(
                                                const Duration(seconds: 3))
                                            .then((value) {
                                          Navigator.pop(context);
                                          showBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .only(
                                                              topRight: Radius
                                                                  .circular(50),
                                                              topLeft:
                                                                  Radius
                                                                      .circular(
                                                                          50))),
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              context: context,
                                              builder: (contex) {
                                                return Container(
                                                  padding: EdgeInsets.only(
                                                      top: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          .01,
                                                      left: 22,
                                                      right: 22),
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height /
                                                          2,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.white38,
                                                            blurRadius: 10)
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 8,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade400,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      SvgPicture.asset(
                                                          bottomSheetImageAssets,
                                                          height: 50),
                                                      Dialog(
                                                        child: Container(
                                                          child: Lottie.asset(
                                                            "assets/loaders/update.json",
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "Transisation Id"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text(
                                                                  "Payment status"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text("From"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text("Amount"),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(":"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text(":"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text(":"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text(":"),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "22561024784575895"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text("Paid"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text(
                                                                  "Team of HealthCare"),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Text("90 Rs"),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        });

                                        setState(() {});
                                      }),
                                  // Text(PaymentMethod[index],style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),

                                  SvgPicture.asset(
                                    PaymentPic[index],
                                    height: 40,
                                    width: 40,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 14,
                          );
                        },
                        itemCount: PaymentMethod.length),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // ElevatedButton(onPressed: (){
                        //
                        //
                        //
                        //
                        // }, child: Text("PAY",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),),
                        //   style: ElevatedButton.styleFrom(fixedSize: Size(150, 50),
                        //     backgroundColor: Color(0xff66CA98),
                        //     shape: StadiumBorder(),
                        //
                        //   ),),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
