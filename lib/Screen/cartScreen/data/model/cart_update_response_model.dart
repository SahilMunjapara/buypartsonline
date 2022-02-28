class CartUpdateResponseModel {
  CartUpdateResponseModel({
    this.data,
    this.isSuccess,
    this.message,
  });

  List<dynamic>? data;
  bool? isSuccess;
  String? message;

  factory CartUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      CartUpdateResponseModel(
        data: json["Data"],
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data,
        "IsSuccess": isSuccess,
        "Message": message,
      };
}
