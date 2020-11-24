import 'package:dio/native_imp.dart';
import 'package:global_configuration/global_configuration.dart';
import 'interceptors.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = GlobalConfiguration().getValue("baseUrl");
    options.connectTimeout = 60000;
    options.headers['SistemaId'] = GlobalConfiguration().getValue("sistemaId");
    interceptors.add(CustomIntercetors());
  }
}
