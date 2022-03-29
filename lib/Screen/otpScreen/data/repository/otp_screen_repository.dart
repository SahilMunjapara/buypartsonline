import 'package:buypartsonline/Screen/otpScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/otpScreen/data/model/forgot_otp_verify_respose_model.dart';
import 'package:buypartsonline/Screen/otpScreen/data/model/otp_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

abstract class IOtpScreenRepository {
  Future verifyOtp(OtpVerifyEvent event);

  Future verifyForgotOtp(ForgotOtpVerifyEvent event);
}

class OtpScreenRepository implements IOtpScreenRepository {
  static final OtpScreenRepository _otpScreenRepository =
      OtpScreenRepository._init();

  factory OtpScreenRepository() {
    return _otpScreenRepository;
  }

  OtpScreenRepository._init();

  @override
  Future verifyOtp(OtpVerifyEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      body['Otp'] = event.otp;
      body['CustomerId'] = event.customerId;

      var result = await NetworkAPICall().post(verifyOTPURL, body);

      OtpResponseModel responseModel = OtpResponseModel.fromJson(result);

      resource = Resource(
        error: null,
        data: responseModel,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }

  @override
  Future verifyForgotOtp(ForgotOtpVerifyEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      body['Otp'] = event.otp;
      body['CustomerPhoneNo'] = event.mobileNumber;

      var result =
          await NetworkAPICall().post(verifyOTPForForgotPasswordURL, body);

      ForgotOtpVerifyResponseModel responseModel =
          ForgotOtpVerifyResponseModel.fromJson(result);

      resource = Resource(
        error: null,
        data: responseModel,
      );
    } catch (e, stackTrace) {
      resource = Resource(
        error: e.toString(),
        data: null,
      );
      print('ERROR: $e');
      print('STACKTRACE: $stackTrace');
    }
    return resource;
  }
}
