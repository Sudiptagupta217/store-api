class Category {
  Category({
      this.id, 
      this.name, 
      this.image, 
      this.creationAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}