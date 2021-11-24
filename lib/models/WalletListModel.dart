// To parse this JSON data, do
//
//     final walletListModel = walletListModelFromJson(jsonString);

import 'dart:convert';

class WalletListModel {
  WalletListModel({
    this.customer,
  });

  final List<Customers> customer;

  factory WalletListModel.fromRawJson(String str) =>
      WalletListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletListModel.fromJson(Map<String, dynamic> json) =>
      WalletListModel(
        customer: List<Customers>.from(
            json["customer"].map((x) => Customers.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer": List<dynamic>.from(customer.map((x) => x.toJson())),
      };
}

class Customers {
  Customers({
    this.id,
    this.customer,
    this.amount,
    this.referenceNumber,
    this.date,
    this.status,
  });

  final String id;
  final String customer;
  final String amount;
  final String referenceNumber;
  final DateTime date;
  final String status;

  factory Customers.fromRawJson(String str) =>
      Customers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        customer: json["customer"],
        amount: json["amount"],
        referenceNumber: json["referenceNumber"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer,
        "amount": amount,
        "referenceNumber": referenceNumber,
        "date": date.toIso8601String(),
        "status": status,
      };
}
