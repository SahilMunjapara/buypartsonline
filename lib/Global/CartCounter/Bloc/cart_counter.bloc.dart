import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_event.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_state.dart';
import 'package:buypartsonline/Global/CartCounter/data/model/cart_total_response_model.dart';
import 'package:buypartsonline/Global/CartCounter/data/repository/cart_counter_repository.dart';
import 'package:buypartsonline/service/network/model/resource_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCounterBloc extends Bloc<CartCounterEvent, CartCounterTotalState> {
  CartCounterBloc() : super(CartCounterTotalState(CartTotalResponseModel()));
  CartCounterRespository cartCounterRespository = CartCounterRespository();

  @override
  Stream<CartCounterTotalState> mapEventToState(CartCounterEvent event) async* {
    if (event is CartCounterTotalEvent) {
      Resource resource = await cartCounterRespository.getCounterTotal(event);
      if (resource.data != null) {
        yield CartCounterTotalState(resource.data);
      }
    }
  }
}
