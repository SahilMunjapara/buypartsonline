class ForgotOtpVerifyResponseModel {
  ForgotOtpVerifyResponseModel({
    this.isSuccess,
    this.message,
    this.forgotOtpVerifyData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? forgotOtpVerifyData;

  factory ForgotOtpVerifyResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotOtpVerifyResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        forgotOtpVerifyData: List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(forgotOtpVerifyData!.map((x) => x)),
      };
}
