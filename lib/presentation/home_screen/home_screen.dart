import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/domain/model/product.dart';
import 'package:funfactory/infrastructure/search.dart';
import 'package:funfactory/presentation/search_screen/search_screen.dart';
import '../../widget/animated_widgets/animated_grid_widget.dart';
import '../../widget/bottomnavbar/bottom_nav_bar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});






  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    TextEditingController textcontroller = TextEditingController();
    

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: SizedBox(
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
                onSuffixTap: () {
                  textcontroller.clear();
                },
                onSubmitted: (query) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return SearchScreen(w: w,searchQuery: query,);
                  }));
                },
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
        children: [Expanded(child: StreamBuilder<List<Product>>(
          stream: getProducts(['Boys','Girls'], textcontroller.text),
          builder: (context,snapshot) {
            // final List<Product> products = snapshot.data ?? [];
            return AnimatedGridWidget(w: w, columnCount: columnCount);
          }
        ))],
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}


