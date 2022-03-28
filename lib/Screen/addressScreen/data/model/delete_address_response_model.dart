class DeleteAddressResponseModel {
  DeleteAddressResponseModel({
    this.isSuccess,
    this.message,
    this.deleteAddressData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? deleteAddressData;

  factory DeleteAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteAddressResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        deleteAddressData: List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(deleteAddressData!.map((x) => x)),
      };
}
