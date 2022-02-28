import 'package:buypartsonline/Screen/homeScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/homeScreen/data/repository/home_screen_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeBloc() : super(HomeInitialState());
  final HomeRepository _homeRepository = HomeRepository();

  @override
  Stream<HomeScreenState> mapEventToState(HomeScreenEvent event) async* {
    if (event is HomeScreenBannerEvent) {
      yield HomeBannerLoadingBeginState();
      Resource resource = await _homeRepository.fetchBannerData();
      if (resource.data != null) {
        yield HomeScreenBannerState(resource.data);
      } else {
        yield HomeErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield HomeBannerLoadingEndState();
    }

    if (event is HomeScreenCategoryEvent) {
      yield HomeCategoryLoadingBeginState();
      Resource resource = await _homeRepository.fetchCategoryData();
      if (resource.data != null) {
        yield HomeScreenCategoryState(resource.data);
      } else {
        yield HomeErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield HomeCategoryLoadingEndState();
    }

    if (event is HomeCartCountEvent) {
      Resource resource = await _homeRepository.fetchCartCount(event);

      if (resource.data != null) {
        yield HomeCartCountState(resource.data);
      } else {
        yield HomeErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
    }
  }
}
