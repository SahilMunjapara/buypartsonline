class BrandResponseModel {
  BrandResponseModel({
    this.brandData,
    this.isSuccess,
    this.message,
  });

  List<BrandData>? brandData;
  bool? isSuccess;
  String? message;

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) =>
      BrandResponseModel(
        brandData: List<BrandData>.from(
            json["Data"].map((x) => BrandData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(brandData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class BrandData {
  BrandData({
    this.brandId,
    this.brandName,
    this.brandImage,
  });

  String? brandId;
  String? brandName;
  String? brandImage;

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
        brandId: json["BrandId"],
        brandName: json["BrandName"],
        brandImage: json["BrandImage"],
      );

  Map<String, dynamic> toJson() => {
        "BrandId": brandId,
        "BrandName": brandName,
        "BrandImage": brandImage,
      };
}
