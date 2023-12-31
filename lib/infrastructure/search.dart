import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funfactory/domain/model/product.dart';

// Future<List<DocumentSnapshot>> searchInFirebase(String query) async{
//  final collection = FirebaseFirestore.instance.collection('products');
//  final snapshot = await collection.where('name',isGreaterThanOrEqualTo: query).get();
//  return snapshot.docs;

// }

// Stream<List<Product>> getProducts(List<String> Category,String searchQuery){
//   final CollectionReference<Map<String,dynamic>> productCollection = FirebaseFirestore.instance.collection('product');

//   Query<Map<String,dynamic>> query = productCollection;

//   if(Category.isNotEmpty){
//      query = query.where('category',whereIn: Category);
//   }
//   if(searchQuery.isNotEmpty){
//     query = query.where('name',arrayContains: searchQuery);
//   }
//     final Stream<QuerySnapshot<Map<String,dynamic>>> snapshotstream = query.snapshots();

//    return snapshotstream.map((snapshot) {
//     return snapshot.docs.map((doc) => Product.fromFirestore(doc.data())).toList();
//    });
// }

Stream<List<Product>> SearchProducts(
    String searchQuery, List<String> Categories) {
  final CollectionReference<Map<String, dynamic>> productCollection =
      FirebaseFirestore.instance.collection('product');

  return productCollection.snapshots().map((snapshot) {
    final List<Product> productList = snapshot.docs
        .map((doc) => Product.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList();

    if (searchQuery.isEmpty && Categories.isEmpty) {
      return productList;
    }
    final List<Product> searchResult = productList
        .where((product) =>
            product.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final List<Product> categorieResult = searchResult
        .where((product) =>
            Categories.isEmpty || Categories.contains(product.category))
        .toList();
    return categorieResult;
  });
}
