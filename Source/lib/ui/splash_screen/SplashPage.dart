import 'package:Source/routes/navigator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future delay(contextAnimacao) async {
    var token = await obterToken();
    if (token == null || token == '') {
      await new Future.delayed(
          new Duration(
            milliseconds: 4800,
          ), () {
        navigator.currentState.pushReplacementNamed('/inicio');
      });
    } else {
      navigator.currentState.pushReplacementNamed('/inicio');
    }
  }

  @override
  Widget build(BuildContext contextAnimacao) {
    delay(contextAnimacao);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imagens/background.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(contextAnimacao).size.height,
            child: FlareActor(
              "assets/animacoes/Splashscreen.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              isPaused: false,
              animation: 'Splash Screen',
            ),
          ),
        ],
      ),
    );
  }

  Future<String> obterToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("accessToken");
  }
}
