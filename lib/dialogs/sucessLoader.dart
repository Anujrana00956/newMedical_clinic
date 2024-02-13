import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class sucessLoader extends StatefulWidget {

  const sucessLoader({super.key});

  @override
  State<sucessLoader> createState() => _sucessLoaderState();
}

class _sucessLoaderState extends State<sucessLoader> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(

        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/loaders/Sucess.json"),
          ],
        ),
      ),
    );
  }
}
