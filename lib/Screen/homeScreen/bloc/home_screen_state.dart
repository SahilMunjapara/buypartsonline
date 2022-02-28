import 'package:buypartsonline/Screen/cartScreen/data/model/cart_detail_response_model.dart';
import 'package:buypartsonline/Screen/homeScreen/data/model/home_banner_response_model.dart';
import 'package:buypartsonline/Screen/homeScreen/data/model/home_category_response_model.dart';
import 'package:buypartsonline/service/exception/exception.dart';

abstract class HomeScreenState {}

class HomeInitialState extends HomeScreenState {}

class HomeBannerLoadingBeginState extends HomeScreenState {}

class HomeBannerLoadingEndState extends HomeScreenState {}

class HomeCategoryLoadingBeginState extends HomeScreenState {}

class HomeCategoryLoadingEndState extends HomeScreenState {}

class HomeScreenCategoryState extends HomeScreenState {
  HomeCategoryResponseModel responseModel;

  HomeScreenCategoryState(this.responseModel);
}

class HomeCartCountState extends HomeScreenState {
  CartDetailResponseModel responseModel;

  HomeCartCountState(this.responseModel);
}

class HomeScreenBannerState extends HomeScreenState {
  HomeBannerResponseModel responseModel;

  HomeScreenBannerState(this.responseModel);
}

class HomeErrorState extends HomeScreenState {
  AppException exception;

  HomeErrorState(this.exception);
}
