import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class locationFetch extends StatefulWidget {
  const locationFetch({super.key});

  @override
  State<locationFetch> createState() => _locationFetchState();
}

class _locationFetchState extends State<locationFetch> {
  @override
  Widget build(BuildContext context) {
    return Dialog(

      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,

        ),
        child: Column(
          children: [
            Lottie.asset("assets/loaders/location.json"),
            Text("Fetching Location")
          ],
        ),),
    );
  }
}
