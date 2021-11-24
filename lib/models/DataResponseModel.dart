// To parse this JSON data, do
//
//     final dataResponseModel = dataResponseModelFromJson(jsonString);

import 'dart:convert';

DataResponseModel dataResponseModelFromJson(String str) =>
    DataResponseModel.fromJson(json.decode(str));

String dataResponseModelToJson(DataResponseModel data) =>
    json.encode(data.toJson());

class DataResponseModel {
  DataResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory DataResponseModel.fromJson(Map<String, dynamic> json) =>
      DataResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.phoneNumber,
    this.amount,
    this.network,
    this.flwRef,
    this.reference,
  });

  String phoneNumber;
  int amount;
  String network;
  String flwRef;
  String reference;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        phoneNumber: json["phone_number"],
        amount: json["amount"],
        network: json["network"],
        flwRef: json["flw_ref"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "amount": amount,
        "network": network,
        "flw_ref": flwRef,
        "reference": reference,
      };
}
