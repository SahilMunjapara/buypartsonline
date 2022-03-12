class CartDefaultAddressResponseModel {
  CartDefaultAddressResponseModel({
    this.cartDefaultAddressData,
    this.isSuccess,
    this.message,
  });

  List<dynamic>? cartDefaultAddressData;
  bool? isSuccess;
  String? message;

  factory CartDefaultAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      CartDefaultAddressResponseModel(
        cartDefaultAddressData: List<dynamic>.from(json["Data"].map((x) => x)),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(cartDefaultAddressData!.map((x) => x)),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}
