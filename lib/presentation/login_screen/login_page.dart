import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:funfactory/presentation/signup_screen/screen/sign_up_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../home_screen/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

  
class LoginScreenState extends State<LoginScreen> {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoginFailed = false;

  
   
   String?  validateEmail( value){
    if(value!.isEmpty){
      return 'enter Email';
    }
    String? regex=r'\w+@\w+\.\w+';
    RegExp emailRegExp = RegExp(regex);

    if(!emailRegExp.hasMatch(value)){
      return 'Please Enetr  A Valid Email';
    }
    return null;
  }
  // String?  validatePassword( value){
  //   if(value!.isEmpty){
  //     return 'enter Password';
  //   }
    
  //   return null;
  // }
  // Future<void> LogIn() async{
  //   final isValid = formkey.currentState!.validate();
  //   if(isValid) return;
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //      builder: (context) => CircularProgressIndicator()
  //      );
  //      try{
  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //                                         email: emailController.text,
  //                                          password: passwordController.text
  //       );
  //      }on FirebaseAuthException catch (e){
  //       print(e);
  //      utils.showSnackbar(e.message);
  //      }
  //      navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'lib/asset/—Pngtree—cartoon color dark blue abstract_943991.jpg',
                    // Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: Form(
                              key:formKey ,
                              child: SizedBox(
                                width: size.width * .9,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.width * .15,
                                        bottom: size.width * .1,
                                      ),
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    // component(
                                    //   Icons.account_circle_outlined,
                                    //   'User name...',
                                    //   false,
                                    //   false,
                                    // ),
                                    component1(Icons.email_outlined, 'Email...',
                                        false, true, emailController,),
                                    component2(Icons.lock_outline, 'Password...',
                                        true, false, passwordController,),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 170,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Forgotten password!',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();
                                                Fluttertoast.showToast(
                                                  msg:
                                                      'Forgotten password! button pressed',
                                                );
                                              },
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                          msg: 'Sign-In button pressed',
                                        );
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          // LogIn();

                                            if(formKey.currentState!.validate()){

                                          FirebaseAuth.instance.signInWithEmailAndPassword(
                                            email: emailController.text,
                                             password: passwordController.text
                                             ).then((value) {
                                             
                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                                                return  HomeScreen();
                                              }), (route) => false);
                                            //    Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           HomeScreen()),
                                            // );
                                             });
                                            }
                            
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            bottom: size.width * .05,
                                          ),
                                          height: size.width / 8,
                                          width: size.width / 1.25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(.1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            'LOGIN',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async{
                                         await signInWithGoogle();
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                                                return  HomeScreen();
                                              }), (route) => false);
                                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                                        //   return HomeScreen();
                                        // }), (route) => false);
                                      },
                                      child: const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('lib/asset/270014.png'),
                                      ),
                                    ),
                            
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Dont have an account?',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();
                                                Fluttertoast.showToast(
                                                  msg:
                                                      'Forgotten password! button pressed',
                                                );
                                              },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()),
                                            );
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'CREATE',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 5, 225, 24),
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SignUpScreen()),
                                                  );
                                                },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            
                                    SizedBox(height: size.width * .3),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
   
    signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleuser =  await GoogleSignIn().signIn();
      if(googleuser != null){
  final GoogleSignInAuthentication googleAuth = await googleuser.authentication;
 final  AuthCredential credential =  GoogleAuthProvider.credential(
      idToken:googleAuth.idToken ,
      accessToken:googleAuth.accessToken ,
    );
   await FirebaseAuth.instance.signInWithCredential(credential);
   
      }
    }on FirebaseAuthException catch (e) {
     log(e.message!);
      rethrow;
    }
    // print(userCredential.user?.displayName)
  }
   
   

  

  Widget component1(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController txtcontroller, ) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        maxLines: 1,
        validator: validateEmail,
        controller: txtcontroller,
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType:
            isEmail ? TextInputType.emailAddress : TextInputType.text,
        
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
  Widget component2(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController txtcontroller ) {
    Size size = MediaQuery.of(context).size;
     bool isPasswordCorrect = true;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
           return 'Enter Password';
          }else if(isPasswordCorrect != true){
            return 'InCorect Password';
          }
          return null;
        },
        controller: txtcontroller,
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType:
            isEmail ? TextInputType.emailAddress : TextInputType.text,
        
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
