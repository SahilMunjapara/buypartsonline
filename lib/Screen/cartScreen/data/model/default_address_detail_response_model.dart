class DefaultAddressDetailResponseModel {
  DefaultAddressDetailResponseModel({
    this.defaultAddressData,
    this.isSuccess,
    this.message,
  });

  List<DefaultAddressData>? defaultAddressData;
  bool? isSuccess;
  String? message;

  factory DefaultAddressDetailResponseModel.fromJson(
          Map<String, dynamic> json) =>
      DefaultAddressDetailResponseModel(
        defaultAddressData: List<DefaultAddressData>.from(
            json["Data"].map((x) => DefaultAddressData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(defaultAddressData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class DefaultAddressData {
  DefaultAddressData({
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

  factory DefaultAddressData.fromJson(Map<String, dynamic> json) =>
      DefaultAddressData(
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
      };
}
