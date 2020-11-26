import 'package:Source/widgets/screenUtil.dart';
import 'package:flutter/material.dart';

import 'drawer-cantina.dart';

class TabDemo extends StatefulWidget {
  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _selectedTab = 0;

  Color corFundo = Color(0xFFA41D24); //0xFFEFEFEF
  Color corPagina = Color.fromRGBO(241, 245, 248, 1);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedTab = _tabController.index;
        });
      }
    });
  }

  double convertTamanho(double tamanho) {
    var retorno = (tamanho / 0.3333333333333333)
        .round(); // fator de tamanho utilizado na criação da tela
    var util = ScreenUtil().setSp(retorno);
    return util;
  }

  StepperType stepperType = StepperType.horizontal;

  botaoMenu() {
    var bordas = BorderRadius.circular(14.0);
    return Padding(
        padding: EdgeInsets.only(
          left: convertTamanho(17),
        ),
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: bordas,
          ),
          child: InkWell(
            borderRadius: bordas,
            splashColor: Color.fromRGBO(227, 123, 32, 1),
            onTap: () => _drawerKey.currentState.openDrawer(),
            child: Container(
              margin: EdgeInsets.all(8),
              width: ScreenUtil().setWidth(65),
              height: ScreenUtil().setWidth(65),
              child: Center(
                child: Icon(Icons.menu),
              ),
            ),
          ),
        ));
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
              // botaoMenu(),
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

  int _index = 0;

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
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
              child: etapaPessoa(),
            ),
          ],
        ));
  }

  obterProgresso() {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print("test");
            },
            child: Text("Identifique-se",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
          ),
          GestureDetector(
            onTap: () {
              print("test");
            },
            child: Text("Produto",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
          ),
          GestureDetector(
            onTap: () {
              print("test");
            },
            child: Text("Finalizar",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  tabComponent() {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Material(
              color: Colors.grey.shade300,
              child: TabBar(
                unselectedLabelColor: Colors.blue,
                labelColor: Colors.blue,
                indicatorColor: Colors.white,
                controller: _tabController,
                labelPadding: const EdgeInsets.all(0.0),
                tabs: [
                  _getTab(
                    0,
                    Text("Identifique-se"),
                  ),
                  _getTab(
                    1,
                    Text("Produto"),
                  ),
                  _getTab(
                    2,
                    Text("Finalizar"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  etapaPessoa(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ));
  }

  etapaPessoa() {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 0),
        color: Colors.transparent,
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: corPagina, //Color.fromRGBO(241, 245, 248, 1),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: Column(
              children: <Widget>[
                barraPesquisa(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                    width: double.infinity,
                    child: GridView.count(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      // Generate 100 widgets that display their index in the List.

                      children: [
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa("assets/imagens/No-foto.png", "Lucas"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Willian"),
                        itemListaPessoa("assets/imagens/No-foto.png",
                            "Marco aurelio lacerda"),
                        itemListaPessoa("assets/imagens/No-foto.png", "Ana"),
                        itemListaPessoa("assets/imagens/No-foto.png", "Robson"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Jurandir"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Garibalda"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Jeferson"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Maradona"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                        itemListaPessoa(
                            "assets/imagens/No-foto.png", "Gabriel Vilar"),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  barraPesquisa() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                hintText: "Qual é o seu nome?",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                  iconSize: 30.0,
                )),
            onChanged: (val) {
              setState(() {
                // searchAddr = val;
              });
            },
            onSubmitted: (term) {
              // searchAndNavigate();
            },
          ),
        ),
      ),
    );
  }

  String pessoaSelecionada = "";
  itemListaPessoa(
    String imagem,
    String nome,
  ) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: pessoaSelecionada == nome
              ? Border.all(
                  color: corFundo,
                  width: 2.5,
                )
              : Border.all(
                  color: corPagina,
                  width: 2.5,
                ),
          borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (pessoaSelecionada == nome) {
              pessoaSelecionada = "";
            } else {
              pessoaSelecionada = nome;
            }
          });
        },
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Image.asset(imagem))),
                Expanded(
                    flex: 1,
                    child: Text(
                      nome,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getTab(index, child) {
    return Tab(
      child: SizedBox.expand(
        child: Container(
          child: Center(child: child),
          decoration: BoxDecoration(
              color:
                  (_selectedTab == index ? Colors.white : Colors.grey.shade300),
              borderRadius: _generateBorderRadius(index)),
        ),
      ),
    );
  }

  _generateBorderRadius(index) {
    if ((index + 1) == _selectedTab)
      return BorderRadius.only(bottomRight: Radius.circular(10.0));
    else if ((index - 1) == _selectedTab)
      return BorderRadius.only(bottomLeft: Radius.circular(10.0));
    else
      return BorderRadius.zero;
  }
}
