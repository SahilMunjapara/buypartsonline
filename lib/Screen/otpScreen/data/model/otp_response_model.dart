class OtpResponseModel {
  OtpResponseModel({
    this.isSuccess,
    this.message,
    this.otpData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? otpData;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        otpData: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": otpData,
      };
}
