class SelectTypeModel {
  String? name;
  int? id;

  SelectTypeModel({this.name, this.id});

   SelectTypeModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
  }

   Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["id"] = id;
    return map;
  }
}