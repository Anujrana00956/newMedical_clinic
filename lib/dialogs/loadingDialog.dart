import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class loadingDialog extends StatefulWidget {
  const loadingDialog({super.key});

  @override
  State<loadingDialog> createState() => _loadingDialogState();
}

class _loadingDialogState extends State<loadingDialog> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(shadowColor: Colors.transparent,backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          color: Colors.transparent,
          height: 300,
          width: 100,
          child: Lottie.asset("assets/loaders/loading.json"),
        ));
  }
}
