import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_structure_with_riverpod/utils/utils.dart';

class APIBaseHelper {
  Future<http.Response> get({required String url}) async {
    debugPrint(url);
    Uri uri = Uri.parse(APIConstants.baseUrl + url);
    Map<String, String> headers = StorageService.getAccessToken().isNotEmpty
        ? {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": StorageService.getAccessToken(),
          }
        : {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };

    try {
      Console.debugPrint(msg: APIConstants.baseUrl + url, key: "URL");
      Console.debugPrint(msg: headers.toString(), key: "Header");

      final response = await http.get(uri, headers: headers);
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw Failures(
        failureType: FailureType.socketException,
        msg: StringConstants.noInternet,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> put({required String url, Map<String, dynamic>? parameters}) async {
    debugPrint(url);
    Uri uri = Uri.parse(APIConstants.baseUrl + url);
    Map<String, String> headers = StorageService.getAccessToken().isNotEmpty
        ? {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": StorageService.getAccessToken(),
          }
        : {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };

    try {
      Console.debugPrint(msg: APIConstants.baseUrl + url, key: "URL");
      Console.debugPrint(msg: headers.toString(), key: "Header");
      Console.debugPrint(msg: jsonEncode(parameters), key: "Body");

      final response = await http.put(uri, headers: headers, body: jsonEncode(parameters));
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw Failures(
        failureType: FailureType.socketException,
        msg: StringConstants.noInternet,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post({required String url, required Map<String, dynamic>? parameters}) async {
    Uri uri = Uri.parse(APIConstants.baseUrl + url);
    Map<String, String> headers = StorageService.getAccessToken().isNotEmpty
        ? {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": StorageService.getAccessToken(),
          }
        : {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };

    try {
      Console.debugPrint(msg: APIConstants.baseUrl + url, key: "URL");
      Console.debugPrint(msg: headers.toString(), key: "Header");
      Console.debugPrint(msg: jsonEncode(parameters), key: "Body");

      final response = await http.post(uri, headers: headers, body: jsonEncode(parameters));
      return _response(response);
    } on SocketException {
      throw Failures(
        failureType: FailureType.socketException,
        msg: StringConstants.noInternet,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> putMultipart({required String url, required Map<String, String>? parameters, String? profileImage}) async {
    Uri uri = Uri.parse(APIConstants.baseUrl + url);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
      "Authorization": StorageService.getAccessToken(),
    };

    try {
      Console.debugPrint(msg: uri, key: "URL");
      Console.debugPrint(msg: headers.toString(), key: "Header");
      Console.debugPrint(msg: jsonEncode(parameters), key: "Body");

      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(headers);
      request.fields.addAll(parameters ?? {});

      if (profileImage?.isNotEmpty ?? false) {
        request.files.add(await http.MultipartFile.fromPath('profile', profileImage!));
        Console.debugLongPrint(msg: request.files.first.field);
        Console.debugLongPrint(msg: request.files.first.contentType);
        Console.debugLongPrint(msg: request.files.first.filename);
      }

      http.StreamedResponse response = await request.send();

      String temp = await response.stream.bytesToString();
      Console.debugLongPrint(msg: temp);
      return temp;
    } on SocketException {
      throw Failures(
        failureType: FailureType.socketException,
        msg: StringConstants.noInternet,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> putMultipleMultipart({required String url, required Map<String, String> parameters, required List<String> images}) async {
    Uri uri = Uri.parse(APIConstants.baseUrl + url);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
      "Authorization": StorageService.getAccessToken(),
    };

    try {
      Console.debugPrint(msg: uri, key: "URL");
      Console.debugPrint(msg: headers.toString(), key: "Header");
      Console.debugPrint(msg: jsonEncode(parameters), key: "Body");

      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(headers);
      request.fields.addAll(parameters);

      if (images.isNotEmpty) {
        for (var imagePath in images) {
          request.files.add(await http.MultipartFile.fromPath('documentsFiles', imagePath));
        }
        Console.debugLongPrint(msg: request.files.first.field);
        Console.debugLongPrint(msg: request.files.first.contentType);
        Console.debugLongPrint(msg: request.files.first.filename);
      }

      http.StreamedResponse response = await request.send();

      String temp = await response.stream.bytesToString();
      Console.debugLongPrint(msg: temp);
      return temp;
    } on SocketException {
      throw Failures(
        failureType: FailureType.socketException,
        msg: StringConstants.noInternet,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> delete({required String url}) async {
    Uri uri = Uri.parse(APIConstants.baseUrl + url);
    Map<String, String> headers = StorageService.getAccessToken().isNotEmpty
        ? {
            "Accept": "application/json",
            "Authorization": StorageService.getAccessToken(),
          }
        : {"Accept": "application/json"};

    try {
      Console.debugPrint(msg: uri, key: "URL");
      Console.debugPrint(msg: headers.toString(), key: "Header");

      final response = await http.delete(uri, headers: headers);
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      throw Failures(
        failureType: FailureType.socketException,
        msg: StringConstants.noInternet,
      );
    } catch (e) {
      rethrow;
    }
  }

  http.Response _response(http.Response response) {
    Console.debugPrint(msg: response.statusCode.toString(), key: "Response Data Status Code");
    Console.debugLongPrint(msg: response.body.toString(), key: "Response Data");
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 204:
        return response;
      case 400:
        throw Failures(
          failureType: FailureType.validationError,
          msg: jsonDecode(response.body)['message'],
        );
      case 401:
        StorageService.clear();
        throw Failures(
          failureType: FailureType.unAuthorised,
          msg: jsonDecode(response.body)['message'],
        );
      case 403:
        throw Failures(
          failureType: FailureType.validationError,
          msg: jsonDecode(response.body)['message'],
        );
      case 409:
        throw Failures(
          failureType: FailureType.validationError,
          msg: jsonDecode(response.body)['message'],
        );
      case 422:
        throw Failures(
          failureType: FailureType.validationError,
          msg: jsonDecode(response.body)['message'],
        );
      case 404:
        throw Failures(failureType: FailureType.unexpected, msg: StringConstants.generalErrorMsg);
      case 503:
        throw Failures(
          failureType: FailureType.unAuthorised,
          msg: jsonDecode(response.body)['message'],
        );
      default:
        throw Failures(
          failureType: FailureType.unexpected,
          msg: StringConstants.generalErrorMsg,
        );
    }
  }
}

class Failures implements Exception {
  final FailureType failureType;
  final String msg;
  Failures({required this.failureType, required this.msg});
}
