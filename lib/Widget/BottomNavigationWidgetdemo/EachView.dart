import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title)),
      body: Center(child: Column(children: <Widget>[
        RaisedButton(onPressed: (){
          Navigator.of(context).pushNamed('BottonNavigations');
        },child: const Text("BottonNavigations"),),
        RaisedButton(onPressed: () async {
          Navigator.of(context).pushNamed('BottomAppBarDemo');


        },child: const Text("BottomAppBarDemo"),)

      ],)),
    );
  }
}

