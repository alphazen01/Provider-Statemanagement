// To parse this JSON data, do
//
//     final userAllPostModel = userAllPostModelFromJson(jsonString);

import 'dart:convert';

UserAllPostModel userAllPostModelFromJson(String str) =>
    UserAllPostModel.fromJson(json.decode(str));

String userAllPostModelToJson(UserAllPostModel data) =>
    json.encode(data.toJson());

class UserAllPostModel {
  UserAllPostModel({
    this.success,
    required this.data,
    this.message,
  });

  bool? success;
  List<Datum> data;
  String? message;

  factory UserAllPostModel.fromJson(Map<String, dynamic> json) =>
      UserAllPostModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.userName,
    this.description,
    this.productId,
    this.productName,
    this.productTitle,
    this.productPrice,
    this.productCategoryId,
    this.productSize,
    this.photo,
    this.status,
    this.refId,
    this.refTable,
    this.createdAt,
  });

  String? id;
  String? userId;
  String? userName;
  String? description;
  String? productId;
  String? productName;
  String? productTitle;
  String? productPrice;
  String? productCategoryId;
  String? productSize;
  String? photo;
  String? status;
  String? refId;
  String? refTable;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"] == null ? null : json["user_name"],
        description: json["description"],
        productId: json["product_id"],
        productName: json["product_name"],
        productTitle: json["product_title"],
        productPrice: json["product_price"],
        productCategoryId: json["product_category_id"],
        productSize: json["product_size"],
        photo: json["photo"],
        status: json["status"],
        refId: json["ref_id"],
        refTable: json["ref_table"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName == null ? null : userName,
        "description": description,
        "product_id": productId,
        "product_name": productName,
        "product_title": productTitle,
        "product_price": productPrice,
        "product_category_id": productCategoryId,
        "product_size": productSize,
        "photo": photo,
        "status": status,
        "ref_id": refId,
        "ref_table": refTable,
        "created_at": createdAt!.toIso8601String(),
      };
}
