import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/presentation/home_screen/home_screen.dart';
import 'package:funfactory/presentation/login_screen/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//List<Audio> fullsongs = [];

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome();
    startTimer();
    super.initState();
  }
  void startTimer(){
    Timer(Duration(seconds: 3), () { 
     navigateUser();
    });
  }
  void navigateUser(){
  if(FirebaseAuth.instance.currentUser != null){
   Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return HomeScreen();
   }));
  }
  else{
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return LoginScreen();
   }));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 241, 242),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 80,
          child: Container(
            child: Image.asset('lib/asset/image 1 (2).png'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return LoginScreen();
    }));
  }
}
