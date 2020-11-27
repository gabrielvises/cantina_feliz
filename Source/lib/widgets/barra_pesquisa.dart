import 'package:flutter/material.dart';

class BarraPesquisa extends StatefulWidget {
  BarraPesquisa({this.placeholder});
  final String placeholder;
  @override
  _BarraPesquisaState createState() => _BarraPesquisaState();
}

class _BarraPesquisaState extends State<BarraPesquisa> {
  @override
  Widget build(BuildContext context) {
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
                hintText: widget.placeholder,
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
}
