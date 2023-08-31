import 'package:flutter/cupertino.dart';

class UsersModel with ChangeNotifier{
  UsersModel({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.role, 
      this.avatar, 
      this.creationAt, 
      this.updatedAt,});

  UsersModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['role'] = role;
    map['avatar'] = avatar;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
  static List<UsersModel> usersFromSnapshort(List usersSnapshort) {
    // print("data ${productSnapshort[0]}");
    return usersSnapshort.map((data) {
//      print("data $data");
      return UsersModel.fromJson(data);
    }).toList();
  }

}