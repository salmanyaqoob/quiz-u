import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/db/db_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.createDatabase();
  await GetStorage.init();
  runApp(MyApp());
}