import 'package:flutter/material.dart';
import 'package:funfactory/presentation/cart_Screen/screen/cart_screen.dart';

class AddToCartButtonWidget extends StatelessWidget {
  const AddToCartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return CartScreen();
            }));
          },
          icon: const Icon(
            Icons.card_travel,
            color: Colors.white,
          ),
          label: const Text(
            'Add to Cart',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              backgroundColor: const MaterialStatePropertyAll(Colors.green),
              fixedSize: const MaterialStatePropertyAll(
                Size(200, 50),
              )),
        ),
      ],
    );
  }
}
