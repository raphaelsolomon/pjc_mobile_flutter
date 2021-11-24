// To parse this JSON data, do
//
//     final walletRecent = walletRecentFromJson(jsonString);

import 'dart:convert';

class WalletRecent {
  WalletRecent({
    this.walletRecent,
  });

  List<WalletRecentElement> walletRecent;

  factory WalletRecent.fromRawJson(String str) =>
      WalletRecent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletRecent.fromJson(Map<String, dynamic> json) => WalletRecent(
        walletRecent: List<WalletRecentElement>.from(
            json["walletRecent"].map((x) => WalletRecentElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "walletRecent": List<dynamic>.from(walletRecent.map((x) => x.toJson())),
      };
}

class WalletRecentElement {
  WalletRecentElement({
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

  factory WalletRecentElement.fromRawJson(String str) =>
      WalletRecentElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletRecentElement.fromJson(Map<String, dynamic> json) =>
      WalletRecentElement(
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
