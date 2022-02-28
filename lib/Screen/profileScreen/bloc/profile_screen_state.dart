import 'package:buypartsonline/Screen/profileScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/profileScreen/data/model/profile_detail_response_model.dart';
import 'package:buypartsonline/Screen/profileScreen/data/model/profile_update_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class ProfileScreenState {}

class ProfileInitialState extends ProfileScreenState {}

class ProfileLoadingBeginState extends ProfileScreenState {}

class ProfileLoadingEndState extends ProfileScreenState {}

class GetProfileDetailState extends ProfileScreenState {
  ProfileDetailResponseModel responseModel;

  GetProfileDetailState(this.responseModel);
}

class UpdateProfileState extends ProfileScreenState {
  ProfileUpdateResponseModel responseModel;

  UpdateProfileState(this.responseModel);
}

class ProfileErrorState extends ProfileScreenState {
  AppException exception;

  ProfileErrorState(this.exception);
}
