class CartTotalResponseModel {
  CartTotalResponseModel({
    this.counterTotalData = const ['0'],
    this.isSuccess = true,
    this.message = '',
  });

  List<dynamic>? counterTotalData;
  bool? isSuccess;
  String? message;

  factory CartTotalResponseModel.fromJson(Map<String, dynamic> json) =>
      CartTotalResponseModel(
        counterTotalData: json["Data"],
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": counterTotalData,
        "IsSuccess": isSuccess,
        "Message": message,
      };
}
