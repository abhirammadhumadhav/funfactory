

class CartModel{
  String? name;
  String?quantity;
  String? productId;
  
  
  



  CartModel({
    required this.name,
    required this.productId,
    required this.quantity,
    
    
  });


  static CartModel fromFirestore(Map<String,dynamic> cartProduct){
    return CartModel(
      name: cartProduct['name'],
      productId: cartProduct['productId'],
       
       quantity: cartProduct['quantity'],
       
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


