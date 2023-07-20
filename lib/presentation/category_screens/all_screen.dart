import 'package:flutter/material.dart';
import '../../widget/animated_widgets/animated_grid_widget.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return Scaffold(
      body: Column(
        children: [
          AnimatedGridWidget(w: _w, columnCount: columnCount),
        ],
      ),
    );
  }
}
