import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/Category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final Category categoryModelProvider = Provider.of<Category>(context);


    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                imageUrl: categoryModelProvider.image!,
                boxFit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(categoryModelProvider.name!,
              textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                backgroundColor: lightCardColor.withOpacity(0.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
