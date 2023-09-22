import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/Product_model.dart';
import 'package:store_api_flutter_course/models/Category.dart';
import 'package:store_api_flutter_course/models/UsersModel.dart';
import 'package:store_api_flutter_course/screen/home_screen.dart';

class APIHanlder {
  static Future<List<dynamic>> getData({required String target, String? limit}) async {
    try {
      var uri = Uri.https(
          BASE_URL,
          "/api/v1/$target",
        target=="products"?{
            "offset":"0",
          "limit":limit
        }:{}

      );

      var response = await http.get(uri);
      //print("response ${jsonDecode(response.body)}");

      var data = jsonDecode(response.body);


      if (response.statusCode != 200) {
        throw data["message"];
      }

      List tempList = [];

      for (var v in data) {
        tempList.add(v);
        //  print("v $v \n\n");
      }
      return tempList;
    } catch (error) {
      log("error $error" as num);
      throw error.toString();
    }
  }

  // static Future<List<Category>> getAllCategory() async {
  //   var uri = Uri.https(BASE_URL, "/api/v1/categories");
  //
  //   var response = await http.get(uri);
  //   //print("response ${jsonDecode(response.body)}");
  //
  //   var data = jsonDecode(response.body);
  //
  //   List categoryList = [];
  //
  //   for (var v in data) {
  //     categoryList.add(v);
  //     //  print("v $v \n\n");
  //   }
  //   return Category.categoryFromSnapshort(categoryList);
  // }

  static Future<List<ProductModel>> getAllProducts({required String limit}) async {
    List prod = await getData(target: "products",limit: limit);
    return ProductModel.productsFromSnapshort(prod);
  }

  static Future<List<Category>> getAllCategory() async {
    List categ = await getData(target: "categories");
    return Category.categoryFromSnapshort(categ);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List users = await getData(target: "users");
    return UsersModel.usersFromSnapshort(users);
  }

  static Future<ProductModel> getProductDetails({required String id}) async {
   try{
     var uri = Uri.https(BASE_URL, "/api/v1/products/$id");

     var response = await http.get(uri);
     //print("response ${jsonDecode(response.body)}");

     var data = jsonDecode(response.body);

     if(response.statusCode!= 200){
       throw data["message"];
     }

     return ProductModel.fromJson(data);
   }catch(error){
     log("an error occured while getting product details" as num);
     throw error.toString();
   }
  }


  static singUp(String email, String password) async{
    try{
      var uri = Uri.https("reqres.in","/api/register");

      var response =await http.post(uri,

          body: {
            'email':email,
            'password':password
          }
      );
      var data = jsonDecode(response.body);
      if(response.statusCode==200){
        return 'success';
      }else{
        print("Fail");
        print(data['error']);
      }
    }catch(e){
      print(e.toString());
    }
  }
  
  static logIn (String email, String password)async{
    try {
      var uri = Uri.https("reqres.in", "/api/login");

      var response = await http.post(uri,
          body:{
            "email":email,
            "password":password
          },
      );
      var data = jsonDecode(response.body);
      if(response.statusCode == 200){
        return "loginsuccess";
      }else{
        print("login failed");
        print(data["error"]);
      }
    }
    catch(e){
      print(e.toString());
    }
    
  }

}
