// To parse this JSON data, do
//
//     final powerModel = powerModelFromJson(jsonString);

import 'dart:convert';

PowerModel powerModelFromJson(String str) =>
    PowerModel.fromJson(json.decode(str));

String powerModelToJson(PowerModel data) => json.encode(data.toJson());

class PowerModel {
  PowerModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<PowerData> data;

  factory PowerModel.fromJson(Map<String, dynamic> json) => PowerModel(
        status: json["status"],
        message: json["message"],
        data: List<PowerData>.from(
            json["data"].map((x) => PowerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PowerData {
  PowerData({
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
  double defaultCommission;
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

  factory PowerData.fromJson(Map<String, dynamic> json) => PowerData(
        id: json["id"],
        billerCode: json["biller_code"],
        name: json["name"],
        defaultCommission: json["default_commission"].toDouble(),
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
