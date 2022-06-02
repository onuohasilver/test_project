import 'package:bloc/bloc.dart';
import 'package:drotest/repository/store_repository.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';
import 'package:drotest/view/cart/models/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemUpdated>(_onItemUpdated);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final StoreRepository shoppingRepository;

  void _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await shoppingRepository.loadCartItems();

      emit(CartLoaded(cart: Cart(items: [...items])));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addItemToCart(event.item);
        final items = await shoppingRepository.loadCartItems();
        emit(CartLoaded(cart: Cart(items: [...items])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemUpdated(CartItemUpdated event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.updateItem(event.item);
        final items = await shoppingRepository.loadCartItems();
        emit(CartLoaded(cart: Cart(items: [...items])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeItemFromCart(event.item);
        final items = await shoppingRepository.loadCartItems();

        emit(
          CartLoaded(
            cart: Cart(items: [...items]),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
