import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configuracoes.dart';
import '../themes/dark.theme.dart';
import '../themes/ravex.theme.dart';

class ThemeBloc extends ChangeNotifier {
  var tema = temaPadrao();

  ThemeBloc() {
    load();
  }
  change(String color) {
    switch (color) {
      case 'dark':
        {
          tema = temaDark();
          Configuracoes.tema = "dark";
          Configuracoes.imagem = "assets/imagens/404-dark.png";
          notifyListeners();
          break;
        }
      case 'padrao':
      default:
        {
          tema = temaPadrao();
          Configuracoes.tema = "padrao";
          Configuracoes.imagem = "assets/imagens/404-light.png";
          notifyListeners();
          break;
        }
    }
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var tema = prefs.getString('tema');
    Configuracoes.tema = tema != null && tema.isEmpty ? 'padrao' : tema;

    change(Configuracoes.tema);
  }
}
