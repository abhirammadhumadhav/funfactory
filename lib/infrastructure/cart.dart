

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
  final cartDoc = userRef.collection('cart').doc('cart'); 

  final cartSnapshot = await cartDoc.get();
  if (cartSnapshot.exists) {
    final cartData = cartSnapshot.data() as Map<String, dynamic>;
    final products = cartData['product'] as Map<String, dynamic>;

    if(!products.containsKey(cart.productId)){
      products[cart.productId!] = {
        'name':cart.name,
        'quantity':1,
        'price':cart.price
        
      };
    }else{
      products[cart.productId!]['quantity'] +=1;
    }
    
    await cartDoc.update({'product': products,
    });


    
    
  } else {
    
    final newCart = {
      'product': {
        cart.productId: {
          'name':cart.name,
          'quantity':1,
          'price':cart.price
          
        },
        
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
  // print("it is called");
  final currentuser = FirebaseAuth.instance.currentUser;
  final userId = currentuser!.uid;
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  final cartDoc = userRef.collection('cart').doc('cart');
  final cartSnapshot =await cartDoc.get();
  if(cartSnapshot.exists){
    final cartData = cartSnapshot.data() as Map<String,dynamic>;
    // print('cartDataaaaa:$cartData');
    // final products = cartData['product'] as Map<String,dynamic>;
    final productids = cartData['product'].keys.toList();
    if(productids.isNotEmpty){
      
      final productDetails = await getProductDetails(productids);

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
  try{
    await cartDoc.update({productId: FieldValue.delete()});
    print('Product Removed : $productId');
  }catch (e){
    print('Errro Removing Product: $e');
  }
  // await cartDoc.update({productId:FieldValue.delete()});
  // print('product Idsss:$productId');
  
}



// Future<int> calclutaeTotalPrice(Map<String,dynamic> products) async{
//   int totalPrice = 0;

//   for(final product in products.values){
//     final productPrice = double.tryParse(product['price'] as String) ?? 0.0;
//     final productQuantity = int.tryParse(product['quantity'] as String) ?? 0;
//   print('product price:$productPrice,product quantity:$productQuantity');

//    if(productPrice != null && productQuantity != null){
//      totalPrice += (productPrice * productQuantity).toInt();
//    }else{
//     print('parsing error for product:$product');
//    }
//   }
//   return totalPrice;
// }




//  Future<double> getCartTotal() async{
 
//  final currentuser = FirebaseAuth.instance.currentUser;
//  if(currentuser == null){
//   return 0;
//  }
//  final userId = currentuser.uid;
//  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
//  final cartDoc = userRef.collection('cart').doc('cart');
//  final cartSnapshot = await cartDoc.get();

//  if(cartSnapshot.exists){
//   final cartData = cartSnapshot.data() as Map<String,dynamic>;
//   final products = cartData['product'] as Map<String,dynamic>;

//   double totalPrice = 0;

//   for(final productid in products.keys){
//    final productInfo = products[productid] as Map<String,dynamic>;
//    final productPrice = productInfo['price'] ;
//   final productquantiy = productInfo['quantity'];
//    final parsedPrice = double.tryParse(productPrice);
//    final parsedQuantity = int.tryParse(productquantiy);


//    if(parsedPrice != null && parsedQuantity != null){
//    totalPrice += parsedPrice * parsedQuantity;
//    }else{
//     print('error parsing price or quantity for productid :$productid');
//    }
     
    
//     // if(productPrice is num){
//     //   // parsedPrice  = double.tryParse(productPrice) ?? 0.0;
//     //   totalPrice += (productPrice as num) * (productInfo['quantity'] as int);
//     // }else if(productPrice is String){
//     //   final parsedPrice = double.tryParse(productPrice) ;
//     //   // parsedPrice = productPrice;

//     //   if(parsedPrice != null){
//     //     totalPrice += parsedPrice * (productInfo['quantity'] as int);
//     //   }else{
//     //     print('Error Parsing Price For ProductId:$productid');
//     //   }
//     // }else{
//     //   print('unknown price format for productid:$productid');
//     // }
 

  
    
  
  
       
  
   
  
//  }
//  return totalPrice;
 
// }
// else{
//   return 0;
//  }

// }



