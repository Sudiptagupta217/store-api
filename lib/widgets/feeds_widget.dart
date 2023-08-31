import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/Product_model.dart';
import 'package:store_api_flutter_course/screen/product_details_screen.dart';

import '../consts/global_colors.dart';

class FeedWidget extends StatelessWidget {

  const FeedWidget({Key? key,}):super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductModel productModelProvider = Provider.of<ProductModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context) => ProductDetails(id: productModelProvider.id.toString(),)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 5,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: '\$ ',
                          style: TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1)
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: productModelProvider.price.toString(),
                              style: TextStyle( color: lightTextColor,
                                  fontWeight: FontWeight.w600)
                            ),
                          ]
                        ),
                      ),
                    ),
                    Icon(Icons.favorite_border,color: Colors.red,),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: size.height * 0.2,
                    width: double.infinity,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    imageUrl: productModelProvider.images![0],
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(productModelProvider.title.toString(),
                overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: size.height*0.01,),

            ],
          ),
        ),
      ),
    );
  }
}
