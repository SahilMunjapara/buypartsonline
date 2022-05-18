class GetCartProductResponseModel {
  GetCartProductResponseModel({
    this.data,
    this.isSuccess,
    this.message,
  });

  List<GetCartProductData>? data;
  bool? isSuccess;
  String? message;

  factory GetCartProductResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCartProductResponseModel(
        data: List<GetCartProductData>.from(
            json["Data"].map((x) => GetCartProductData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class GetCartProductData {
  GetCartProductData({
    this.cartId,
    this.customerId,
    this.partId,
    this.cartQuantity,
    this.cartStatus,
    this.cartCdt,
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
  });

  String? cartId;
  String? customerId;
  String? partId;
  int? cartQuantity;
  String? cartStatus;
  DateTime? cartCdt;
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
  int? partMoq;
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

  factory GetCartProductData.fromJson(Map<String, dynamic> json) =>
      GetCartProductData(
        cartId: json["CartId"],
        customerId: json["CustomerId"],
        partId: json["PartId"],
        cartQuantity: json["CartQuantity"],
        cartStatus: json["CartStatus"],
        cartCdt: DateTime.parse(json["CartCDT"]),
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
      );

  Map<String, dynamic> toJson() => {
        "CartId": cartId,
        "CustomerId": customerId,
        "PartId": partId,
        "CartQuantity": cartQuantity,
        "CartStatus": cartStatus,
        "CartCDT": cartCdt!.toIso8601String(),
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
      };
}
