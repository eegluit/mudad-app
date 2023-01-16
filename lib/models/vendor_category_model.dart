class VendorCategoryModel {
  String? name;
  String? image;

  VendorCategoryModel({this.name, this.image});

   VendorCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];
  }

   Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["image"] = image;
    return map;
  }
}