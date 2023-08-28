import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              BackButton(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 3,
                            child: Text(
                              "Lorem Ipsum",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )),
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                                children: [
                                  TextSpan(
                                      text: "12,34",
                                      style: TextStyle(
                                          color: lightTextColor,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return FancyShimmerImage(
                      width: double.infinity,
                      imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
                      boxFit: BoxFit.fill,
                    );
                  },
                  itemCount: 3,
                  autoplay: true,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.grey.shade500,
                      color: Colors.white70
                    )
                  ),
                ),
              ),

              SizedBox(height: 17),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                    SizedBox(height: 17,),
                    Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples. These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples. These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples.",
                      textAlign: TextAlign.start, style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.normal),),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
