import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:funfactory/presentation/category_screens/category_screen.dart';
import 'package:funfactory/presentation/home_screen/home_screen.dart';
import '../../presentation/cart_Screen/screen/cart_screen.dart';
import '../../presentation/profile_screen/screens/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  //int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double HEIGHT = 90;
    // double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: size.width,
      height: HEIGHT,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(size.width * .04),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(30)),
          ),
          CustomPaint(
            size: Size(size.width, HEIGHT),
            painter: MyPainter(),
          ),
          Center(
            child: SizedBox(
              width: size.width * .93,
              height: HEIGHT,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                      color: selectedIndex == 0 ? Colors.white : Colors.black38,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return  HomeScreen();
                      }));
                      // setState(() {
                      //   selectedIndex = 0;
                      // });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      selectedIndex == 1
                          ? Icons.category
                          : Icons.category_rounded,
                      color: selectedIndex == 1 ? Colors.white : Colors.black38,
                    ),
                    onPressed: () {
                      log(selectedIndex.toString());
                      log('<<<,,,,,,,,,,,,>>>');
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const CategoryScreen();
                      }));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      selectedIndex == 2
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined,
                      color: selectedIndex == 2 ? Colors.white : Colors.black38,
                    ),
                    onPressed: () {
                      log(selectedIndex.toString());
                      log('<<<,,,,,,,,,,,,>>>');
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return  CartScreen();
                      }));
                      // setState(() {
                      //   selectedIndex = 2;
                      // });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      selectedIndex == 3
                          ? Icons.person
                          : Icons.person_outline_rounded,
                      color: selectedIndex == 3 ? Colors.white : Colors.black38,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const ProfileScreen();
                      }));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width * .08, size.height * .21); // Start
    path.quadraticBezierTo(size.width * .2, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .6, 0, size.width * .65, 0);
    path.quadraticBezierTo(
        size.width * .8, 0, size.width * .92, size.height * .21);
    canvas.drawPath(path, paint);
  }

  // @override
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
