import 'package:get_it/get_it.dart';

import 'services/hive_service.dart';


GetIt sl = GetIt.I;

Future<void> registerServices() async {
  var hiveService = HiveService();
  sl.registerSingleton(hiveService);
}