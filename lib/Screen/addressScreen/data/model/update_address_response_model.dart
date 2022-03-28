class UpdateAddressResponseModel {
  UpdateAddressResponseModel({
    this.isSuccess,
    this.message,
    this.updateAddressData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? updateAddressData;

  factory UpdateAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateAddressResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        updateAddressData: List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(updateAddressData!.map((x) => x)),
      };
}
