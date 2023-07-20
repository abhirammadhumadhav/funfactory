import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/widget/animated_widgets/animated_cart_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widget/animated_widgets/animated_listview.dart';
import '../../../widget/bottomnavbar/bottom_nav_bar.dart';
import '../widget/checkout_elevatedbutton.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    'My Cart',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AnimatedCartButtonWidget(),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: AnimatedListviewWidget(w: _w)),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      '₹5999',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                CheckoutElevatedButtonWidget()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}


