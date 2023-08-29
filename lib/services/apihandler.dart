import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/Product_model.dart';

class APIHanlder {


  static Future<List<ProductModel>> getAllProducts() async {
    var uri = Uri.https(BASE_URL, "/api/v1/products");

    var response = await http.get(uri);
    //print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);

    List tempLoist =[];

    for (var v in data){
      tempLoist.add(v);
    //  print("v $v \n\n");
    }

    return ProductModel.productsFromSnapshort(tempLoist);

  }

}