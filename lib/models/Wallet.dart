import 'dart:convert';

class Wallet {
  Wallet({
    this.totalInvest,
    this.availBalance,
  });

  String totalInvest;
  int availBalance;

  factory Wallet.fromRawJson(String str) => Wallet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        totalInvest: json["totalInvest"],
        availBalance: json["availBalance"],
      );

  Map<String, dynamic> toJson() => {
        "totalInvest": totalInvest,
        "availBalance": availBalance,
      };
}
