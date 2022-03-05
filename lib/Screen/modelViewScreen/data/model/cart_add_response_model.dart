class CartAddResponseModel {
  CartAddResponseModel({
    this.cartAddData,
    this.count,
    this.isSuccess,
    this.message,
  });

  List<CartAddData>? cartAddData;
  int? count;
  bool? isSuccess;
  String? message;

  factory CartAddResponseModel.fromJson(Map<String, dynamic> json) =>
      CartAddResponseModel(
        cartAddData: List<CartAddData>.from(
            json["Data"].map((x) => CartAddData.fromJson(x))),
        count: json["Count"],
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(cartAddData!.map((x) => x)),
        "Count": count,
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class CartAddData {
  CartAddData({
    this.cartId,
    this.customerId,
    this.partId,
    this.cartQuantity,
    this.cartStatus,
    this.cartCdt,
    this.customerName,
    this.customerCompanyName,
    this.customerPhoneNo,
    this.customerEmailId,
    this.customerPassword,
    this.customerGstNo,
    this.customerAddress,
    this.customerPincode,
    this.customerImage,
    this.customerShopImage,
    this.customerGstCertificateImage,
    this.customerVerify,
    this.customerStatus,
    this.customerCdt,
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
    this.latestStock,
    this.isCart,
  });

  String? cartId;
  String? customerId;
  String? partId;
  String? cartQuantity;
  String? cartStatus;
  DateTime? cartCdt;
  String? customerName;
  String? customerCompanyName;
  String? customerPhoneNo;
  String? customerEmailId;
  String? customerPassword;
  String? customerGstNo;
  String? customerAddress;
  String? customerPincode;
  String? customerImage;
  String? customerShopImage;
  String? customerGstCertificateImage;
  String? customerVerify;
  String? customerStatus;
  DateTime? customerCdt;
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
  String? latestStock;
  bool? isCart;

  factory CartAddData.fromJson(Map<String, dynamic> json) => CartAddData(
        cartId: json["CartId"],
        customerId: json["CustomerId"],
        partId: json["PartId"],
        cartQuantity: json["CartQuantity"],
        cartStatus: json["CartStatus"],
        cartCdt: DateTime.parse(json["CartCDT"]),
        customerName: json["CustomerName"],
        customerCompanyName: json["CustomerCompanyName"],
        customerPhoneNo: json["CustomerPhoneNo"],
        customerEmailId: json["CustomerEmailId"],
        customerPassword: json["CustomerPassword"],
        customerGstNo: json["CustomerGstNo"],
        customerAddress: json["CustomerAddress"],
        customerPincode: json["CustomerPincode"],
        customerImage: json["CustomerImage"],
        customerShopImage: json["CustomerShopImage"],
        customerGstCertificateImage: json["CustomerGstCertificateImage"],
        customerVerify: json["CustomerVerify"],
        customerStatus: json["CustomerStatus"],
        customerCdt: DateTime.parse(json["CustomerCDT"]),
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
        latestStock: json["latestStock"],
        isCart: json["isCart"],
      );

  Map<String, dynamic> toJson() => {
        "CartId": cartId,
        "CustomerId": customerId,
        "PartId": partId,
        "CartQuantity": cartQuantity,
        "CartStatus": cartStatus,
        "CartCDT": cartCdt!.toIso8601String(),
        "CustomerName": customerName,
        "CustomerCompanyName": customerCompanyName,
        "CustomerPhoneNo": customerPhoneNo,
        "CustomerEmailId": customerEmailId,
        "CustomerPassword": customerPassword,
        "CustomerGstNo": customerGstNo,
        "CustomerAddress": customerAddress,
        "CustomerPincode": customerPincode,
        "CustomerImage": customerImage,
        "CustomerShopImage": customerShopImage,
        "CustomerGstCertificateImage": customerGstCertificateImage,
        "CustomerVerify": customerVerify,
        "CustomerStatus": customerStatus,
        "CustomerCDT": customerCdt!.toIso8601String(),
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
        "latestStock": latestStock,
        "isCart": isCart,
      };
}
