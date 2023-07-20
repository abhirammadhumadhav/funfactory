import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignUp() async{

  try{
   GoogleSignInAccount? user = await GoogleSignIn().signIn();

   if(user != null){
    final GoogleSignInAuthentication auth = await user.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken:auth.accessToken ,
      idToken: auth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
   } 

     
  }on FirebaseAuthException  catch (e) {
    log(e.message!);
    rethrow;
  }


}