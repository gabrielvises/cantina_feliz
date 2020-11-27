import 'package:Source/ui/tela_produto/tela_produto_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class TelaProdutoModule extends ModuleWidget {
  TelaProdutoModule(Function abrirNovaTela) {
    this.abrirNovaTela = abrirNovaTela;
  }
  Function abrirNovaTela;
  @override
  List<Bloc> get blocs => [
        // Bloc((i) => TelaProdutoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        // Dependency(
        //     (i) => VeiculoRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => TelaProdutoPage(abrirNovaTela);

  static Inject get to => Inject<TelaProdutoModule>.of();
}
