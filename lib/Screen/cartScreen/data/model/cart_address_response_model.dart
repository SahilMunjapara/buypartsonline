class CartAddressResponseModel {
  CartAddressResponseModel({
    this.cartAddressData,
    this.isSuccess,
    this.message,
  });

  List<CartAddressData>? cartAddressData;
  bool? isSuccess;
  String? message;

  factory CartAddressResponseModel.fromJson(Map<String, dynamic> json) =>
      CartAddressResponseModel(
        cartAddressData: List<CartAddressData>.from(
            json["Data"].map((x) => CartAddressData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(cartAddressData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class CartAddressData {
  CartAddressData({
    this.addressId,
    this.customerId,
    this.addressCompanyName,
    this.addressForName,
    this.addressPhoneNo,
    this.addressDefault,
    this.addressEmailId,
    this.addressName,
    this.addressPincode,
    this.addressCityName,
    this.addressState,
    this.addressCountry,
    this.addressStatus,
    this.addressCdt,
  });

  String? addressId;
  String? customerId;
  String? addressCompanyName;
  String? addressForName;
  String? addressPhoneNo;
  String? addressDefault;
  String? addressEmailId;
  String? addressName;
  String? addressPincode;
  String? addressCityName;
  String? addressState;
  String? addressCountry;
  String? addressStatus;
  DateTime? addressCdt;

  factory CartAddressData.fromJson(Map<String, dynamic> json) =>
      CartAddressData(
        addressId: json["AddressId"],
        customerId: json["CustomerId"],
        addressCompanyName: json["AddressCompanyName"],
        addressForName: json["AddressForName"],
        addressPhoneNo: json["AddressPhoneNo"],
        addressDefault: json["AddressDefault"],
        addressEmailId: json["AddressEmailId"],
        addressName: json["AddressName"],
        addressPincode: json["AddressPincode"],
        addressCityName: json["AddressCityName"],
        addressState: json["AddressState"],
        addressCountry: json["AddressCountry"],
        addressStatus: json["AddressStatus"],
        addressCdt: DateTime.parse(json["AddressCDT"]),
      );

  Map<String, dynamic> toJson() => {
        "AddressId": addressId,
        "CustomerId": customerId,
        "AddressCompanyName": addressCompanyName,
        "AddressForName": addressForName,
        "AddressPhoneNo": addressPhoneNo,
        "AddressDefault": addressDefault,
        "AddressEmailId": addressEmailId,
        "AddressName": addressName,
        "AddressPincode": addressPincode,
        "AddressCityName": addressCityName,
        "AddressState": addressState,
        "AddressCountry": addressCountry,
        "AddressStatus": addressStatus,
        "AddressCDT": addressCdt!.toIso8601String(),
      };
}
