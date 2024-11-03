// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemsStruct extends BaseStruct {
  CartItemsStruct({
    int? id,
    int? price,
  })  : _id = id,
        _price = price;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  static CartItemsStruct fromMap(Map<String, dynamic> data) => CartItemsStruct(
        id: castToType<int>(data['id']),
        price: castToType<int>(data['price']),
      );

  static CartItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? CartItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemsStruct && id == other.id && price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([id, price]);
}

CartItemsStruct createCartItemsStruct({
  int? id,
  int? price,
}) =>
    CartItemsStruct(
      id: id,
      price: price,
    );
