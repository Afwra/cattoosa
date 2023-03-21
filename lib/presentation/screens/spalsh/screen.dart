import 'dart:async';

import 'package:cattoosa/cottoosa/core/constant/colors.dart';
import 'package:cattoosa/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.mainColor,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Image.asset("assets/images/splashscreen.png"),
          ),
          Text('CATTOOSA',
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
        ],
      ),
    );
  }
}
