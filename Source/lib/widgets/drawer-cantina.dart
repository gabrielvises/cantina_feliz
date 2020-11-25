import 'package:Source/routes/navigator.dart';
import 'package:Source/widgets/screenUtil.dart';
import 'package:flutter/material.dart';

import '../configuracoes.dart';

class DrawerCantina extends StatefulWidget {
  DrawerCantina({this.telaAtual});
  final String telaAtual;

  @override
  _DrawerCantinaState createState() => _DrawerCantinaState();
}

class _DrawerCantinaState extends State<DrawerCantina> {
  double convertTamanho(double tamanho) {
    var retorno = (tamanho / 0.3333333333333333)
        .round(); // fator de tamanho utilizado na criação da tela
    var util = ScreenUtil().setSp(retorno);
    return util;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: convertTamanho(40), left: convertTamanho(20)),
                    alignment: Alignment.bottomLeft,
                    child: Icon(Icons.food_bank),
                    // Image.asset(
                    //   "assets/icons/${Configuracoes.tema}/logo_ravex.png",
                    //   height: convertTamanho(30),
                    //   // width: 30,
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: convertTamanho(20),
                        right: convertTamanho(20),
                        bottom: convertTamanho(15)),
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Align(
                      child: Text(
                        'Pedido',
                        style: TextStyle(
                          fontSize: convertTamanho(18),
                          color: widget.telaAtual == "Pedido"
                              ? Color(0xFFE37B20)
                              : null,
                          fontWeight: widget.telaAtual == "Pedido"
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    leading: Icon(Icons.food_bank),
                    // Image.asset(
                    //   widget.telaAtual == "Mapa"
                    //       ? "assets/icons/mapa_selecionado.png"
                    //       : "assets/icons/${Configuracoes.tema}/mapa.png",
                    //   height: convertTamanho(24),
                    //   width: convertTamanho(24),
                    //   // width: 30,
                    // ),
                    onTap: () {
                      // abrir tela
                    },
                  ),
                  // quando pressionado:
                  ListTile(
                    dense: true,
                    title: Align(
                      child: Text(
                        'Admin',
                        style: TextStyle(
                          fontSize: convertTamanho(18),
                          color: widget.telaAtual == "Admin"
                              ? Color(0xFFE37B20)
                              : null,
                          fontWeight: widget.telaAtual == "Admin"
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    leading: Icon(Icons.food_bank),
                    // Image.asset(
                    //   widget.telaAtual == "Veiculos"
                    //       ? "assets/icons/veículos_selecionado.png"
                    //       : "assets/icons/${Configuracoes.tema}/veiculos.png",
                    //   width: convertTamanho(24),
                    //   height: convertTamanho(24),
                    //   // width: 30,
                    // ),
                    onTap: () {
                      // abrir tela
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(convertTamanho(20)),
            //   child: GestureDetector(
            //     onTap: () {
            //       Scaffold.of(context).showSnackBar(SnackBar(
            //         content: Text("Sending Message"),
            //       ));
            //     },
            //     child: Container(
            //       padding: EdgeInsets.symmetric(
            //           vertical: convertTamanho(5),
            //           horizontal: convertTamanho(60)),
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Color(0xFFE37B20), width: 2.0),
            //           borderRadius: BorderRadius.all(Radius.circular(15))),
            //       child: Text(
            //         "Risco",
            //         style: TextStyle(
            //             fontSize: convertTamanho(22), color: Color(0xFFE37B20)),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
