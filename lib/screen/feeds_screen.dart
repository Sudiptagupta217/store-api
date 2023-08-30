import 'package:flutter/material.dart';

import '../models/Product_model.dart';
import '../services/apihandler.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductModel> productList =[];


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    getProduct();
  }

  Future<void> getProduct () async{
    productList = await APIHanlder.getAllProducts();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: SingleChildScrollView(
        child:productList.isEmpty?
        Center(child: CircularProgressIndicator())
        :GridView.builder(
          itemCount: productList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 0.7
          ),
          itemBuilder: (context, index) {
            return FeedWidget(
              title: productList[index].title.toString(),
              imageUrl: productList[index].images![0],
            );
          },
        ),
      ),
    );
  }
}
