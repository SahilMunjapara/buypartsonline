class HomeCategoryResponseModel {
  HomeCategoryResponseModel({
    this.categoryData,
    this.isSuccess,
    this.message,
  });

  List<CategoryData>? categoryData;
  bool? isSuccess;
  String? message;

  factory HomeCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoryResponseModel(
        categoryData: List<CategoryData>.from(
            json["Data"].map((x) => CategoryData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(categoryData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class CategoryData {
  CategoryData({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categorySlug,
    this.categoryPriority,
    this.categoryStatus,
    this.categoryCdt,
  });

  String? categoryId;
  String? categoryName;
  String? categoryImage;
  String? categorySlug;
  String? categoryPriority;
  String? categoryStatus;
  String? categoryCdt;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        categoryImage: json["CategoryImage"],
        categorySlug: json["CategorySlug"],
        categoryPriority: json["CategoryPriority"],
        categoryStatus: json["CategoryStatus"],
        categoryCdt: json["CategoryCDT"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "CategoryImage": categoryImage,
        "CategorySlug": categorySlug,
        "CategoryPriority": categoryPriority,
        "CategoryStatus": categoryStatus,
        "CategoryCDT": categoryCdt,
      };
}
