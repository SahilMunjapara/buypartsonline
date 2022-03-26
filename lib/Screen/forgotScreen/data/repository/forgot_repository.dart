import 'package:buypartsonline/Screen/forgotScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/forgotScreen/data/model/otp_for_forgot_password_repository.dart';
import 'package:buypartsonline/Screen/forgotScreen/data/model/update_password_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class ForgotRepository {
  static final ForgotRepository _forgotRepository = ForgotRepository._init();

  factory ForgotRepository() {
    return _forgotRepository;
  }

  ForgotRepository._init();

  Future sendOtpForForgot(OtpForForgotPasswordEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      var result = await NetworkAPICall()
          .post(otpForForgotPasswordURL + event.mobileNumber!, body);
      OtpForForgotPasswordResponseModel responseData =
          OtpForForgotPasswordResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseData,
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

  Future updatePassword(UpdatePasswordEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerPassword'] = event.password;
      body['CustomerPhoneNo'] = event.mobileNumber;

      var result = await NetworkAPICall().post(updateCustomerPasswordURL, body);
      UpdatePasswordResponseModel responseData =
          UpdatePasswordResponseModel.fromJson(result);
      resource = Resource(
        error: null,
        data: responseData,
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
