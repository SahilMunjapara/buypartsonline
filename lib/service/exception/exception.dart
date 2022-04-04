import 'dart:async';
import 'dart:convert';
import 'dart:io';

class AppException implements Exception {
  String message;
  String? tag;
  int errorCode;

  AppException({required this.message, required this.errorCode, this.tag});

  @override
  String toString() {
    return '{"message": "$message", "errorCode": $errorCode}';
  }

  static AppException decodeExceptionData({required String jsonString}) {
    AppException exception;
    try {
      dynamic decodedData = jsonDecode(jsonString);
      exception = AppException(
          message: decodedData['message'], errorCode: decodedData['errorCode']);
    } catch (e) {
      exception = AppException(
          message: "Unable to communicate with the server at the moment."
              r'''\n\n'''
              "Please try again later",
          errorCode: 105);
    }

    return exception;
  }

  static dynamic exceptionHandler(exception, [stackTrace]) {
    print('Exception Message ==> ${exception ?? 'no message'}');

    if (exception is AppException) {
      throw exception;
    } else if (exception is SocketException) {
      print(stackTrace ?? "No stack provided");
      throw AppException(
          message: "Internet not available."
              r'''\n\n'''
              "Cross check your internet connectivity and try again later.",
          errorCode: 101);
    } else if (exception is TimeoutException) {
      print(stackTrace ?? "No stack provided");
      throw AppException(
          message: "The request has timed out."
              r'''\n'''
              "The network seems to be very slow,"
              r'''\n\n'''
              "Please try again!!!",
          errorCode: 102);
    } else if (exception is HttpException) {
      print(stackTrace ?? "No stack provided");
      throw AppException(
          message: "Couldn't find the requested data", errorCode: 103);
    } else if (exception is FormatException) {
      print(stackTrace ?? "No stack provided");
      throw AppException(
          message: "Looks like our server is down for maintenance,"
              r'''\n\n'''
              "Please try again later.",
          errorCode: 104);
    }
    print(stackTrace ?? "No stack provided");
    throw AppException(
        message: "Unable to communicate with the server at the moment."
            r'''\n\n'''
            "Please try again later",
        errorCode: 105);
  }
}
