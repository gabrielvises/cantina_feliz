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
      child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Stack(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // botaoMenu(),
                titulo(),
              ],
            ),
          ])),
    );
  }

  Widget titulo() {
    return Expanded(
      child: Container(
        height: convertTamanho(30),
        child: Center(child: Text("Cantina Honesta")),
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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            obterAppBar(),
            Expanded(
              child: tabComponent(),
            ),
          ],
        ));
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

  stepper() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Stepper(
        type: stepperType,
        steps: [
          Step(
            title: Text("Identifique-se"),
            content: Text("This is our first example."),
          ),
          Step(
            title: Text("Produto"),
            content: Text("This is our third example."),
          ),
          Step(
            title: Text("Finalizar"),
            content: Text("This is our forth example."),
          ),
        ],
        currentStep: _index,
        onStepTapped: (index) {
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
            Container(child: Text("teste123")),
      ),
    );
  }

  etapaPessoa() {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 0),
        color: Colors.transparent,
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          hintText: "Qual é o seu nome?",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
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
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    width: double.infinity,
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      // Generate 100 widgets that display their index in the List.

                      children: [
                        itemListaPessoa(),
                        itemListaPessoa(),
                        itemListaPessoa(),
                        itemListaPessoa(),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  itemListaPessoa() {
    return Container(
        margin: EdgeInsets.all(5),
        color: Colors.green,
        child: Center(child: Text("Pessoa")));
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
