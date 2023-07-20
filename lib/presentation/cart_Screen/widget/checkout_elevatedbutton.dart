import 'package:flutter/material.dart';
import '../../checkout_screen/screens/checkout_screen.dart';

class CheckoutElevatedButtonWidget extends StatelessWidget {
  const CheckoutElevatedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return const CheckoutScreen();
          }));
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: const Color.fromARGB(255, 113, 229, 116)),
        icon: const Icon(
          Icons.check_box,
          color: Colors.white,
        ),
        label: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ));
  }
}
