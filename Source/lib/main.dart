import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'app/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GlobalConfiguration()
  //     .loadFromAsset(kReleaseMode ? "app_settings" : "app_settings.debug");
  runApp(AppModule());
}
