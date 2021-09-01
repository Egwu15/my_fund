// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.success,
    this.data,
  });

  var success;
  var data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.fullName,
    this.bank,
    this.account,
    this.phone,
    this.otpVerify,
    this.refererCode,
    this.refererReference,
    this.picture,
    this.changePassword,
    this.occupation,
  });

  var id;
  var name;
  var email;

  var fullName;
  var bank;
  var account;
  var phone;
  var otpVerify;
  var refererCode;
  var refererReference;
  var picture;
  var changePassword;
  var occupation;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        bank: json["bank"] == null ? null : json["bank"],
        account: json["account"],
        phone: json["phone"] == null ? null : json["phone"],
        otpVerify: json["otp_verify"] == null ? null : json["otp_verify"],
        refererCode: json["refererCode"] == null ? null : json["refererCode"],
        refererReference:
            json["refererReference"] == null ? null : json["refererReference"],
        picture: json["picture"] == null ? null : json["picture"],
        changePassword:
            json["changePassword"] == null ? null : json["changePassword"],
        occupation: json["occupation"] == null ? null : json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "fullName": fullName == null ? null : fullName,
        "bank": bank == null ? null : bank,
        "account": account,
        "phone": phone == null ? null : phone,
        "otp_verify": otpVerify == null ? null : otpVerify,
        "refererCode": refererCode == null ? null : refererCode,
        "refererReference": refererReference == null ? null : refererReference,
        "picture": picture == null ? null : picture,
        "changePassword": changePassword == null ? null : changePassword,
        "occupation": occupation == null ? null : occupation,
      };
}
