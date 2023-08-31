

class CartModel{
  String? name;
  String?quantity;
  String? productId;
  int? totalPrice;
  



  CartModel({
    required this.name,
    required this.productId,
    required this.totalPrice,
    required this.quantity,
    
  });


  static CartModel fromFirestore(Map<String,dynamic> cartProduct){
    return CartModel(
      name: cartProduct['name'],
      productId: cartProduct['productId'],
       totalPrice: cartProduct['totalPrice'],
       quantity: cartProduct['quantity'],
       
       );
  }

  Map<String,dynamic> tofireStore(){
    return{
      'name':name,
      'productId':productId,
      'totalPrice':totalPrice,
      'quantity':quantity
    };
  }

  
}


