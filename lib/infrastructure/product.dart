import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funfactory/domain/model/product.dart';


Stream<List<Product>> getProduct( String category){ 
   
  if(category.isEmpty){
  final CollectionReference<Map<String,dynamic>> productCollection = FirebaseFirestore.instance.collection('product');
  final productstream = productCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => 
  Product.fromFirestore(doc.data())).toList());

  return productstream;
  }
  final CollectionReference<Map<String,dynamic>> productCollection = FirebaseFirestore.instance.collection('product');
  final productstream = productCollection.where('category',isEqualTo: category).snapshots().map((snapshot) => snapshot.docs.map((doc) => 
  Product.fromFirestore(doc.data())).toList());
  return productstream;
}