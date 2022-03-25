class OrderPartDetailResponseModel {
  OrderPartDetailResponseModel({
    this.orderPartDetailData,
    this.isSuccess,
    this.message,
  });

  List<OrderPartDetailData>? orderPartDetailData;
  bool? isSuccess;
  String? message;

  factory OrderPartDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderPartDetailResponseModel(
        orderPartDetailData: List<OrderPartDetailData>.from(
            json["Data"].map((x) => OrderPartDetailData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(orderPartDetailData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class OrderPartDetailData {
  OrderPartDetailData({
    this.orders,
    this.otherDetail,
    this.returnData,
  });

  List<Order>? orders;
  List<OtherDetail>? otherDetail;
  List<dynamic>? returnData;

  factory OrderPartDetailData.fromJson(Map<String, dynamic> json) =>
      OrderPartDetailData(
        orders: List<Order>.from(json["Orders"].map((x) => Order.fromJson(x))),
        otherDetail: List<OtherDetail>.from(
            json["OtherDetail"].map((x) => OtherDetail.fromJson(x))),
        returnData: List<dynamic>.from(json["ReturnData"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
        "OtherDetail": List<dynamic>.from(otherDetail!.map((x) => x.toJson())),
        "ReturnData": List<dynamic>.from(returnData!.map((x) => x)),
      };
}

class Order {
  Order({
    this.orderdetailId,
    this.orderIdReference,
    this.partId,
    this.orderdetailDiscount,
    this.orderdetailProductSrp,
    this.orderdetailProductMrp,
    this.orderdetailQty,
    this.orderdetailStatus,
    this.orderdetailCdt,
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
  });

  String? orderdetailId;
  String? orderIdReference;
  String? partId;
  String? orderdetailDiscount;
  String? orderdetailProductSrp;
  String? orderdetailProductMrp;
  String? orderdetailQty;
  String? orderdetailStatus;
  DateTime? orderdetailCdt;
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

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderdetailId: json["OrderdetailId"],
        orderIdReference: json["OrderIdReference"],
        partId: json["PartId"],
        orderdetailDiscount: json["OrderdetailDiscount"],
        orderdetailProductSrp: json["OrderdetailProductSrp"],
        orderdetailProductMrp: json["OrderdetailProductMrp"],
        orderdetailQty: json["OrderdetailQty"],
        orderdetailStatus: json["OrderdetailStatus"],
        orderdetailCdt: DateTime.parse(json["OrderdetailCDT"]),
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
      );

  Map<String, dynamic> toJson() => {
        "OrderdetailId": orderdetailId,
        "OrderIdReference": orderIdReference,
        "PartId": partId,
        "OrderdetailDiscount": orderdetailDiscount,
        "OrderdetailProductSrp": orderdetailProductSrp,
        "OrderdetailProductMrp": orderdetailProductMrp,
        "OrderdetailQty": orderdetailQty,
        "OrderdetailStatus": orderdetailStatus,
        "OrderdetailCDT": orderdetailCdt!.toIso8601String(),
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
      };
}

class OtherDetail {
  OtherDetail({
    this.total,
    this.orderStage,
    this.deliveryCharge,
    this.paymentStatus,
    this.addressId,
    this.customerId,
    this.orderPaymentMethod,
    this.courierId,
  });

  int? total;
  String? orderStage;
  String? deliveryCharge;
  String? paymentStatus;
  String? addressId;
  String? customerId;
  String? orderPaymentMethod;
  String? courierId;

  factory OtherDetail.fromJson(Map<String, dynamic> json) => OtherDetail(
        total: json["Total"],
        orderStage: json["OrderStage"],
        deliveryCharge: json["DeliveryCharge"],
        paymentStatus: json["PaymentStatus"],
        addressId: json["AddressId"],
        customerId: json["CustomerId"],
        orderPaymentMethod: json["OrderPaymentMethod"],
        courierId: json["CourierId"],
      );

  Map<String, dynamic> toJson() => {
        "Total": total,
        "OrderStage": orderStage,
        "DeliveryCharge": deliveryCharge,
        "PaymentStatus": paymentStatus,
        "AddressId": addressId,
        "CustomerId": customerId,
        "OrderPaymentMethod": orderPaymentMethod,
        "CourierId": courierId,
      };
}
