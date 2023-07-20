import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/add_new_address_button.dart';
import '../widget/address_confirm_button.dart';
import '../widget/address_field_widget.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    FadeAnimatedText(
                      'Address',
                      textStyle: GoogleFonts.notoSansOldItalic(
                          textStyle: const TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  AddressFieldWidget(size: size,trailbtn: Radio(
            value: () {},
            groupValue: true,
            onChanged: (value) {},
          ),)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AddNewAdressButtonWidget(size: size)
            ],
          ),
          AddressConfirmButtonWidget(size: size)
        ],
      ),
    );
  }
}

