import 'package:flutter/material.dart';

import 'app.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await registerServices();
  runApp(TodoApp());
}
