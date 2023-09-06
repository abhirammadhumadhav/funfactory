import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:funfactory/infrastructure/cart.dart';

import '../custom_cart_button/custom_button.dart';

class AnimatedListviewWidget extends StatefulWidget {
   AnimatedListviewWidget({
    super.key,
    required double w,
  
  }) : _w = w;

  final double _w;

  @override
  State<AnimatedListviewWidget> createState() => _AnimatedListviewWidgetState();
}

class _AnimatedListviewWidgetState extends State<AnimatedListviewWidget> {
  late Future<Map<String,dynamic>?>productData;
  
  @override
  void initState() {
    
    super.initState();
    productData = getCartData();
  }
  Future<void> refreshCartData()async{
    setState(() {
      productData = getCartData();
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,dynamic>?>(
      future: productData,
    builder: (context, snapshot) {
      final products = snapshot.data;
      print('Retrieved Products: $productData');
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(color: Colors.orange));
      }
      if(snapshot.hasError){
        return Text('ERROR${snapshot.error}');
      }
      if(products == null || products.isEmpty){
        return const Text('no product in cart');
      }
      // if( products!.isNotEmpty){
       return AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(widget._w / 30),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: products.length,
          itemBuilder: (BuildContext c, int i) {
            final productKey  = products.keys.toList()[i];
      
            final product = products[productKey];
            // print('producttttt: $product');
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
                    margin: EdgeInsets.only(bottom: widget._w / 20),
                    height: widget._w / 3.5,
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
                            child: Image.network(
                             product['imageUrl'][0] ,
                              //  'lib/asset/tom-5158824_1280.webp',
                              
                              // (products[0] as dynamic)['imageUrl'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title:  Text(product['name'],
                    
                          style: const TextStyle(color: Colors.black, fontSize: 20)),
                      subtitle:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product['price'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                                  CustomCartButton(productId: productKey, quantity: product['quantity'],)
                                  //  CustomCartButton(productId: productKey,quantity: product['quantity'],)
                          
                        ],
                       
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            try{
                              await  removeFromCart(productKey);
                              // print('productKeyyyy:$productKey');
                            }catch(e){
                              // print('Error removing product:$e');
                            }
                            
                           
                           
                          },
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
     
    },
       
    );
  }
}
