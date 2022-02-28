import 'package:buypartsonline/Screen/profileScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/profileScreen/data/model/profile_detail_response_model.dart';
import 'package:buypartsonline/Screen/profileScreen/data/model/profile_update_response_model.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:buypartsonline/service/network/network.dart';
import 'package:buypartsonline/service/network/network_string.dart';

class ProfileRepository {
  static final ProfileRepository _profileRepository = ProfileRepository._init();

  factory ProfileRepository() {
    return _profileRepository;
  }

  ProfileRepository._init();

  Future getProfileDetail(GetProfileDetailEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      body['CustomerId'] = event.customerId;

      var result = await NetworkAPICall().post(getProfileByCustomerId, body);

      ProfileDetailResponseModel responseData =
          ProfileDetailResponseModel.fromJson(result);
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

  Future updateProfileDetail(UpdateProfileEvent event) async {
    Resource? resource;
    try {
      var body = <String, dynamic>{};

      body['CustomerId'] = event.customerId;
      body['CustomerCompanyName'] = event.customerCompanyName;
      body['CustomerName'] = event.customerName;
      body['CustomerPhoneNo'] = event.customerMobileNumber;
      body['CustomerEmailId'] = event.customerEmail;

      var result = await NetworkAPICall().post(updateProfile, body);

      ProfileUpdateResponseModel responseData =
          ProfileUpdateResponseModel.fromJson(result);
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
