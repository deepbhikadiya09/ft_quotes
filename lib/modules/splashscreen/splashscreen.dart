import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../homepage/FirstMainScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goNextscreen();
    // TODO: implement initState
    super.initState();
  }
  goNextscreen(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageApp()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text("Daily Motive",style: TextStyle(fontSize: 30,fontFamily: 'font'),))


    );
  }
}