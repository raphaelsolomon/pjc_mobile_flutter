// To parse this JSON data, do
//
//     final investmentHistory = investmentHistoryFromJson(jsonString);

import 'dart:convert';

class InvestmentHistory {
  InvestmentHistory({
    this.customer,
  });

  List<CustomerHistory> customer;

  factory InvestmentHistory.fromRawJson(String str) =>
      InvestmentHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InvestmentHistory.fromJson(Map<String, dynamic> json) =>
      InvestmentHistory(
        customer: List<CustomerHistory>.from(
            json["customer"].map((x) => CustomerHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer": List<dynamic>.from(customer.map((x) => x.toJson())),
      };
}

class CustomerHistory {
  CustomerHistory({
    this.id,
    this.customer,
    this.acctType,
    this.amount,
    this.duration,
    this.description,
    this.investDate,
    this.payStatus,
    this.status,
    this.payoutDeadline,
  });

  String id;
  String customer;
  String acctType;
  String amount;
  String duration;
  String description;
  DateTime investDate;
  String payStatus;
  String status;
  PayoutDeadline payoutDeadline;

  factory CustomerHistory.fromRawJson(String str) =>
      CustomerHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerHistory.fromJson(Map<String, dynamic> json) =>
      CustomerHistory(
        id: json["id"],
        customer: json["customer"],
        acctType: json["acct_type"],
        amount: json["amount"],
        duration: json["duration"],
        description: json["description"],
        investDate: DateTime.parse(json["invest_date"]),
        payStatus: json["pay_status"],
        status: json["status"],
        payoutDeadline: PayoutDeadline.fromJson(json["payout_deadline"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer,
        "acct_type": acctType,
        "amount": amount,
        "duration": duration,
        "description": description,
        "invest_date": investDate.toIso8601String(),
        "pay_status": payStatus,
        "status": status,
        "payout_deadline": payoutDeadline.toJson(),
      };
}

class PayoutDeadline {
  PayoutDeadline({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory PayoutDeadline.fromRawJson(String str) =>
      PayoutDeadline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayoutDeadline.fromJson(Map<String, dynamic> json) => PayoutDeadline(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
