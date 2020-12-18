import 'dart:async';

import 'package:Source/widgets/barra_pesquisa.dart';
import 'package:flutter/material.dart';

class TelaPessoaPage extends StatefulWidget {
  TelaPessoaPage(abrirNovaTela) {
    this.abrirNovaTela = abrirNovaTela;
  }
  Function abrirNovaTela;
  @override
  _TelaPessoaPageState createState() => _TelaPessoaPageState();
}

class _TelaPessoaPageState extends State<TelaPessoaPage> {
  Color corFundo = Color(0xFFA41D24); //0xFFEFEFEF
  Color corPagina = Color.fromRGBO(241, 245, 248, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      floatingActionButton: pessoaSelecionada != ''
          ? ShowUp(
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFF28A745),
                foregroundColor: Colors.white,
                onPressed: () {
                  widget.abrirNovaTela(2);
                },
                label: Center(
                  child: Row(
                    children: [
                      Text(
                        'Escolher produto(s)',
                        style: TextStyle(fontSize: 21),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              // delay: 0,
            )
          : Container(),
      body: Container(
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
                  BarraPesquisa(placeholder: "Qual é o seu nome?"),
                  infoSelecionado(),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                      width: double.infinity,
                      child: GridView.count(
                        padding: EdgeInsets.only(
                          top: 0,
                        ),
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 3,
                        // Generate 100 widgets that display their index in the List.

                        children: [
                          itemListaPessoa(
                              "assets/imagens/No-foto.png", "Gabriel Vilar"),
                          itemListaPessoa(
                              "assets/imagens/No-foto.png", "Lucas"),
                          itemListaPessoa(
                              "assets/imagens/No-foto.png", "Willian"),
                          itemListaPessoa("assets/imagens/No-foto.png",
                              "Marco aurelio lacerda"),
                          itemListaPessoa("assets/imagens/No-foto.png", "Ana"),
                          itemListaPessoa(
                              "assets/imagens/No-foto.png", "Robson"),
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
      ),
    );
  }

  String pessoaSelecionada = "";
  itemListaPessoa(
    String imagem,
    String nome,
  ) {
    return Container(
      margin: EdgeInsets.all(4),
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

  infoSelecionado() {
    return pessoaSelecionada != ''
        ? Container(
            padding: EdgeInsets.only(top: 5, left: 15),
            height: 30,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                pessoaSelecionada + " selecionado(a)",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: corFundo,
                  fontSize: 18,
                ),
              ),
            ))
        : Container(
            height: 30,
          );
  }
}

class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({@required this.child, this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
