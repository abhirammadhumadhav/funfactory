import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/presentation/profile_screen/screens/address_screen/widget/input_address_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            flexibleSpace: Center(
              child: Expanded(
                  child: DefaultTextStyle(
                style: const TextStyle(fontSize: 25),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'New Address',
                        textStyle: GoogleFonts.notoSansOldItalic(
                            textStyle: const TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                        speed: const Duration(milliseconds: 150),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: false,
                  ),
                ),
              )),
            ),
           
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                     border: Border.all(color: Colors.blue),
                       borderRadius: BorderRadius.circular(20),
                           color: Colors.white
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: const [], 
                            onChanged: (value){}
                            )
                          ),
                  ),
                  sdbx,
                  InputAddressFormField(size: size,title: "Name"),
                  sdbx,
                  InputAddressFormField(size: size,title: "Mob"),
                  sdbx,
                  InputAddressFormField(size: size,title: "House No.,Building Name"),
                  sdbx,
                   InputAddressFormField(size: size,title: "Road Name,Area,Colony"),
                   sdbx,
                   InputAddressFormField(size: size,title: "Pincode"),
                   sdbx,
                   InputAddressFormField(size: size,title: "City"),
                   sdbx,
                   InputAddressFormField(size: size,title: "State"),
                   
                ],


              ),
            ),

          ),
          
        ),
        Positioned(
          bottom: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Center(
                  child: SizedBox(
                     width: size.width * 0.9,
                        height: size.width * 0.13,
                        child: ElevatedButton(
                          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                          onPressed: (){}, child: const Text("Update Address",style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ),
                ),
              )
            ],
          )
          )
      ],
    );
  }
}

