// To parse this JSON data, do
//
//     final reqModel = reqModelFromJson(jsonString);

import 'dart:convert';

ReqModel reqModelFromJson(String str) => ReqModel.fromJson(json.decode(str));

String reqModelToJson(ReqModel data) => json.encode(data.toJson());

class ReqModel {
    ReqModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    factory ReqModel.fromJson(Map<String, dynamic> json) => ReqModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
