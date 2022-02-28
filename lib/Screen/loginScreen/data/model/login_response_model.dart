class LoginResponseModel {
  LoginResponseModel({
    this.loginData,
    this.isSuccess,
    this.message,
  });

  List<LoginData>? loginData;
  bool? isSuccess;
  String? message;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        loginData: List<LoginData>.from(
            json["Data"].map((x) => LoginData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(loginData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class LoginData {
  LoginData({
    this.customerId,
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

  String? customerId;
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

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        customerId: json["CustomerId"],
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
        "CustomerId": customerId,
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
