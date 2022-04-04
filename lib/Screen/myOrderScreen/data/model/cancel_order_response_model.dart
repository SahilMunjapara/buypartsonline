class CancelOrderResponseModel {
  CancelOrderResponseModel({
    this.isSuccess,
    this.message,
    this.cancelOrderData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? cancelOrderData;

  factory CancelOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      CancelOrderResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        cancelOrderData: List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(cancelOrderData!.map((x) => x)),
      };
}
