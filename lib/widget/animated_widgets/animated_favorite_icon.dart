import 'package:flutter/material.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  @override
  AnimatedFavoriteIconState createState() => AnimatedFavoriteIconState();
}

class AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon> {
  bool pressed = false;

  void togglePressed() {
    setState(() {
      pressed = !pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor =
        pressed ? const Color.fromARGB(255, 249, 2, 2) : Colors.white;
    return GestureDetector(
      onTap: togglePressed,
      child: AnimatedContainer(
        height: 30,
        width: 30,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: pressed
              ? const Color.fromARGB(255, 60, 179, 235).withOpacity(1.0)
              : const Color.fromARGB(255, 60, 179, 235).withOpacity(1.0),
        ),
        child: Icon(
          Icons.favorite,
          color: iconColor,
        ),
      ),
    );
  }
}
