// To parse this JSON data, do
//
//     final responseRave = responseRaveFromJson(jsonString);

import 'dart:convert';

ResponseRave responseRaveFromJson(String str) =>
    ResponseRave.fromJson(json.decode(str));

String responseRaveToJson(ResponseRave data) => json.encode(data.toJson());

class ResponseRave {
  ResponseRave({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory ResponseRave.fromJson(Map<String, dynamic> json) => ResponseRave(
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
    this.id,
    this.txRef,
    this.orderRef,
    this.flwRef,
    this.redirectUrl,
    this.deviceFingerprint,
    this.settlementToken,
    this.cycle,
    this.amount,
    this.chargedAmount,
    this.appfee,
    this.merchantfee,
    this.merchantbearsfee,
    this.chargeResponseCode,
    this.raveRef,
    this.chargeResponseMessage,
    this.authModelUsed,
    this.currency,
    this.ip,
    this.narration,
    this.status,
    this.modalauditid,
    this.vbvrespmessage,
    this.authurl,
    this.vbvrespcode,
    this.acctvalrespmsg,
    this.acctvalrespcode,
    this.paymentType,
    this.paymentPlan,
    this.paymentPage,
    this.paymentId,
    this.fraudStatus,
    this.chargeType,
    this.isLive,
    this.retryAttempt,
    this.getpaidBatchId,
    this.createdAt,
  });

  int id;
  double txRef;
  String orderRef;
  String flwRef;
  String redirectUrl;
  String deviceFingerprint;
  dynamic settlementToken;
  String cycle;
  int amount;
  double chargedAmount;
  double appfee;
  int merchantfee;
  int merchantbearsfee;
  String chargeResponseCode;
  String raveRef;
  String chargeResponseMessage;
  String authModelUsed;
  String currency;
  String ip;
  String narration;
  String status;
  String modalauditid;
  String vbvrespmessage;
  String authurl;
  String vbvrespcode;
  dynamic acctvalrespmsg;
  dynamic acctvalrespcode;
  String paymentType;
  dynamic paymentPlan;
  dynamic paymentPage;
  String paymentId;
  String fraudStatus;
  String chargeType;
  int isLive;
  dynamic retryAttempt;
  dynamic getpaidBatchId;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        txRef: json["txRef"].toDouble(),
        orderRef: json["orderRef"],
        flwRef: json["flwRef"],
        redirectUrl: json["redirectUrl"],
        deviceFingerprint: json["device_fingerprint"],
        settlementToken: json["settlement_token"],
        cycle: json["cycle"],
        amount: json["amount"],
        chargedAmount: json["charged_amount"].toDouble(),
        appfee: json["appfee"].toDouble(),
        merchantfee: json["merchantfee"],
        merchantbearsfee: json["merchantbearsfee"],
        chargeResponseCode: json["chargeResponseCode"],
        raveRef: json["raveRef"],
        chargeResponseMessage: json["chargeResponseMessage"],
        authModelUsed: json["authModelUsed"],
        currency: json["currency"],
        ip: json["IP"],
        narration: json["narration"],
        status: json["status"],
        modalauditid: json["modalauditid"],
        vbvrespmessage: json["vbvrespmessage"],
        authurl: json["authurl"],
        vbvrespcode: json["vbvrespcode"],
        acctvalrespmsg: json["acctvalrespmsg"],
        acctvalrespcode: json["acctvalrespcode"],
        paymentType: json["paymentType"],
        paymentPlan: json["paymentPlan"],
        paymentPage: json["paymentPage"],
        paymentId: json["paymentId"],
        fraudStatus: json["fraud_status"],
        chargeType: json["charge_type"],
        isLive: json["is_live"],
        retryAttempt: json["retry_attempt"],
        getpaidBatchId: json["getpaidBatchId"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "txRef": txRef,
        "orderRef": orderRef,
        "flwRef": flwRef,
        "redirectUrl": redirectUrl,
        "device_fingerprint": deviceFingerprint,
        "settlement_token": settlementToken,
        "cycle": cycle,
        "amount": amount,
        "charged_amount": chargedAmount,
        "appfee": appfee,
        "merchantfee": merchantfee,
        "merchantbearsfee": merchantbearsfee,
        "chargeResponseCode": chargeResponseCode,
        "raveRef": raveRef,
        "chargeResponseMessage": chargeResponseMessage,
        "authModelUsed": authModelUsed,
        "currency": currency,
        "IP": ip,
        "narration": narration,
        "status": status,
        "modalauditid": modalauditid,
        "vbvrespmessage": vbvrespmessage,
        "authurl": authurl,
        "vbvrespcode": vbvrespcode,
        "acctvalrespmsg": acctvalrespmsg,
        "acctvalrespcode": acctvalrespcode,
        "paymentType": paymentType,
        "paymentPlan": paymentPlan,
        "paymentPage": paymentPage,
        "paymentId": paymentId,
        "fraud_status": fraudStatus,
        "charge_type": chargeType,
        "is_live": isLive,
        "retry_attempt": retryAttempt,
        "getpaidBatchId": getpaidBatchId,
        "createdAt": createdAt.toIso8601String(),
      };
}
