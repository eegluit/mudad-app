class NotificationModel {
  String? name;
  String? time;
  String? type;
  String? desciption;

  NotificationModel({this.name, this.time, this.type, this.desciption});

   NotificationModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    time = json["time"];
    type = json["type"];
    desciption = json["desciption"];
  }

   Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["time"] = time;
    map["type"] = type;
    map["desciption"] = desciption;
    return map;
  }
}