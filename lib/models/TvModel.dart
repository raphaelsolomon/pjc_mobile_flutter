// To parse this JSON data, do
//
//     final tvModel = tvModelFromJson(jsonString);

import 'dart:convert';

TvModel tvModelFromJson(String str) => TvModel.fromJson(json.decode(str));

String tvModelToJson(TvModel data) => json.encode(data.toJson());

class TvModel {
  TvModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<TvData> data;

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        status: json["status"],
        message: json["message"],
        data: List<TvData>.from(json["data"].map((x) => TvData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TvData {
  TvData({
    this.id,
    this.billerCode,
    this.name,
    this.defaultCommission,
    this.dateAdded,
    this.country,
    this.isAirtime,
    this.billerName,
    this.itemCode,
    this.shortName,
    this.fee,
    this.commissionOnFee,
    this.labelName,
    this.amount,
  });

  int id;
  String billerCode;
  String name;
  var defaultCommission;
  DateTime dateAdded;
  String country;
  bool isAirtime;
  String billerName;
  String itemCode;
  String shortName;
  int fee;
  bool commissionOnFee;
  String labelName;
  int amount;

  factory TvData.fromJson(Map<String, dynamic> json) => TvData(
        id: json["id"],
        billerCode: json["biller_code"],
        name: json["name"],
        defaultCommission: json["default_commission"],
        dateAdded: DateTime.parse(json["date_added"]),
        country: json["country"],
        isAirtime: json["is_airtime"],
        billerName: json["biller_name"],
        itemCode: json["item_code"],
        shortName: json["short_name"],
        fee: json["fee"],
        commissionOnFee: json["commission_on_fee"],
        labelName: json["label_name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "biller_code": billerCode,
        "name": name,
        "default_commission": defaultCommission,
        "date_added": dateAdded.toIso8601String(),
        "country": country,
        "is_airtime": isAirtime,
        "biller_name": billerName,
        "item_code": itemCode,
        "short_name": shortName,
        "fee": fee,
        "commission_on_fee": commissionOnFee,
        "label_name": labelName,
        "amount": amount,
      };
}
