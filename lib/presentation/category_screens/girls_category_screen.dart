import 'package:flutter/material.dart';
import '../../widget/animated_widgets/animated_grid_widget.dart';

class GirlsCategoryScreen extends StatelessWidget {
  const GirlsCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return Scaffold(
      body: Column(
        children: [
          AnimatedGridWidget(w: w, columnCount: columnCount,category: 'Girls',),
        ],
      ),
    );
  }
}
