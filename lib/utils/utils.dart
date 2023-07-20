import 'package:flutter/material.dart';

class utils{
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackbar(String? text){
    if(text == null) return;
  final snackbar =   SnackBar(content: Text(text));
    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackbar);
  }

}