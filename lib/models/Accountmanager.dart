// To parse this JSON data, do
//
//     final accountManager = accountManagerFromJson(jsonString);

import 'dart:convert';

class AccountManager {
  AccountManager({
    this.customer,
  });

  final List<Customer> customer;

  factory AccountManager.fromRawJson(String str) =>
      AccountManager.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccountManager.fromJson(Map<String, dynamic> json) => AccountManager(
        customer: List<Customer>.from(
            json["customer"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer": List<dynamic>.from(customer.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    this.customerFname,
    this.customerLname,
    this.customerEmail,
    this.staffFname,
    this.staffLname,
    this.staffUname,
    this.staffEmail,
    this.staffPhone,
    this.staffStatus,
  });

  final String customerFname;
  final String customerLname;
  final String customerEmail;
  final String staffFname;
  final String staffLname;
  final String staffUname;
  final String staffEmail;
  final String staffPhone;
  final String staffStatus;

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerFname: json["customer_fname"],
        customerLname: json["customer_lname"],
        customerEmail: json["customer_email"],
        staffFname: json["staff_fname"],
        staffLname: json["staff_lname"],
        staffUname: json["staff_uname"],
        staffEmail: json["staff_email"],
        staffPhone: json["staff_phone"],
        staffStatus: json["staff_status"],
      );

  Map<String, dynamic> toJson() => {
        "customer_fname": customerFname,
        "customer_lname": customerLname,
        "customer_email": customerEmail,
        "staff_fname": staffFname,
        "staff_lname": staffLname,
        "staff_uname": staffUname,
        "staff_email": staffEmail,
        "staff_phone": staffPhone,
        "staff_status": staffStatus,
      };
}
