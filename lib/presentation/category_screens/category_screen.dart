import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/presentation/search_screen/search_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widget/bottomnavbar/bottom_nav_bar.dart';
import 'all_screen.dart';
import 'boys_category_screen.dart';
import 'girls_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  // final pageIndex;
  const CategoryScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    TextEditingController textcontroller = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    final kTabPages = <Widget>[
      const AllScreen(),
      const BoysCtaegoryScreen(),
      const GirlsCategoryScreen()
    ];
    final kTabs = <Tab>[
      const Tab(
        icon: Icon(Icons.card_giftcard),
        child: Text(
          "All",
          style: TextStyle(color: Color.fromARGB(255, 52, 145, 251)),
        ),
      ),
      const Tab(
        icon: Icon(Icons.child_care_outlined),
        child: Text(
          "Boys",
          style: TextStyle(color: Color.fromARGB(255, 52, 145, 251)),
        ),
      ),
      const Tab(
        icon: Icon(Icons.child_care_outlined),
        child: Text(
          "Girls",
          style: TextStyle(color: Color.fromARGB(255, 52, 145, 251)),
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
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Most Popular',
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
                  onSuffixTap: () {
                    textcontroller.clear();
                  },
                  onSubmitted: (query){
                    return Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return SearchScreen(w: w, searchQuery: query);
                    }));
                  },
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
        bottomNavigationBar: const BottomNavBar(
          selectedIndex: 1,
        ),
      ),
    );
  }
}
