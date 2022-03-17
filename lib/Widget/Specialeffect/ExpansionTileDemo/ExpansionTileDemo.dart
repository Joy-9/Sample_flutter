import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('expansion tile demo')),
        body:  Center(
            child: ExpansionTile(
              title: const Text('Expansion Tile'),
              leading: const Icon(Icons.ac_unit),
              backgroundColor: Colors.white12,
              children: <Widget>[
                ListTile(title: Text('list tile'), subtitle: const Text('subtitle')),
                SizedBox(height: 100,),
                RaisedButton(onPressed: (){
                  Navigator.of(context).pushNamed("ExpansionPanelListDemo");
                },child: Text("切换另一个list"),)
              ],
              initiallyExpanded: true,
            )));
  }
}
