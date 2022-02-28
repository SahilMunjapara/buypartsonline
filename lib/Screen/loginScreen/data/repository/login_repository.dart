import 'package:buypartsonline/Screen/loginScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/loginScreen/data/model/login_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class LoginRepository {
  static final LoginRepository _homeRepository = LoginRepository._init();

  factory LoginRepository() {
    return _homeRepository;
  }

  LoginRepository._init();

  Future performLogin(LoginPerformLoginEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};
      body['CustomerPhoneNo'] = event.phoneNumber;
      body['CustomerPassword'] = event.password;

      var result = await NetworkAPICall().post(loginURL, body);
      LoginResponseModel responseData = LoginResponseModel.fromJson(result);
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
