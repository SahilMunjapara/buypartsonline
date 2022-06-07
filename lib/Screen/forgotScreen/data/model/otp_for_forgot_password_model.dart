class OtpForForgotPasswordResponseModel {
  OtpForForgotPasswordResponseModel({
    this.isSuccess,
    this.message,
    this.forgotOtpData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? forgotOtpData;

  factory OtpForForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpForForgotPasswordResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        forgotOtpData: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": forgotOtpData,
      };
}
