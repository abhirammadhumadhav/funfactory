import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'active_orders.dart';
import 'complete_orders.dart';

class MyOrdersScreen extends StatelessWidget {
  final pageIndex;
  const MyOrdersScreen({super.key, this.pageIndex});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    TextEditingController textcontroller = TextEditingController();
    final kTabPages = <Widget>[
      ActiveOrdersScreen(
        w: w,
      ),
      CompleteOrdersScreen(
        w: w,
      )
    ];
    final kTabs = <Tab>[
      const Tab(
        icon: Icon(
          Icons.incomplete_circle,
          color: Colors.blue,
        ),
        child: Text(
          "Active",
          style: TextStyle(color: Color.fromARGB(255, 52, 145, 251)),
        ),
      ),
      const Tab(
        icon: Icon(
          Icons.verified,
          color: Colors.green,
        ),
        child: Text(
          "Completed",
          style: TextStyle(color: Colors.green),
        ),
      ),
    ];
    return DefaultTabController(
      length: kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
              child: Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 25),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('My Orders',
                        textStyle: GoogleFonts.notoSansOldItalic(
                            textStyle: const TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ))),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ),
          )),
          backgroundColor: const Color.fromARGB(255, 246, 248, 248),
          bottom: TabBar(
            tabs: kTabs,
          ),
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: AnimSearchBar(
                  width: 400,
                  textController: textcontroller,
                  onSuffixTap: () {},
                  onSubmitted: (p0) => const SizedBox(),
                  animationDurationInMilli: 500,
                  color: const Color.fromARGB(255, 237, 187, 4),
                  closeSearchOnSuffixTap: true,
                  rtl: true,
                  // ) ,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: kTabPages,
        ),
      ),
    );
  }
}
