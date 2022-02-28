class SignupResponseModel {
  SignupResponseModel({
    this.signupData,
    this.isSuccess,
    this.message,
    this.otpMessage,
  });

  List<SignupData>? signupData;
  bool? isSuccess;
  String? message;
  String? otpMessage;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        signupData: List<SignupData>.from(
            json["Data"].map((x) => SignupData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        otpMessage: json["OtpMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(signupData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
        "OtpMessage": otpMessage,
      };
}

class SignupData {
  SignupData({
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

  factory SignupData.fromJson(Map<String, dynamic> json) => SignupData(
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
