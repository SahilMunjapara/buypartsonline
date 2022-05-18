import 'package:buypartsonline/Screen/cartScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/cartScreen/data/repository/cart_screen_repository.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartBloc() : super(CartInitialState());

  final CartRepository _cartReposiory = CartRepository();

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

    if (event is CartAddressEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.getCartAddress(event);
      if (resource.data != null) {
        yield CartAddressState(resource.data);
      } else {
        yield CartErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartLoadingEndState();
    }

    if (event is CartDefaultSAddressEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.setCartDefaultAddress(event);
      if (resource.data != null) {
        yield CartDefaultAddressState(resource.data);
      } else {
        yield CartErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartLoadingEndState();
    }

    if (event is AddCartAddressEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.addCartAddress(event);
      if (resource.data != null) {
        yield AddcartAddressState(resource.data);
      } else {
        yield CartErrorState(
          AppException.decodeExceptionData(jsonString: resource.error ?? ''),
        );
      }
      yield CartLoadingEndState();
    }

    if (event is GetDefaultAddresEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.getCartDefaultAddress(event);
      if (resource.data != null) {
        yield DefaultAddressDetailState(resource.data);
      } else {
        yield CartErrorState(
            AppException.decodeExceptionData(jsonString: resource.error ?? ''));
      }
      yield CartLoadingEndState();
    }

    if (event is CartCallBackEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.callBackURL(event);
      if (resource.data != null) {
        yield CartCallBackState(resource.data);
      } else {
        yield CartErrorState(
            AppException.decodeExceptionData(jsonString: resource.error ?? ''));
      }
      yield CartLoadingEndState();
    }

    if (event is GetCartProductEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.getCartProduct(event);
      if (resource.data != null) {
        yield GetCartProductState(resource.data);
      } else {
        yield CartErrorState(
            AppException.decodeExceptionData(jsonString: resource.error ?? ''));
      }
      yield CartLoadingEndState();
    }

    if (event is GetCartSummaryEvent) {
      yield CartLoadingBeginState();
      Resource resource = await _cartReposiory.getCartSummary(event);
      if (resource.data != null) {
        yield GetCartSummaryState(resource.data);
      } else {
        yield CartErrorState(
            AppException.decodeExceptionData(jsonString: resource.error ?? ''));
      }
      yield CartLoadingEndState();
    }
  }
}
