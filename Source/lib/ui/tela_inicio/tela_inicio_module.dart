import 'package:Source/ui/tela_inicio/tela_inicio_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class TelaInicioModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        // Bloc((i) => TelaInicioBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        // Dependency(
        //     (i) => VeiculoRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  @override
  Widget get view => TelaInicioPage();

  static Inject get to => Inject<TelaInicioModule>.of();
}
 