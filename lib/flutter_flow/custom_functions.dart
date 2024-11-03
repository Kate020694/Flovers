import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int summCart(List<int> priceList) {
  var summ = 0;

  for (var price in priceList) {
    summ += price;
  }

  return summ;
}

bool checkCart(
  List<int> ids,
  int id,
) {
  bool result = false;

  for (var el in ids) {
    if (el == id) {
      result = true;
    }
  }

  return result;
}
