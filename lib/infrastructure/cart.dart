

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funfactory/domain/model/cart.dart';



addToCart(CartModel cart) async {

 
  final currentuser = FirebaseAuth.instance.currentUser;

  if (currentuser == null) {
   
    return;
  }

  final userId = currentuser.uid;
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  final cartDoc = userRef.collection('cart').doc('cart'); // Use a fixed document ID

  final cartSnapshot = await cartDoc.get();
  if (cartSnapshot.exists) {
    final cartData = cartSnapshot.data() as Map<String, dynamic>;
    final products = cartData['product'] as Map<String, dynamic>;

    if(!products.containsKey(cart.productId)){
      products[cart.productId!] = {
        
      };
    }

    await cartDoc.update({'product': products});
  } else {
    
    final newCart = {
      'product': {
        cart.productId: {},
        
      },
    };

    await cartDoc.set(newCart);
  }
}




getProductDetails(List<String> productId)async{
   final productRef = FirebaseFirestore.instance.collection('product');
   final productDocument = await productRef.where(FieldPath.documentId,whereIn: productId).get();
   if(productDocument.docs.isNotEmpty){
    final productDetails = <String,dynamic>{};
    for(final doc in productDocument.docs){
      productDetails[doc.id] = doc.data();
    }
    print('Retrieved Product Details: $productDetails');
    return productDetails;
   }return null;
}

Future<Map<String,dynamic>?> getCartData()async{
  print("it is called");
  final currentuser = FirebaseAuth.instance.currentUser;
  final userId = currentuser!.uid;
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  final cartDoc = userRef.collection('cart').doc('cart');
  final cartSnapshot =await cartDoc.get();
  if(cartSnapshot.exists){
    final cartData = cartSnapshot.data() as Map<String,dynamic>;
    // final products = cartData['product'] as Map<String,dynamic>;
    final productid = cartData['product'].keys.toList();
    if(productid.isNotEmpty){
      
      final productDetails = await getProductDetails(productid);
     
      return productDetails;
    }
  }else{
    return null;
  }
  return null;
  
}


Future<bool> IsAddedToCart(String productId) async{ 
  final currentuser = FirebaseAuth.instance.currentUser;
  final userId = currentuser!.uid;
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
final cartDoc =  userRef.collection('cart').doc('cart');
final cartSnapshot =await cartDoc.get();

if(cartSnapshot.exists){
  final cartData = cartSnapshot.data() as Map<String,dynamic>;
  final products = cartData['product'] as Map<String,dynamic>;

  return products.containsKey(productId);
}else{
  return false;
}
}

removeFromCart(String productId)async{
  final currentUser = FirebaseAuth.instance.currentUser;
  final userid = currentUser!.uid;
  final userRef = FirebaseFirestore.instance.collection('users').doc(userid);
  final cartDoc = userRef.collection('cart').doc('cart');
  await cartDoc.update({productId:FieldValue.delete()});
  print('product Idsss:$productId');
  
}


