import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/wishlist_grid_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen(
      {super.key, required double w, required this.columnCount})
      : _w = w;
  final double _w;
  final int columnCount;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                    'My Wishlist',
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
          SizedBox(
            height: width / 3.7,
            width: width / 3.7,
            child: Animator<double>(
              duration: const Duration(milliseconds: 1000),
              cycles: 0,
              curve: Curves.elasticIn,
              tween: Tween<double>(begin: 20.0, end: 25.0),
              builder: (context, animatorState, child) => Icon(
                Icons.favorite,
                size: animatorState.value * 1,
                color: const Color.fromARGB(255, 250, 0, 0),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [WishlistGridWidget(w: _w, columnCount: columnCount)],
      ),
    );
  }
}
