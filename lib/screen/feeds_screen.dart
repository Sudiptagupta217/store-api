import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Product_model.dart';
import '../services/apihandler.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductModel> productList = [];
  int limit = 10;
  bool _isLoading = false;
  bool _isLimit = false;

  Future<void> getProduct() async {
    productList = await APIHanlder.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoading = true;
        limit += 10;
        log("limit $limit");
        await getProduct();
        _isLoading = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: productList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        controller: _scrollController,
        child: Column(
              children: [
                GridView.builder(
                    itemCount: productList.length,
                     shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                        childAspectRatio: 0.65),
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productList[index],
                        child: const FeedWidget(),
                      );
                    }),
                if(_isLoading)
                  const Center(child: CircularProgressIndicator())

              ],
            ),
          ),
    );
  }
}
