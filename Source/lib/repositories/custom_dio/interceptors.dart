import 'package:Source/routes/navigator.dart';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomIntercetors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    print("REQUEST[${options.method}] => PATH: ${options.path}");

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    options.headers['SistemaVersaoNome'] = packageInfo.version;

    var accessToken = await _obterToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return options;
  }

  _obterToken() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("accessToken");
  }

  @override
  Future onResponse(Response response) async {
    //200
    //201
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
    return response;
  }

  @override
  Future onError(DioError exception) async {
    //Exception
    if (exception.response.statusCode == 401) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      preferences.remove("AuthUser");
      preferences.remove("accessToken");

      navigator.currentState.pushReplacementNamed('/login');
    }

    print(
        "ERROR[${exception.response.statusCode}] => PATH: ${exception.request.path}");
    if (exception.response.statusCode == 404) return DioError();

    return exception;
  }
}
