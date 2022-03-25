import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/Utils/log_utils/log_util.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:http/http.dart' as http;

//This Class is not complete, under modification

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();

  Future<dynamic> post(
    String url,
    dynamic body, {
    bool isBaseUrl = true,
    Map<String, String>? headers,
    bool isCallBackUrl = false,
  }) async {
    var client = http.Client();
    try {
      late String fullURL;
      late Map<String, String> header;
      if (isBaseUrl) {
        fullURL = baseURL + url;
        header = {};
      } else {
        fullURL = url;
        header = headers!;
      }

      LogUtils.showLogs(message: fullURL, tag: 'API Url');
      LogUtils.showLogs(message: '$header', tag: 'API header');
      LogUtils.showLogs(message: '$body', tag: 'API body');

      var uri = Uri.parse(fullURL);

      var response = await http
          .post(uri, body: body, headers: header)
          .timeout(const Duration(seconds: 30));
      LogUtils.showLogs(
          message: response.statusCode.toString(), tag: 'Response statusCode');
      return checkResponse(response, isCallBackUrl: isCallBackUrl);
    } catch (exception) {
      client.close();
      throw AppException.exceptionHandler(exception);
    }
  }

  Future<dynamic> get(String url) async {
    final client = http.Client();
    try {
      String fullURL = baseURL + url;
      Map<String, String> header = {
        // 'Authorization': 'Bearer ',
        // 'Content-Type': 'application/json'
      };

      LogUtils.showLogs(message: fullURL, tag: 'API Url');
      LogUtils.showLogs(message: '$header', tag: 'API header');

      var uri = Uri.parse(fullURL);
      var response = await client
          .get(uri, headers: header)
          .timeout(const Duration(seconds: 30));

      // LogUtils.showLogs(message: response.body, tag: 'Response Body');
      LogUtils.showLogs(
          message: response.statusCode.toString(), tag: 'Response statusCode');

      return checkResponse(response);
    } catch (exception) {
      client.close();
      throw AppException.exceptionHandler(exception);
    }
  }

  Future<dynamic> delete(String url) async {
    var client = http.Client();
    try {
      String fullURL = baseURL + url;
      Map<String, String> header = {
        // 'Authorization': 'Bearer ',
        // 'Content-Type': 'application/json'
      };

      LogUtils.showLogs(message: fullURL, tag: 'API Url');
      LogUtils.showLogs(message: '$header', tag: 'API header');

      var uri = Uri.parse(fullURL);
      var response = await client.delete(uri, headers: header);

      LogUtils.showLogs(
          message: response.statusCode.toString(), tag: 'Response statusCode');

      return checkResponse(response);
    } catch (exception, stackTrace) {
      client.close();
      throw AppException.exceptionHandler(exception, stackTrace);
    }
  }

  Future<dynamic> multiPartPostRequest(
      String url, Map<String, String> body, File image) async {
    var client = http.Client();
    try {
      String fullURL = baseURL + url;

      var header = {
        'Authorization': 'Bearer ',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      LogUtils.showLogs(message: fullURL, tag: 'API Url');
      log('API body: $body');
      log('API header: $header');

      var request = http.MultipartRequest('POST', Uri.parse(fullURL));

      request.fields.addAll(body);

      request.headers.addAll(header);

      request.files
          .add(await http.MultipartFile.fromPath('file', image.absolute.path));

      print("request.fields => ${request.fields}");

      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print("Response code of Login API ==> ${response.statusCode}");

      if (response.statusCode == 200) {
        print(response.body);
        return checkResponse(response);
      } else {
        print(response.reasonPhrase);
      }
    } catch (exception) {
      client.close();
      rethrow;
    }
  }

  dynamic checkResponse(http.Response response, {bool isCallBackUrl = false}) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    switch (response.statusCode) {
      case 200:
        try {
          if (isCallBackUrl) {
            return callBackUrlJson;
          }
          var json = jsonDecode(response.body);
          LogUtils.showLogs(message: '$json', tag: 'API RESPONSE');
          if (json['IsSuccess'] ?? false) {
            if (_numeric.hasMatch(json['Data'].toString())) {
              json['Data'] = [json['Data']];
            }
            // if (json['Data'] == 1 || json['Data'] == '1') {
            //   json['Data'] = [json['Data']];
            // }
            return json;
          } else {
            throw AppException(
                message: json['Message'], errorCode: response.statusCode);
          }
        } catch (e, stackTrace) {
          throw AppException.exceptionHandler(e, stackTrace);
        }
      case 201:
      case 400:
      case 401:
      case 500:
      case 502:
        throw AppException(
            message: "Looks like our server is down for maintenance," +
                r'''\n\n''' +
                "Please try again later.",
            errorCode: response.statusCode);
      default:
        throw AppException(
            message: "Unable to communicate with the server at the moment." +
                r'''\n\n''' +
                "Please try again later",
            errorCode: response.statusCode);
    }
  }
}
