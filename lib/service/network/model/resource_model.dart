import 'dart:io';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:http/http.dart' as http;

class Resource<T> {
  T? data;
  String? error;
  int? statusCode;

  Resource({this.data, this.error, this.statusCode});
}

class ApiResponse<T> {
  T? model;
  String? errorMessage;
  int? statusCode;
  String? localErrorMessage;
  String? localErrorTitle;
  bool? isNetworkError;
  bool? success;

  ApiResponse(this.model) {
    success = true;
    isNetworkError = false;
    statusCode = HttpStatus.ok;
  }

  ApiResponse.networkFailure(this.localErrorTitle, this.localErrorMessage) {
    success = false;
    isNetworkError = true;
  }

  ApiResponse.specificFailure(this.localErrorTitle, this.localErrorMessage) {
    success = false;
    isNetworkError = false;
  }

  ApiResponse.failure(this.statusCode, [this.model]) {
    String serverMsg = "";
    if (model != null) {
      serverMsg = (model as http.Response).body;
    }
    switch (statusCode) {
      default:
        if (400 <= statusCode! && statusCode! < 500) {
          localErrorMessage = serverMsg.isNotEmpty
              ? serverMsg
              : NetworkConstants.errorMessage4xx;
          localErrorTitle = NetworkConstants.errorTitle4xx;
        } else if (500 <= statusCode! && statusCode! < 600) {
          localErrorMessage = NetworkConstants.errorMessage5xx;
          localErrorTitle = NetworkConstants.errorTitle5xx;
        } else {
          localErrorMessage = NetworkConstants.errorUnknownError;
          localErrorTitle = NetworkConstants.errorTitle;
        }
        break;
    }
    success = false;
    isNetworkError = false;
  }

  ApiResponse.constructFrom(ApiResponse apiResponse) {
    localErrorMessage = apiResponse.localErrorMessage;
    localErrorTitle = apiResponse.localErrorTitle;
    success = apiResponse.success;
    isNetworkError = apiResponse.isNetworkError;
  }
  
  @override
  String toString() {
    return 'ApiResponse{model: $model, errorMessage: $errorMessage, success: $success}';
  }
}
