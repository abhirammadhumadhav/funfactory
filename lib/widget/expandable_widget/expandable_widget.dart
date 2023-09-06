import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
   ExpandableWidget({super.key,required this.productname,required this.productPrice});
  String? productname;
  String? productPrice;
  @override
  ExpandableWidgetState createState() => ExpandableWidgetState();
}

class ExpandableWidgetState extends State<ExpandableWidget> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            onHighlightChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isTapped
                  ? isExpanded
                      ? 65
                      : 70
                  : isExpanded
                      ? 225
                      : 240,
              width: isExpanded ? 385 : 390,
              decoration: BoxDecoration(
                color: const Color(0xff6F12E8),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 105, 3, 247).withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: isTapped
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                             widget.productname?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text(
                                  widget.productname??'',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text('₹${widget.productPrice}',
                            style: TextStyle(color: Colors.yellow,fontSize: 22,fontWeight: FontWeight.bold),)
                               ],
                             ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          isTapped
                              ? ''
                              : 'Widgets that have global keys reparent '
                                  'their subtrees when they are moved from one '
                                  'location in the tree to another location in ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
