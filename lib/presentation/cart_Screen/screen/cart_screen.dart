import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funfactory/widget/animated_widgets/animated_cart_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widget/animated_widgets/animated_listview.dart';
import '../../../widget/bottomnavbar/bottom_nav_bar.dart';
import '../widget/checkout_elevatedbutton.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalAmount = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calclutaeTotalPrice();
  }





  void calclutaeTotalPrice()async{
   final currentUser = FirebaseAuth.instance.currentUser;

   if(currentUser == null){
    return null;
   }
   final userId = currentUser.uid;
   final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
   final cartDoc = userRef.collection('cart').doc('cart');

   final cartsnapshot = await cartDoc.get();

   if(cartsnapshot.exists){
    final cartData = cartsnapshot.data() as Map<String,dynamic>;
    // print('cartDataaaaa:$cartData');
    final products = cartData['product'] as Map<String,dynamic>;
    //  print('productsssss:$products');
    double totalPrice = 0.0;

    products.forEach((productId, productData) {
      // print('productdatassss:$productData');
   final quantity = productData['quantity'] as int;
   final price =  double.tryParse(productData['price']) ;


  //  print('productiddddddddddddddddddddd:$productId,Quantityyy:$quantity,priceee:$price');

   totalPrice +=  price! * quantity;
     });
     setState(() {
       totalAmount = totalPrice;
     });
   }
  }



  // void calclutaeTotalPrice(int newQuantity, Map<String,dynamic> updateProductdata) async{
  // final currentUser = FirebaseAuth.instance.currentUser;

  // if(currentUser == null){
  //   return null;
  // }

  // final userId = currentUser.uid;

  // final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  // final cartDoc = userRef.collection('cart').doc('cart');
  // final cartsnapshot = await cartDoc.get();


  // if(cartsnapshot.exists){
  //   final cartData = cartsnapshot.data() as Map<String,dynamic>;
  //   final products = cartData['product'] as Map<String,dynamic>;
  //   double totalPrice = 0.0;

  //   products.forEach((productId, productData) { 
  //     final quantity = productId == updateProductdata['id'] ? newQuantity : productData['quantity'];
  //     final price = double.tryParse(productData['price']);
  //     totalPrice += price! * quantity;
  //   });
  //   setState(() {
  //     totalAmount = totalPrice;
  //   });
  // }
  // }
  @override
  // List<CartModel> cartItems = [];
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    
   
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Expanded(
              child: DefaultTextStyle(
            style: const TextStyle(fontSize: 25),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'My Cart',
                    textStyle: GoogleFonts.notoSansOldItalic(
                        textStyle: const TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
                displayFullTextOnTap: true,
                stopPauseOnTap: false,
              ),
            ),
          )),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: AnimatedCartButtonWidget(),
          )
        ],
      ),
      body: Column(
        children: [
         Expanded(child: AnimatedListviewWidget(w: w)),
             Padding(
            padding: const EdgeInsets.all(10.0),
          
              
              
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Text(
                          '₹${totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    const CheckoutElevatedButtonWidget()
                  ],
                )
              
            
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}


