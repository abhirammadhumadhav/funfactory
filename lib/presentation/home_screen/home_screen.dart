import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import '../../widget/animated_widgets/animated_grid_widget.dart';
import '../../widget/bottomnavbar/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    TextEditingController textcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Container(
            width: 100, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            child: Image.asset(
                'lib/asset/image 1 (2).png'), // Set your image path here
          ),
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
                color: const Color.fromARGB(255, 244, 206, 150),
                closeSearchOnSuffixTap: true,
                rtl: true,
                // ) ,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedGridWidget(w: _w, columnCount: columnCount),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
