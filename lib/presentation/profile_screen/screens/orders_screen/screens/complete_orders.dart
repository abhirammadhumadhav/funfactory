import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CompleteOrdersScreen extends StatelessWidget {
  const CompleteOrdersScreen({super.key, required double w}): _w = w;
final double _w;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: CompleteOrdersListWidget(w: _w))
        ],
      ),
    );
  }
}

class CompleteOrdersListWidget extends StatelessWidget {
  const CompleteOrdersListWidget({
    super.key,
    required double w,
  }) : _w = w;

  final double _w;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics: const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics()),
        itemCount: 3,
        itemBuilder: (BuildContext c, int i) {
    return AnimationConfiguration.staggeredList(
      position: i,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: 30,
        verticalOffset: 300.0,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: FlipAxis.y,
          child: Container(
            margin: EdgeInsets.only(bottom: _w / 20),
            height: _w / 3.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 60,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "lib/asset/tom-5158824_1280.webp",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: const Text("Product Name",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              subtitle: const Row(
                children: [
                  Text("₹2999",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                  // ElevatedButton(onPressed: onPressed, child: child)
                ],
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_sweep_outlined,
                    color: Colors.grey,
                  )),
            ),
          ),
        ),
      ),
    );
        },
      ),
    );
  }
}