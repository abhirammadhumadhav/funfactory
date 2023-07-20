import 'package:flutter/material.dart';

class AnimatedCartButtonWidget extends StatefulWidget {
  @override
  AnimatedCartButtonWidgetState createState() =>
      AnimatedCartButtonWidgetState();
}

class AnimatedCartButtonWidgetState extends State<AnimatedCartButtonWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 92, 217, 242).withOpacity(0.5),
            shape: const CircleBorder(),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              5 * animationController.value,
            ),
            child: child,
          ),
        );
      },
      child: Container(
        decoration: const ShapeDecoration(
          color: Color.fromARGB(255, 242, 243, 244),
          shape: CircleBorder(),
        ),
        child: IconButton(
          onPressed: () {},
          color: Colors.blue,
          icon: const Icon(
            Icons.shopping_cart,
            size: 20,
          ),
        ),
      ),
    );
  }
}
