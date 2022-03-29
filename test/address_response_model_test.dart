import 'dart:convert';
import 'package:buypartsonline/Screen/addressScreen/data/model/delete_address_response_model.dart';
import 'package:buypartsonline/Screen/addressScreen/data/model/update_address_response_model.dart';
import 'package:buypartsonline/Screen/cartScreen/data/model/default_address_detail_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Delete Address Deserializing", () {
    String jsonString = '''
      {
        "IsSuccess": true,
        "Message": "Delete Address Successfully",
        "Data": [1]
      }
    ''';
    var sut = DeleteAddressResponseModel.fromJson(jsonDecode(jsonString));
    expect(sut.isSuccess, true);
    expect(sut.message, "Delete Address Successfully");
    expect(sut.deleteAddressData!.first, 1);
  });

  test("Update Address Deserializing", () {
    String jsonString = '''
      {
        "IsSuccess": true,
        "Message": "Update Address Successfully",
        "Data": [1]
      }
    ''';
    var sut = UpdateAddressResponseModel.fromJson(jsonDecode(jsonString));
    expect(sut.isSuccess, true);
    expect(sut.message, "Update Address Successfully");
    expect(sut.updateAddressData!.first, 1);
  });

  test("Default Address Deserializing", () {
    String jsonString = '''
      {
        "Data": [
          {
             "AddressId": "71",
             "CustomerId": "73",
             "AddressCompanyName": "",
             "AddressForName": "Sahil Munjapara",
             "AddressPhoneNo": "9586012518",
             "AddressDefault": "1",
             "AddressEmailId": "",
             "AddressName": "A-901, IT Park, Near Ink Complex",
             "AddressPincode": "395010",
             "AddressCityName": "",
             "AddressState": "Rachi",
             "AddressCountry": "india",
             "AddressStatus": "0",
             "AddressCDT": "2022-03-15 17:49:08",
             "CustomerName": "SahilMunjapara",
             "CustomerCompanyName": "Buy Parts ",
             "CustomerPhoneNo": "9586012519",
             "CustomerEmailId": "sahilmunjapara33@gmail.com",
             "CustomerPassword": "1234567890",
             "CustomerGstNo": "",
             "CustomerAddress": "",
             "CustomerPincode": "0",
             "CustomerImage": "no_img.jpg",
             "CustomerShopImage": "no_img.jpg",
             "CustomerGstCertificateImage": "no_img.jpg",
             "CustomerVerify": "0",
             "CustomerStatus": "0",
             "CustomerCDT": "2022-03-15 16:21:47"
          }
        ],
        "IsSuccess": true,
        "Message": "Default Address Found"
      }
    ''';
    var sut =
        DefaultAddressDetailResponseModel.fromJson(jsonDecode(jsonString));
    expect(sut.message, "Default Address Found");
    expect(sut.isSuccess, true);
    expect(sut.defaultAddressData!.first.customerId, "73");
    expect(sut.defaultAddressData!.first.addressForName, "Sahil Munjapara");
    expect(sut.defaultAddressData!.first.addressId, "71");
    expect(sut.defaultAddressData!.first.addressPhoneNo, "9586012518");
    expect(sut.defaultAddressData!.first.addressDefault, "1");
    expect(sut.defaultAddressData!.first.addressPincode, "395010");
    expect(sut.defaultAddressData!.first.addressState, "Rachi");
    expect(sut.defaultAddressData!.first.addressName,
        "A-901, IT Park, Near Ink Complex");
  });
}
