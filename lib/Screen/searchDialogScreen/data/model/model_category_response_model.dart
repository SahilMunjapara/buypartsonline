class ModelCategoryResponseModel {
  ModelCategoryResponseModel({
    this.modelCategoryData,
    this.isSuccess,
    this.message,
  });

  List<ModelCategoryData>? modelCategoryData;
  bool? isSuccess;
  String? message;

  factory ModelCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      ModelCategoryResponseModel(
        modelCategoryData: List<ModelCategoryData>.from(
            json["Data"].map((x) => ModelCategoryData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(modelCategoryData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class ModelCategoryData {
  ModelCategoryData({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  String? categoryId;
  String? categoryName;
  String? categoryImage;

  factory ModelCategoryData.fromJson(Map<String, dynamic> json) =>
      ModelCategoryData(
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        categoryImage: json["CategoryImage"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "CategoryImage": categoryImage,
      };
}
