class CancleOrderResponseModel {
  CancleOrderResponseModel({
    this.isSuccess,
    this.message,
    this.cancleOrderData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? cancleOrderData;

  factory CancleOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      CancleOrderResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        cancleOrderData: List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(cancleOrderData!.map((x) => x)),
      };
}
