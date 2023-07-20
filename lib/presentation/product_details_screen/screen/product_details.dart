import 'package:flutter/material.dart';
import '../widget/add_to_cart_button.dart';
import '../../../widget/expandable_widget/expandable_widget.dart';
import '../../../widget/slidable_card_widget/slidable_card_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => new _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
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
                width: width, page: _page, pageController: pageController),
          ),
          Flexible(fit: FlexFit.loose, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableWidget(),
          )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AddToCartButtonWidget(),
          )
        ],
      ),
    );
  }
}


