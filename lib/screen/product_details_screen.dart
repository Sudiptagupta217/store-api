import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/Product_model.dart';
import 'package:store_api_flutter_course/services/apihandler.dart';

class ProductDetails extends StatefulWidget {
  final String id;

  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();


}

class _ProductDetailsState extends State<ProductDetails> {


  ProductModel? productModel;

  bool isError = false;
  String errorStr = "";

  Future<void> getProductInfo() async {
    try {
      productModel = await APIHanlder.getProductDetails(id: widget.id);
    } catch (e) {
      isError = true;
      errorStr = e.toString();
    }
    setState(() {

    });
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SafeArea(
        child: isError ? Center(child: Text("Error $errorStr")): productModel == null ? Center(
            child: const CircularProgressIndicator()) : SingleChildScrollView(
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
                      productModel!.category!.name.toString(),
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
                            child: Text(productModel!.title.toString(),
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
                                      text: productModel!.price.toString(),
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
                      imageUrl: productModel!.images![index],
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
                    Text("Description", style: TextStyle(color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),),
                    SizedBox(height: 17,),
                    Text(productModel!.description.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),),

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
