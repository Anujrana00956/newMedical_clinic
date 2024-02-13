import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_clinic_app/bottom.dart';
class recipe extends StatefulWidget {
  const recipe({super.key});

  @override
  State<recipe> createState() => _recipeState();
}

class _recipeState extends State<recipe> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomState.onPageChange=2;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70,left: 24,right: 26),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text("< Back",style:GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
  SizedBox(height: 12,),
  Text("Recipes",style:GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
SizedBox(height: 23,),
Row(
  children: [
    Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(8)),
      child: SvgPicture.asset("assets/logo/female-doctor-icon.svg"),

    ),
    SizedBox(width: 10,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text("Dr. Jacob Jones",style: GoogleFonts.lato(fontSize: 22,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
        SizedBox(height: 3,),
        Text("Nephrologyst",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),






      ],
    ),
  ],
),
  SizedBox(height: 18,),

  Container(
    height: 90,
    width: 362,

    decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(5)),
    child: Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(color: Color(0xffFFF7DC),borderRadius: BorderRadius.circular(8)),
            child: new Image.asset("assets/logo/icons8-capsule-78.png")

          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7,),
              Text("Doxepin",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
              SizedBox(height: 3,),
              Text("1 pill before sleep (take 1 mounth)",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
            ],
          ),

        ],
      ),
    ),
  ),
SizedBox(height: 12,),
  Container(
    height: 90,
    width: 362,

    decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(5)),
    child: Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(color: Color(0xffE0EAF9),borderRadius: BorderRadius.circular(8)),
              child: new Image.asset("assets/logo/icons8-capsule-78.png")

          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7,),
              Text("Magnesium - Nutri Within",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
              SizedBox(height: 3,),
              Text("1 pill after eating (take 21 days)",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
            ],
          ),

        ],
      ),
    ),
  ),
SizedBox(height: 28,),
  Row(
    children: [
      Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(8)),
        child: SvgPicture.asset("assets/logo/female-doctor-icon.svg"),

      ),
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Dr. Floyd Miles",style: GoogleFonts.lato(fontSize: 22,fontWeight: FontWeight.w400,color: Color(0xff1C1F1E)),),
          SizedBox(height: 3,),
          Text("Pediatrics",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),






        ],
      ),
    ],
  ),
  SizedBox(height: 12,),
  Container(
    height: 90,
    width: 362,

    decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(5)),
    child: Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(color: Color(0xffFFF7DC),borderRadius: BorderRadius.circular(8)),
              child: new Image.asset("assets/logo/icons8-capsule-78.png")

          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7,),
              Text("Vitamin A",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
              SizedBox(height: 3,),
              Text("1 pill after eating (take 14 days)",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
            ],
          ),

        ],
      ),
    ),
  ),
SizedBox(height: 12,),
Container(
  height: 170,
  width: 362,
  padding: EdgeInsets.only(left: 18,right: 18,top: 18),

  decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(10)),
  child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Recommendations for treatment",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
      SizedBox(height: 3,),
      Text("Quisque vestibulum nibh nibh, eget porta risus mollis ut. Aliquam erat volutpat. Praesent tincidunt massa eget nulla faucibus",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffA7A6A5)),),
      SizedBox(height: 17,),
      Row(
        children: [
          SvgPicture.asset("assets/logo/Ellipse 40.svg"),
          SizedBox(width: 8,),
          Text("Drink plenty of fluids ",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff1C1F1E)),)
        ],
      ),
      SizedBox(height: 4,),
      Row(
        children: [
          SvgPicture.asset("assets/logo/Ellipse 40.svg"),
          SizedBox(width: 8,),
          Text("Get out into the fresh air",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff1C1F1E)),)
        ],
      ),

    ],
  ),
),
  SizedBox(height: 12,),
  Container(
    height: 90,
    width: 362,

    decoration: BoxDecoration(color: Color(0xffFFFFFF),borderRadius: BorderRadius.circular(5)),
    child: Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(color: Color(0xffFFDCFB),borderRadius: BorderRadius.circular(8)),
              child: new Image.asset("assets/logo/icons8-capsule-78.png")

          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7,),
              Text("Vitamin B16",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff1C1F1E)),),
              SizedBox(height: 3,),
              Text("1 pill after eating (take 14 days)",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xffA7A6A5)),),
            ],
          ),

        ],
      ),
    ),
  ),


],
           ),

        ),
      ),
    );
  }
}
