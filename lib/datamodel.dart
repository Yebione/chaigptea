import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  String message;

  DataModel({
    this.message = "",
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        message: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
