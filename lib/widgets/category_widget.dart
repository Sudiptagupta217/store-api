import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                height: size.height * 0.45,
                width: size.width*0.45,
                errorWidget: const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                  size: 28,
                ),
                imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
                boxFit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
