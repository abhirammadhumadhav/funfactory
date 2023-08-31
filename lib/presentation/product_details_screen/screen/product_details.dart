import 'package:flutter/material.dart';
import 'package:funfactory/domain/model/product.dart';
import '../widget/add_to_cart_button.dart';
import '../../../widget/expandable_widget/expandable_widget.dart';
import '../../../widget/slidable_card_widget/slidable_card_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product data;
  const ProductDetailsScreen({super.key, required this.data});

  @override
  ProductDetailsScreenState createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double _page = 10;
  List<dynamic> image_urls = [];
  String? productname;
  String? productid;
  @override
  Widget build(BuildContext context) {

    image_urls = widget.data.imageUrl;
    productname = widget.data.name;
    productid = widget.data.id;
    double width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page ?? 0.0;
          },
        );
      },
    );

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SlidableCardWidget(
                width: width, page: _page, pageController: pageController,imageurl:image_urls ,),
          ),
           Flexible(fit: FlexFit.loose, child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ExpandableWidget(productname: productname,),
          )),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddToCartButtonWidget(productid),
          )
        ],
      ),
    );
  }
}


