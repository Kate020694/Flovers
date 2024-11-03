import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorites =
          prefs.getStringList('ff_favorites')?.map(int.parse).toList() ??
              _favorites;
    });
    _safeInit(() {
      _cart = prefs
              .getStringList('ff_cart')
              ?.map((x) {
                try {
                  return CartItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<int> _favorites = [];
  List<int> get favorites => _favorites;
  set favorites(List<int> value) {
    _favorites = value;
    prefs.setStringList(
        'ff_favorites', value.map((x) => x.toString()).toList());
  }

  void addToFavorites(int value) {
    favorites.add(value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }

  void removeFromFavorites(int value) {
    favorites.remove(value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFavorites(int index) {
    favorites.removeAt(index);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }

  void updateFavoritesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    favorites[index] = updateFn(_favorites[index]);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFavorites(int index, int value) {
    favorites.insert(index, value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }

  List<CartItemsStruct> _cart = [];
  List<CartItemsStruct> get cart => _cart;
  set cart(List<CartItemsStruct> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.serialize()).toList());
  }

  void addToCart(CartItemsStruct value) {
    cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartItemsStruct value) {
    cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int index,
    CartItemsStruct Function(CartItemsStruct) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int index, CartItemsStruct value) {
    cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
