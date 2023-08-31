import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/presentation/profile_screen/screens/wishlist_screen/screen/wishlist_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widget/bottomnavbar/bottom_nav_bar.dart';
import '../widget/profile_categories.dart';
import 'orders_screen/screens/orders.dart';
import 'address_screen/screens/address_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
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
                      'Profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage(
                                "lib/asset/tom-5158824_1280.webp"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text("Abhiram Madhu Madhav",
                    style: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              Center(
                child: Text("abhirammadhunote@gmail.com",
                    style: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileCategoryWidget(
                title: "Orders",
                icon: Icons.shopping_bag,
                onPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) {
                    return const MyOrdersScreen();
                  }));
                },
                endIcon: true,
              ),
              ProfileCategoryWidget(
                  title: "Address",
                  icon: Icons.location_on,
                  onPress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return const AddressScreen();
                    }));
                  },
                  endIcon: true),
              ProfileCategoryWidget(
                  title: "Wishlist",
                  icon: Icons.favorite,
                  onPress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return WishlistScreen(w: w, columnCount: columnCount);
                    }));
                  },
                  endIcon: true),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 125,
                  height: 50,
                  child: Image(
                    image: AssetImage('lib/asset/image 1 (2).png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }
}
