import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'dart:developer' as dev;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic_app/dialogs/loadingDialog.dart';
import 'package:medical_clinic_app/dialogs/locationFetch.dart';

class fourthpage extends StatefulWidget {
   fourthpage({super.key});

  @override
  State<fourthpage> createState() => _fourthpageState();
}

class _fourthpageState extends State<fourthpage> {



  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {



      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        permission = await Geolocator.requestPermission();
        Fluttertoast.showToast(msg: "You have to now enable location permission manually");
        Geolocator.openAppSettings();

        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }


    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Geolocator.openAppSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

String? doctorsAddress;
bool changecolormale=false;
DateTime? datePicker;
bool changecolorfemale=false;
bool serviceEnable=false;
LocationPermission? permission;
Map<int,String> monthsMap={1:"Jan",2:"Feb",3:"Mar",4:"Apr",5:"May",6:"June",7:"July",8:"Aug",9:"Sep",10:"Oct",11:"Nov",12:"Dec"};
List conditionButton=[0,0,0];
loadingDialog loading =loadingDialog();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(

  child:   Container(


  height: MediaQuery.of(context).size.height,
          width: 896.w,
  color: Color(0xffF4F6F5),
          padding: EdgeInsets.only(top: 58.h,bottom: 35.h,left: 22.w,right: 22.w),

      child: Align(

      alignment: Alignment.center,

      child: Column(

      children: [

      SvgPicture.asset(

      'assets/logo/logo.svg',

      height: 32.h,

      width: 33.w,

      ),

      SizedBox(height: 40.h),

      Container(

      width: 362.w,

      child: Text(

      "A little about yourself",

      style: GoogleFonts.lato(

      fontSize: 28.sp,

      fontWeight: FontWeight.w600,

      color: Color(0xff1C1F1E)),

      textAlign: TextAlign.center,

      ),

      ),

      SizedBox(height: 8.h),

      Container(

      width: 362.w,

      child: Text(

      "Ed laoreet eros laoreet.",

      style: GoogleFonts.lato(

      fontSize: 14.sp,

      fontWeight: FontWeight.w500,

      color: Color(0xffA7A6A5),

      ),

      textAlign: TextAlign.center),

      ),

      SizedBox(height: 40.h),



            Container(

       child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [

                   Text("Your gender",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E))),

                   SizedBox(height: 15.h),

                   Container(



                     child:   Row(

                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,



                       children: [

                         Container(

                           decoration: BoxDecoration( color: Color(0xffEFF2F1),borderRadius: BorderRadius.circular(18.r)),

                           width: 150.w,

                           height: 80.h,



                           child: InkWell(
                             overlayColor:MaterialStatePropertyAll(Colors.white)
                             ,onTap: (){

  if(changecolormale){

    // changecolormale=false;
    conditionButton[0]=1;

  }else{

    changecolormale=true;

    changecolorfemale=false;
    conditionButton[0]=1;


  }
  print(conditionButton);

  setState(() {



  });

                           },

                             child: Row(

                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                               children: [



                                 Container(



                                   decoration: BoxDecoration(color: (changecolormale)?Color(0xff66CA98):Color(0xffF4F6F5),borderRadius: BorderRadius.circular(10.r)),

                                   height: 40.h,

                                   width: 45.w,



                                   child:

                                   SvgPicture.asset("assets/logo/icon male.svg",color: Colors.black,height: 28.h,width: 16.w,fit: BoxFit.scaleDown,),

                                 ),

                                 Text("Male",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w600,color: (changecolormale)?Color(0xff66CA98):Color(0xff1C1F1E)),),

                               ],

                             ),

                           ),

                         ),

                         Container(

                           decoration: BoxDecoration( color: Color(0xffEFF2F1),borderRadius: BorderRadius.circular(18.r)),

                           width: 150.w,

                           height: 80.h,



                           child: InkWell(
                             overlayColor: MaterialStatePropertyAll(Colors.white),
                             onTap: (){

                             if(changecolorfemale){

                              // changecolorfemale=false;
                               conditionButton[0]=1;


                             }else{

                               changecolorfemale=true;

                               changecolormale=false;

                             }

                             setState(() {



                             });

                           },

                             child: Row(

                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                               children: [



                                 Container(

                                     decoration: BoxDecoration(color: (changecolorfemale)?Color(0xff66CA98):Color(0xffF4F6F5),borderRadius: BorderRadius.circular(10.r)),

                                     height: 40.h,

                                     width: 45.w,

                                     child:Icon(Icons.female,size: 40.sp)),

                                 Text("Female",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w600,color: (changecolorfemale)?Color(0xff66CA98):Color(0xff1C1F1E)),),

                               ],

                             ),

                           ),

                         ),





                       ],



                     ),

                   ),

                    SizedBox(height: 22.h),

                    Text("Your birthday",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),

                   SizedBox(height: 10.h),



  GestureDetector(onTap: () async{
     datePicker=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2025));
    if(datePicker!=null){
      conditionButton[1]=1;

print(conditionButton);
    }
    // formattedDate="${datePicker!.day.toString()+" "+monthsMap[datePicker!.month].toString()} ${datePicker!.year}";

     setState(() {

    });
  },
    child: (datePicker==null)?Center(
      child: Container(height: 40.h,width:MediaQuery.sizeOf(context).width,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),color: Color(0xffF4F6F5),

        border: Border.all(color: Colors.black38)
      ),child: Container(
        padding: EdgeInsets.only(left: 10.w),
        child: Row(
          children: [
            Text("Select Your Date Of Birth",style:GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w400,color: Colors.black),),
          ],
        ),
      ),),
    ):Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black54),borderRadius: BorderRadius.circular(10)),
          width:79.w,
          height: 40.h,
          child: Center(child: Text(( (datePicker?.day)!=null)?datePicker!.day.toString()
                                    :"Select your Date of Birth",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black),)),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black54),borderRadius: BorderRadius.circular(10)),
          width:79.w,
          height: 40.h,
          child: Center(child: Text(((monthsMap[datePicker!.month])!=null)?monthsMap[datePicker!.month].toString()
              :"Select your Date of Birth",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black),)),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black54),borderRadius: BorderRadius.circular(10.r)),
          width:79.w,
          height: 40.h,
          child: Center(child: Text(( (datePicker?.year)!=null)?datePicker!.year.toString()
              :"Select your Date of Birth",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black),)),
        ),
      ],
    ),
  ),


                   SizedBox(height: 22.h),

                   Text("Your location",style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),

                   SizedBox(height: 10.h),

