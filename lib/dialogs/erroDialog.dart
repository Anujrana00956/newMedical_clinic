import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class userAlreadyExists extends StatefulWidget {
  String text;
   userAlreadyExists({super.key,required this.text});

  @override
  State<userAlreadyExists> createState() => _userAlreadyExistsState();
}

class _userAlreadyExistsState extends State<userAlreadyExists> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),color: Colors.white,
        ),
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/loaders/alreadyExistjson.json"),
            Text(widget.text,style: TextStyle(color: Colors.black,fontSize:20),textAlign: TextAlign.center),
            SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
             Navigator.pop(context);
           }, child: Text("Dismiss",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w900),),style: ElevatedButton.styleFrom(shape: StadiumBorder(),fixedSize: Size(100, 50),backgroundColor: Colors.lightBlue)),
          ],
        ),
      ),
    );
  }
}
