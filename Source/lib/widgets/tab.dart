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
              child: null,
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
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ));
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
