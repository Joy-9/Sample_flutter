import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
class Tabdemo extends StatelessWidget {
  const Tabdemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarDemo();
  }
}
class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with TickerProviderStateMixin{
  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

title: TabBar(
  tabs: _tabValues.map((f) {
    return Text(f);
  }).toList(),
  controller: _controller,
  indicatorColor: Colors.red,
  indicatorSize: TabBarIndicatorSize.tab,
  isScrollable: true,
  labelColor: Colors.red,
  unselectedLabelColor: Colors.yellow,
  indicatorWeight: 2.0,
  labelStyle: TextStyle(fontSize: 24),
  unselectedLabelStyle: TextStyle(fontSize: 12)

),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Center(
            child: Text(f),
          );
        }).toList(),
      ),
    );
  }
}
