import 'dart:math';
import 'package:flutter/material.dart';

class SlidableCardWidget extends StatelessWidget {
   SlidableCardWidget({
    super.key,
    required this.width,
    required double page,
    required this.pageController,required this.imageurl,
  }) : _page = page;
   List<dynamic>imageurl;
  final double width;
  final double _page;
  final PageController pageController;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          SizedBox(
            height: 350,
            width: width * .95,
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                List<Widget> cards = [];

                for (int i = 0; i < imageurl.length; i++) {
                  double currentPageValue = i - _page;
                  bool pageLocation = currentPageValue > 0;

                  double start = 20 +
                      max(
                          (boxConstraints.maxWidth - width * .75) -
                              ((boxConstraints.maxWidth - width * .75) / 2) *
                                  -currentPageValue *
                                  (pageLocation ? 9 : 1),
                          0.0);

                  var customizableCard = Positioned.directional(
                    top: 20 + 30 * max(-currentPageValue, 0.0),
                    bottom: 20 + 30 * max(-currentPageValue, 0.0),
                    start: start,
                    textDirection: TextDirection.ltr,
                    child: Container(
                      
                      height: width * .67,
                      width: width * .67,
                      alignment: Alignment.center,
                      
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                blurRadius: 10)
                          ]),
                         
                      child:
                       
                       Image.network(
                        
                       imageurl[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                  cards.add(customizableCard);
                }
                return Stack(children: cards);
              },
            ),
          ),
          Positioned.fill(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: imageurl.length,
              controller: pageController,
              itemBuilder: (context, index) {
                 
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
