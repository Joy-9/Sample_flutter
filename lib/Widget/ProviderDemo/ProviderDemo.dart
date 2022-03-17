import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CountProvider.dart';



class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider全局状态管理"),
      ),
      body: Column(
        children: [
          Text(Provider.of<CountProvider>(context).count.toString()),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("ProviderDemoTwo");
            },
            child: Text("跳转"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}

class ProviderDemoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}
