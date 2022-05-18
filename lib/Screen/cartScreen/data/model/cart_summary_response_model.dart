class CartSummaryResponseModel {
  CartSummaryResponseModel({
    this.data,
    this.isSuccess,
    this.message,
  });

  List<CartSummaryData>? data;
  bool? isSuccess;
  String? message;

  factory CartSummaryResponseModel.fromJson(Map<String, dynamic> json) =>
      CartSummaryResponseModel(
        data: List<CartSummaryData>.from(
            json["Data"].map((x) => CartSummaryData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class CartSummaryData {
  CartSummaryData({
    this.subTotal,
    this.save,
  });

  int? subTotal;
  int? save;

  factory CartSummaryData.fromJson(Map<String, dynamic> json) =>
      CartSummaryData(
        subTotal: json["SubTotal"],
        save: json["Save"],
      );

  Map<String, dynamic> toJson() => {
        "SubTotal": subTotal,
        "Save": save,
      };
}
