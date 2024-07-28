import 'dart:convert';

class LoginResponseData {
  bool? isSuccess;
  int? statusCode;
  String? message;
  Data? data;

  LoginResponseData({
    this.isSuccess,
    this.statusCode,
    this.message,
    this.data,
  });

  LoginResponseData copyWith({
    bool? isSuccess,
    int? statusCode,
    String? message,
    Data? data,
  }) =>
      LoginResponseData(
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LoginResponseData.fromJson(String str) => LoginResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseData.fromMap(Map<String, dynamic> json) => LoginResponseData(
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  String? accessToken;
  Admin? admin;

  Data({
    this.accessToken,
    this.admin,
  });

  Data copyWith({
    String? accessToken,
    Admin? admin,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        admin: admin ?? this.admin,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        admin: json["admin"] == null ? null : Admin.fromMap(json["admin"]),
      );

  Map<String, dynamic> toMap() => {
        "accessToken": accessToken,
        "admin": admin?.toMap(),
      };
}

class Admin {
  String? id;
  String? name;
  String? email;
  String? role;
  String? outletId;

  Admin({
    this.id,
    this.name,
    this.email,
    this.role,
    this.outletId,
  });

  Admin copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? outletId,
  }) =>
      Admin(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
        outletId: outletId ?? this.outletId,
      );

  factory Admin.fromJson(String str) => Admin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Admin.fromMap(Map<String, dynamic> json) => Admin(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        outletId: json["outletId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "outletId": outletId,
      };
}
