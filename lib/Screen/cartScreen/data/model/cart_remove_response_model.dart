class CartRemoveResponseModel {
  CartRemoveResponseModel({
    this.data,
    this.isSuccess,
    this.message,
  });

  List<dynamic>? data;
  bool? isSuccess;
  String? message;

  factory CartRemoveResponseModel.fromJson(Map<String, dynamic> json) =>
      CartRemoveResponseModel(
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
