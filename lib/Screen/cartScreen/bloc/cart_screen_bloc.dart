import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/repository/cart_screen_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartBloc() : super(CartInitialState());

  final CartReposiory _cartReposiory = CartReposiory();

  @override
  Stream<CartScreenState> mapEventToState(CartScreenEvent event) async* {
    if (event is CartTotalItemEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.getCartDetail(event);
      if (resource.data != null) {
        yield CartTotalItemState(resource.data);
      } else {
        yield CartErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartLoadingEndState();
    }

    if (event is CartItemUpdateQtyEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.updateCartDetail(event);
      if (resource.data != null) {
        yield CartItemUpdateQtyState(resource.data);
      } else {
        yield CartErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartLoadingEndState();
    }

    if (event is CartItemRemoveEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.removeCartItem(event);
      if (resource.data != null) {
        yield CartItemRemoveState(resource.data);
      } else {
        yield CartErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartLoadingEndState();
    }
  }
}
