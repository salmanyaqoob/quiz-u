import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}