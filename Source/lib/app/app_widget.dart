import 'package:Source/blocs/theme.bloc.dart';
import 'package:Source/ui/splash_screen/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeBloc>(
            create: (context) {
              return ThemeBloc();
            },
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          final ThemeBloc bloc = Provider.of<ThemeBloc>(context);
          return MaterialApp(
            theme: bloc.tema,
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        }));
  }
}
