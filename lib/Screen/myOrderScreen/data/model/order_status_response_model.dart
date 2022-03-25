class OrderStatusResponseModel {
  OrderStatusResponseModel({
    this.orderStatusData,
    this.isSuccess,
    this.message,
  });

  List<OrderStatusData>? orderStatusData;
  bool? isSuccess;
  String? message;

  factory OrderStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusResponseModel(
        orderStatusData: List<OrderStatusData>.from(
            json["Data"].map((x) => OrderStatusData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(orderStatusData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class OrderStatusData {
  OrderStatusData({
    this.orderId,
    this.customerId,
    this.addressId,
    this.orderShiprocketNo,
    this.orderPaymentMethod,
    this.orderTotalQty,
    this.orderTransactionNo,
    this.orderPaymentStatus,
    this.orderStageDropDown,
    this.orderDeliveryDate,
    this.shippingCharge,
    this.orderTotal,
    this.orderDate,
    this.orderReturn,
    this.orderCourierCode,
    this.orderShipmentCode,
    this.orderAwbNumber,
    this.orderStatus,
    this.orderCdt,
    this.srNo,
    this.total,
    this.orderTrack,
  });

  String? orderId;
  String? customerId;
  String? addressId;
  String? orderShiprocketNo;
  String? orderPaymentMethod;
  String? orderTotalQty;
  String? orderTransactionNo;
  String? orderPaymentStatus;
  String? orderStageDropDown;
  DateTime? orderDeliveryDate;
  String? shippingCharge;
  String? orderTotal;
  DateTime? orderDate;
  String? orderReturn;
  String? orderCourierCode;
  String? orderShipmentCode;
  String? orderAwbNumber;
  String? orderStatus;
  DateTime? orderCdt;
  int? srNo;
  int? total;
  String? orderTrack;

  factory OrderStatusData.fromJson(Map<String, dynamic> json) =>
      OrderStatusData(
        orderId: json["OrderId"],
        customerId: json["CustomerId"],
        addressId: json["AddressId"],
        orderShiprocketNo: json["OrderShiprocketNo"],
        orderPaymentMethod: json["OrderPaymentMethod"],
        orderTotalQty: json["OrderTotalQty"],
        orderTransactionNo: json["OrderTransactionNo"],
        orderPaymentStatus: json["OrderPaymentStatus"],
        orderStageDropDown: json["OrderStageDropDown"],
        orderDeliveryDate: DateTime.parse(json["OrderDeliveryDate"]),
        shippingCharge: json["ShippingCharge"],
        orderTotal: json["OrderTotal"],
        orderDate: DateTime.parse(json["OrderDate"]),
        orderReturn: json["OrderReturn"],
        orderCourierCode: json["OrderCourierCode"],
        orderShipmentCode: json["OrderShipmentCode"],
        orderAwbNumber: json["OrderAWBNumber"],
        orderStatus: json["OrderStatus"],
        orderCdt: DateTime.parse(json["OrderCDT"]),
        srNo: json["SrNo"],
        total: json["Total"],
        orderTrack: json["OrderTrack"],
      );

  Map<String, dynamic> toJson() => {
        "OrderId": orderId,
        "CustomerId": customerId,
        "AddressId": addressId,
        "OrderShiprocketNo": orderShiprocketNo,
        "OrderPaymentMethod": orderPaymentMethod,
        "OrderTotalQty": orderTotalQty,
        "OrderTransactionNo": orderTransactionNo,
        "OrderPaymentStatus": orderPaymentStatus,
        "OrderStageDropDown": orderStageDropDown,
        "OrderDeliveryDate":
            "${orderDeliveryDate!.year.toString().padLeft(4, '0')}-${orderDeliveryDate!.month.toString().padLeft(2, '0')}-${orderDeliveryDate!.day.toString().padLeft(2, '0')}",
        "ShippingCharge": shippingCharge,
        "OrderTotal": orderTotal,
        "OrderDate":
            "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
        "OrderReturn": orderReturn,
        "OrderCourierCode": orderCourierCode,
        "OrderShipmentCode": orderShipmentCode,
        "OrderAWBNumber": orderAwbNumber,
        "OrderStatus": orderStatus,
        "OrderCDT": orderCdt!.toIso8601String(),
        "SrNo": srNo,
        "Total": total,
        "OrderTrack": orderTrack,
      };
}
