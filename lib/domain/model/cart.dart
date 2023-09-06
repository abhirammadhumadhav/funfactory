

class CartModel{
  String? name;
  String?quantity;
  String? productId;
  List<dynamic> imageUrl;
  String?price;
  
  



  CartModel({
    required this.name,
    required this.productId,
    required this.quantity,
    required this.imageUrl,
  required this.price,
    
    
  });


  static CartModel fromFirestore(Map<String,dynamic> cartProduct){
    return CartModel(
      name: cartProduct['name'],
      productId: cartProduct['productId'],
       imageUrl: cartProduct['imageUrl'],
       quantity: cartProduct['quantity'],
       price: cartProduct['price']
       );
  }

  Map<String,dynamic> tofireStore(){
    return{
      'name':name,
      'productId':productId,
      
      'quantity':quantity
    };
  }

  
}


