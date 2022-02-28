import 'package:buypartsonline/Screen/profileScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/profileScreen/data/repository/profile_screen_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileBloc() : super(ProfileInitialState());
  final ProfileRepository _profileRepository = ProfileRepository();

  @override
  Stream<ProfileScreenState> mapEventToState(ProfileScreenEvent event) async* {
    if (event is GetProfileDetailEvent) {
      yield ProfileLoadingBeginState();
      Resource resource = await _profileRepository.getProfileDetail(event);
      if (resource.data != null) {
        yield GetProfileDetailState(resource.data);
      } else {
        yield ProfileErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield ProfileLoadingEndState();
    }
    if (event is UpdateProfileEvent) {
      yield ProfileLoadingBeginState();
      Resource resource = await _profileRepository.updateProfileDetail(event);
      if (resource.data != null) {
        yield UpdateProfileState(resource.data);
      } else {
        yield ProfileErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield ProfileLoadingEndState();
    }
  }
}
