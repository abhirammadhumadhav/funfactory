import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/domain/model/cart.dart';
import 'package:funfactory/infrastructure/cart.dart';

class AddToCartButtonWidget extends StatefulWidget {
  final String? productId; // Declare the productId as a class property

  const AddToCartButtonWidget(this.productId, {Key? key}) : super(key: key);

  @override
  State<AddToCartButtonWidget> createState() => _AddToCartButtonWidgetState();
}

class _AddToCartButtonWidgetState extends State<AddToCartButtonWidget> {
  bool isProductAdded = false;
  @override
  void initState() {
    super.initState();
    cartProductStatus();
  }

  Future<void> cartProductStatus() async {
    if (widget.productId != null) {
      bool added = await IsAddedToCart(widget.productId!);
      setState(() {
        isProductAdded = added;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            if (widget.productId != null) {
              // Check if productId is not null
              // print(
              //     'Fetching product with productId: ${widget.productId}'); // Print the productId

              final productDocument = await FirebaseFirestore.instance
                  .collection('product')
                  .doc(widget.productId)
                  .get();

              if (productDocument.exists) {
                final productData =
                    productDocument.data() as Map<String, dynamic>;
                final cartProduct = CartModel(
                  name: productData['name'],
                  productId: widget.productId,
                  imageUrl: productData['imageUrl'], // Use the passed productId
                   price: productData['price'],
                  // totalPrice: productData['totalPrice'],
                  quantity: productData['quantity'],
                );

                // print("Adding to cart: $cartProduct".toString());
                addToCart(cartProduct);
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Added To The Cart'),
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 2),
                ));
                //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                //                           return const CartScreen();
                //                         }), (route) => false);
              } else {
                // print('Product not found');
              }
            } else {
              // print("nothhig");
            }
          },
          icon: const Icon(
            Icons.card_travel,
            color: Colors.white,
          ),
          label: Text(
            isProductAdded ? 'Added To Cart' : 'Add To Cart',
            style: const TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            backgroundColor: MaterialStateProperty.all(
                isProductAdded ? Colors.blue : Colors.green),
            fixedSize: MaterialStateProperty.all(
              const Size(200, 50),
            ),
          ),
        ),
      ],
    );
  }
}