GestureDetector(onTap: () async{


/// permissiopn and service is checked here
   ///
  _determinePosition().then((value) async {
    try{
      if(doctorsAddress==null)
      {

        locationFetch locaFetch=locationFetch();
        showDialog(context: context, builder: (context){
          return locaFetch;
        });

         /// api to convert lat and long into actual addresses
        var req=await get(Uri.parse("https://api.opencagedata.com/geocode/v1/json?q=${value.latitude}+${value.longitude}&key=260bccb904494817bd746b19366d339a"));
        //dev.log("wihtout json ${req.body}");
        var json=jsonDecode(req.body);
        // print("pppp");
        //  dev.log("with json "+Map.from(json).toString());
        Map<String,dynamic> locationData=Map.from(json);
        dev.log(locationData["results"][0]["components"].toString());
        doctorsAddress=locationData["results"][0]["components"]["city"]+","+locationData["results"][0]["components"]["state"]+", "+locationData["results"][0]["components"]["state_district"]+", "+locationData["results"][0]["components"]["suburb"];
        print(doctorsAddress);
        EasyLoading.dismiss();
        conditionButton[2]=1;
      print(conditionButton);
      Navigator.pop(context);
      }
      else
      {
        await EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "Location already in use.");

      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: "Please contact devs");
    }
setState(() {

});


  });


},
  child:   Container(height: 40.h,width:MediaQuery.sizeOf(context).width,decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15.r),color: Color(0xffF4F6F5),

    border: Border.all(color: Colors.black38)),
    child: Container(
      padding: EdgeInsets.only(left: 10.w),
      child: Row(


        children: [

      Stack(

        children: [

          Center(child: Icon(Icons.circle_outlined,size: 20.sp,color: Color(0xff66CA98))),

          Center(
            child: Container(

                padding: EdgeInsets.only(left: 4.5.w,top: 7.5.h,right: 7.w,bottom: 7.h),

                child: Icon(Icons.location_on_outlined,size: 12.sp,color: Color(0xff66CA98),)),
          ),

        ],

      ),

          SizedBox(width: 6.w),

          Flexible(
                child: Text((doctorsAddress==null)?"Select Your Location":doctorsAddress!,style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black),)),


        ],

      ),
    ),
  ),
),
                 ],

               ),



            ),

  Spacer(),



  ElevatedButton(onPressed: () {

     if(!conditionButton.contains(0))
      {
        showDialog(context: context, builder: (context){
          return loading;

        });
        Future.delayed(Duration(seconds: 3)).then((value) {
Navigator.pop(context);
        Navigator.pushNamed(context, '5');
        });
      }



  /*  if (changecolorfemale || changecolormale) {
      if (datePicker != null) {
        if (doctorsAddress != null) {

        }
      }

    }
    else{
      Fluttertoast.showToast(msg:"Please Fill the Details first");
setState(() {

});
    }*/


  },child: Text("Continue",style: GoogleFonts.lato(fontSize: 16.sp,fontWeight: FontWeight.w600),),

        style: ElevatedButton.styleFrom(

          backgroundColor:(!conditionButton.contains(0))? Color(0xff66CA98):Colors.black12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.r)),

          fixedSize: Size(160.w, 40.h),

        ),

  )

      ],

      ),

      ),

  ),
),
    );
  }


}
