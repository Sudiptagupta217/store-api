import 'package:flutter/material.dart';

import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 0.7
          ),
          itemBuilder: (context, index) {
            return FeedWidget();
          },
        ),
      ),
    );
  }
}
