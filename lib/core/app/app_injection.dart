import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:registration_test/core/app/app_secure_db.dart';

import 'app_injection.config.dart';

final sl = GetIt.instance;
final FlutterSecureStorage secureDB = AppSecureDB.instance();

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => sl.init();
