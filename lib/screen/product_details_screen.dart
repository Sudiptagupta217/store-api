import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                     Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                     ),
                     SizedBox(height: 18,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Flexible(
                           flex: 3,
                             child:Text(
                               "Lorem Ipsum",textAlign: TextAlign.start,
                               style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                             )
                         ),
                         Flexible(
                           flex: 1,
                             child:RichText(
                               text: TextSpan(
                              text: '\$', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                                   children: [
                                     TextSpan(
                                         text: "12,34",
                                     style: TextStyle(
                                       color: lightTextColor,
                                       fontWeight: FontWeight.bold
                                     )
                                     )
                                   ]),
                               ),
                                )
                       ],
                     ),
                     SizedBox(height: 17,),
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
