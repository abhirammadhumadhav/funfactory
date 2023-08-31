

class Product{
  String name;
  String price;
  String quantity;
  String category;
  List<dynamic> imageUrl;
  String id;


  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.category,
    required this.imageUrl,
    required this.id
  });

  
static Product fromFirestore(Map<String,dynamic> datamodel){
          return Product(
            name: datamodel['name'],
             price: datamodel['price'],
              quantity: datamodel['quantity'],
               category: datamodel['category'],
                imageUrl: datamodel['imageUrl'],
                 id: datamodel['id']
                 );
 }
}