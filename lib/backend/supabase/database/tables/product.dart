import '../database.dart';

class ProductTable extends SupabaseTable<ProductRow> {
  @override
  String get tableName => 'product';

  @override
  ProductRow createRow(Map<String, dynamic> data) => ProductRow(data);
}

class ProductRow extends SupabaseDataRow {
  ProductRow(super.data);

  @override
  SupabaseTable get table => ProductTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get desk => getField<String>('desk');
  set desk(String? value) => setField<String>('desk', value);

  String? get compound => getField<String>('compound');
  set compound(String? value) => setField<String>('compound', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  bool? get best => getField<bool>('best');
  set best(bool? value) => setField<bool>('best', value);

  List<String> get imgList => getListField<String>('imgList');
  set imgList(List<String>? value) => setListField<String>('imgList', value);
}
