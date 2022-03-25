class CallBackResponseModel {
  CallBackResponseModel({
    this.callBackData,
    this.isSuccess,
    this.message,
  });

  String? callBackData;
  bool? isSuccess;
  String? message;

  factory CallBackResponseModel.fromJson(Map<String, dynamic> json) =>
      CallBackResponseModel(
        callBackData: json["Data"],
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": callBackData,
        "IsSuccess": isSuccess,
        "Message": message,
      };
}
