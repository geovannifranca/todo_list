import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:todo_list/my_app.dart';

void main() {
  initializeDateFormatting("pt_BR").then((value) => runApp(const MyApp()));
}
