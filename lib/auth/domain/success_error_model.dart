import 'dart:convert';

class SuccessErrorModel {
  bool? isSuccess;
  int? statusCode;
  String? message;

  SuccessErrorModel({
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  SuccessErrorModel copyWith({
    bool? isSuccess,
    int? statusCode,
    String? message,
  }) =>
      SuccessErrorModel(
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  factory SuccessErrorModel.fromJson(String str) => SuccessErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SuccessErrorModel.fromMap(Map<String, dynamic> json) => SuccessErrorModel(
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "message": message,
      };
}
