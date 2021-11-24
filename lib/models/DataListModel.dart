// To parse this JSON data, do
//
//     final dataListModel = dataListModelFromJson(jsonString);

import 'dart:convert';

DataListModel dataListModelFromJson(String str) =>
    DataListModel.fromJson(json.decode(str));

String dataListModelToJson(DataListModel data) => json.encode(data.toJson());

class DataListModel {
  DataListModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory DataListModel.fromJson(Map<String, dynamic> json) => DataListModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
