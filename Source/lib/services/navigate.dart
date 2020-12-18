import 'package:Source/ui/tela_pessoa/tela_pessoa_module.dart';
import 'package:Source/ui/tela_produto/tela_produto_module.dart';
import 'package:Source/widgets/drawer-cantina.dart';
import 'package:Source/widgets/screenUtil.dart';
import 'package:flutter/material.dart';

class Navigate extends StatefulWidget {
  Navigate({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int currentPage = 1;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Color corFundo = Color(0xFFA41D24); //0xFFEFEFEF
  Color corPagina = Color.fromRGBO(241, 245, 248, 1);

  double convertTamanho(double tamanho) {
    var retorno = (tamanho / 0.3333333333333333)
        .round(); // fator de tamanho utilizado na criação da tela
    var util = ScreenUtil().setSp(retorno);
    return util;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(allowFontScaling: true)..init(context);
    return Scaffold(
        key: _drawerKey,
        drawer: DrawerCantina(
          telaAtual: "Pedido",
        ),
        backgroundColor: corFundo,
        body: Column(
          children: [
            obterAppBar(),
            obterProgresso(),
            Expanded(
              child: _obterPagina(currentPage),
            ),
          ],
        ));
  }

  _obterPagina(int pagina) {
    switch (pagina) {
      case 1:
        // etapaPessoa()
        return TelaPessoaModule(mudarTela);
      case 2:
        return TelaProdutoModule(mudarTela);
      // default:
      //   return InicioModule();
    }
  }

  mudarTela(novaTela) {
    setState(() {
      currentPage = novaTela;
    });
  }

  Widget obterAppBar() {
    return SafeArea(
      child: Container(
        color: corFundo,
        child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Stack(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 3,
                ),
                child: GestureDetector(
                  onTap: () {
                    _drawerKey.currentState.openDrawer();
                  },
                  child: Image.asset(
                    "assets/icons/menu.png",
                    height: 22,
                    color: Colors.white,
                    width: 22,
                  ),
                ),
              ),
              Row(
                children: [
                  titulo(),
                ],
              ),
            ])),
      ),
    );
  }

  Widget titulo() {
    return Expanded(
      child: Container(
        height: convertTamanho(30),
        child: Center(
            child: Text("Cantina Honesta",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))),
      ),
    );
  }

  obterProgresso() {
    return Container(
      // padding: EdgeInsets.only(bottom: 10, left: 9, right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10, left: 9),
            // color: Color.fromRGBO(241, 245, 248, 1),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    currentPage = 1;
                  },
                  child: Text("Identifique-se",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Icon(
                  Icons.check,
                  color: Color(0xFF90EE90),
                  size: 26,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    currentPage = 2;
                  },
                  child: Text("Produto",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Icon(
                  Icons.check,
                  color: Color(0xFF90EE90),
                  size: 26,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, right: 9),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    currentPage = 1;
                  },
                  child: Text("Finalizar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Icon(
                  Icons.check,
                  color: Color(0xFF90EE90),
                  size: 26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
