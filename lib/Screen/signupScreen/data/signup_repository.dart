import 'package:buypartsonline/Screen/signupScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/signupScreen/data/model/signup_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class SignupRepository {
  static final SignupRepository _signupRepository = SignupRepository._init();

  factory SignupRepository() {
    return _signupRepository;
  }

  SignupRepository._init();

  Future performSignup(SignupPerformSignupEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerName'] = event.name;
      body['CustomerEmailId'] = event.email;
      body['CustomerPhoneNo'] = event.phoneNumber;
      body['CustomerPassword'] = event.password;

      var result = await NetworkAPICall().post(signupURL, body);

      SignupResponseModel responseData = SignupResponseModel.fromJson(result);

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