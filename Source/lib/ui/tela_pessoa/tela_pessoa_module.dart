import 'package:Source/ui/tela_pessoa/tela_pessoa_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class TelaPessoaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        // Bloc((i) => TelaPessoaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        // Dependency(
        //     (i) => VeiculoRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => TelaPessoaPage();

  static Inject get to => Inject<TelaPessoaModule>.of();
}
