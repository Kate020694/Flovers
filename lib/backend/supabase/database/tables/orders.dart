import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(super.data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get recipientName => getField<String>('recipient_name');
  set recipientName(String? value) => setField<String>('recipient_name', value);

  String? get recipientPhone => getField<String>('recipient_phone');
  set recipientPhone(String? value) =>
      setField<String>('recipient_phone', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get date => getField<String>('date');
  set date(String? value) => setField<String>('date', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);

  String? get senderName => getField<String>('sender_name');
  set senderName(String? value) => setField<String>('sender_name', value);

  String? get senderPhone => getField<String>('sender_phone');
  set senderPhone(String? value) => setField<String>('sender_phone', value);

  String? get senderMail => getField<String>('sender_mail');
  set senderMail(String? value) => setField<String>('sender_mail', value);

  List<int> get products => getListField<int>('products');
  set products(List<int>? value) => setListField<int>('products', value);

  int? get summPrice => getField<int>('summ_price');
  set summPrice(int? value) => setField<int>('summ_price', value);
}
