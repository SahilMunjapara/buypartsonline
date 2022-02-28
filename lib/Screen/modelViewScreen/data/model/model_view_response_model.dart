class ModelViewResponseModel {
  ModelViewResponseModel({
    this.modelViewData,
    this.categoryData,
    this.isSuccess,
    this.message,
    this.maxRange,
    this.totalLength,
  });

  List<ModelViewData>? modelViewData;
  String? categoryData;
  bool? isSuccess;
  String? message;
  String? maxRange;
  String? totalLength;

  factory ModelViewResponseModel.fromJson(Map<String, dynamic> json) =>
      ModelViewResponseModel(
        modelViewData: List<ModelViewData>.from(
            json["Data"].map((x) => ModelViewData.fromJson(x))),
        categoryData: json["CategoryData"],
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        maxRange: json["MaxRange"],
        totalLength: json["TotalLength"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(modelViewData!.map((x) => x.toJson())),
        "CategoryData": categoryData,
        "IsSuccess": isSuccess,
        "Message": message,
        "MaxRange": maxRange,
        "TotalLength": totalLength,
      };
}

class ModelViewData {
  ModelViewData({
    this.partId,
    this.partName,
    this.partOfferCode,
    this.partImages,
    this.partWeight,
    this.categoryId,
    this.subcategoryId,
    this.brandId,
    this.modificationModelNo,
    this.partMrp,
    this.partSrp,
    this.partDiscount,
    this.partNumber,
    this.partOrigin,
    this.partDescription,
    this.partQty,
    this.partMoq,
    this.partLessMoqDiscount,
    this.partMoreMoqDiscount,
    this.partReturn,
    this.partHsnCode,
    this.partHsnTax,
    this.partStatus,
    this.partCdt,
    this.brandName,
    this.brandImage,
    this.brandSlug,
    this.brandPriority,
    this.brandStatus,
    this.brandCdt,
    this.latestStock,
    this.isCart,
  });

  String? partId;
  String? partName;
  String? partOfferCode;
  String? partImages;
  String? partWeight;
  String? categoryId;
  String? subcategoryId;
  String? brandId;
  String? modificationModelNo;
  String? partMrp;
  String? partSrp;
  String? partDiscount;
  String? partNumber;
  String? partOrigin;
  String? partDescription;
  String? partQty;
  String? partMoq;
  String? partLessMoqDiscount;
  String? partMoreMoqDiscount;
  String? partReturn;
  String? partHsnCode;
  String? partHsnTax;
  String? partStatus;
  String? partCdt;
  String? brandName;
  String? brandImage;
  String? brandSlug;
  String? brandPriority;
  String? brandStatus;
  DateTime? brandCdt;
  String? latestStock;
  bool? isCart;

  factory ModelViewData.fromJson(Map<String, dynamic> json) => ModelViewData(
        partId: json["PartId"],
        partName: json["PartName"],
        partOfferCode: json["PartOfferCode"],
        partImages: json["PartImages"],
        partWeight: json["PartWeight"],
        categoryId: json["CategoryId"],
        subcategoryId: json["SubcategoryId"],
        brandId: json["BrandId"],
        modificationModelNo: json["ModificationModelNo"],
        partMrp: json["PartMrp"],
        partSrp: json["PartSrp"],
        partDiscount: json["PartDiscount"],
        partNumber: json["PartNumber"],
        partOrigin: json["PartOrigin"],
        partDescription: json["PartDescription"],
        partQty: json["PartQty"],
        partMoq: json["PartMoq"],
        partLessMoqDiscount: json["PartLessMoqDiscount"],
        partMoreMoqDiscount: json["PartMoreMoqDiscount"],
        partReturn: json["PartReturn"],
        partHsnCode: json["PartHsnCode"],
        partHsnTax: json["PartHsnTax"],
        partStatus: json["PartStatus"],
        partCdt: json["PartCDT"],
        brandName: json["BrandName"],
        brandImage: json["BrandImage"],
        brandSlug: json["BrandSlug"],
        brandPriority: json["BrandPriority"],
        brandStatus: json["BrandStatus"],
        brandCdt: DateTime.parse(json["BrandCDT"]),
        latestStock: json["latestStock"],
        isCart: json["isCart"],
      );

  Map<String, dynamic> toJson() => {
        "PartId": partId,
        "PartName": partName,
        "PartOfferCode": partOfferCode,
        "PartImages": partImages,
        "PartWeight": partWeight,
        "CategoryId": categoryId,
        "SubcategoryId": subcategoryId,
        "BrandId": brandId,
        "ModificationModelNo": modificationModelNo,
        "PartMrp": partMrp,
        "PartSrp": partSrp,
        "PartDiscount": partDiscount,
        "PartNumber": partNumber,
        "PartOrigin": partOrigin,
        "PartDescription": partDescription,
        "PartQty": partQty,
        "PartMoq": partMoq,
        "PartLessMoqDiscount": partLessMoqDiscount,
        "PartMoreMoqDiscount": partMoreMoqDiscount,
        "PartReturn": partReturn,
        "PartHsnCode": partHsnCode,
        "PartHsnTax": partHsnTax,
        "PartStatus": partStatus,
        "PartCDT": partCdt,
        "BrandName": brandName,
        "BrandImage": brandImage,
        "BrandSlug": brandSlug,
        "BrandPriority": brandPriority,
        "BrandStatus": brandStatus,
        "BrandCDT": brandCdt!.toIso8601String(),
        "latestStock": latestStock,
        "isCart": isCart,
      };
}
