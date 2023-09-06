import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CustomCartButton extends StatefulWidget {



  final String productId;
  final String quantity;
  // final Function(int,Map<String,dynamic>) onQuantityChange;
 
  
  const CustomCartButton({
    super.key,
    required this.productId, 
    required this.quantity,
     
     });

  @override
  State<CustomCartButton> createState() => _CustomCartButtonState();
}

class _CustomCartButtonState extends State<CustomCartButton> {
int CartproductQuantity =1  ;

@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CartQuantityFromFirebase();
  }
 
// @override
//   void initState() {
//     CartQuantityFromFirebase();
//     CartproductQuantity;
//     super.initState();
    
//   }
   
  void CartQuantityFromFirebase()async{
   final currentuser = FirebaseAuth.instance.currentUser?.uid;
     final userRef = FirebaseFirestore.instance.collection('users').doc(currentuser);
     final cartDoc = userRef.collection('cart').doc('cart');

     final cartSnapshot = await cartDoc.get();
     if(cartSnapshot.exists){
      final cartData = cartSnapshot.data() as Map<String,dynamic>;
      final productData = cartData['product'] as Map<String,dynamic>;

      if(productData.containsKey(widget.productId)){
        final productInfo = productData[widget.productId] as Map<String,dynamic>;
         final currentProductQuantity =  productInfo['quantity'] as int;
       
        setState(() {
         CartproductQuantity = currentProductQuantity;
        });
      }
     }else{
      print('Error');
     }
  }

  

   increaseQuantity(){
    if(CartproductQuantity < int.parse(widget.quantity)){
       setState(() {
         CartproductQuantity++;

       });
       updateFirebaseCart(CartproductQuantity);
     
       
    }
  }
   decreaseQuantity(){
    if(CartproductQuantity>1){
      setState(() {
        CartproductQuantity--;
      });
      updateFirebaseCart(CartproductQuantity);
    }
  }
  
 
  void updateFirebaseCart(int newQuantity)async{
    final currentuser = FirebaseAuth.instance.currentUser?.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(currentuser);
    final cartDoc = userRef.collection('cart').doc('cart');
    final cartsnapshot = await cartDoc.get();

    if(cartsnapshot.exists){
    final  cartData = cartsnapshot.data() as Map<String,dynamic>;
    final productData = cartData['product'] as Map<String,dynamic>;
    if(productData.containsKey(widget.productId)){
      final productInfo = productData[widget.productId] as Map<String,dynamic>;
      productInfo['quantity'] = newQuantity;
      // productInfo['price'] = widget.price;
      await cartDoc.update({'product':productData});
    }
    }else{
      print('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15),
          
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: decreaseQuantity, icon: const Icon(Icons.remove,color: Colors.white,)),
           Container(
            width: 10,
            child: Text(CartproductQuantity.toString(),style:  TextStyle(overflow:TextOverflow.ellipsis),)),
          IconButton(onPressed: increaseQuantity, icon: const Icon(Icons.add,color: Colors.white,))
        ],
      ),
    );
  }
}
