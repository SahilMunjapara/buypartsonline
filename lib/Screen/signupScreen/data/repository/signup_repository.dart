import 'package:buypartsonline/Screen/signupScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/signupScreen/data/model/signup_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

abstract class ISignupRepository {
  Future performSignup(SignupPerformSignupEvent event);
}

class SignupRepository implements ISignupRepository {
  static final SignupRepository _signupRepository = SignupRepository._init();

  factory SignupRepository() {
    return _signupRepository;
  }

  SignupRepository._init();

  @override
  Future performSignup(SignupPerformSignupEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerName'] = event.name;
      body['CustomerEmailId'] = event.email;
      body['CustomerPhoneNo'] = event.phoneNumber;
      body['CustomerPassword'] = event.password;

      var result = await NetworkAPICall().post(signupURL, body);

      RegExp _numeric = RegExp(r'^-?[0-9]+$');
      if (_numeric.hasMatch(result['Data'][0].toString())) {
        result['Data'] = [];
      }
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
