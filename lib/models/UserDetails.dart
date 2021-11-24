// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

class UserDetails {
  final List<Profile> profile;

  UserDetails({
    this.profile,
  });

  factory UserDetails.fromRawJson(String str) =>
      UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        profile:
            List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "profile": List<dynamic>.from(profile.map((x) => x.toJson())),
      };
}

class Profile {
  Profile({
    this.id,
    this.firstname,
    this.lastname,
    this.gender,
    this.email,
    this.address,
    this.phone,
    this.accountNo,
    this.accountName,
    this.regdate,
    this.bank,
    this.platform,
  });

  final String id;
  final String firstname;
  final String lastname;
  final String gender;
  final String email;
  final String address;
  final String phone;
  final String accountNo;
  final String accountName;
  final DateTime regdate;
  final String bank;
  final String platform;

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        accountNo: json["account_no"],
        accountName: json["account_name"],
        regdate: DateTime.parse(json["regdate"]),
        bank: json["bank"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "email": email,
        "address": address,
        "phone": phone,
        "account_no": accountNo,
        "account_name": accountName,
        "regdate": regdate.toIso8601String(),
        "bank": bank,
        "platform": platform,
      };
}
