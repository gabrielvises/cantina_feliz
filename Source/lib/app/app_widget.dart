import 'package:Source/blocs/theme.bloc.dart';
import 'package:Source/routes/navigator.dart';
import 'package:Source/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

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
            navigatorKey: navigator,
            debugShowCheckedModeBanner: false,
            routes: routes,
          );
        }));
  }
}
