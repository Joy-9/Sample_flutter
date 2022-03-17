import 'package:flutter/material.dart';

import 'BottomNavigationWidget.dart';
import 'EachView.dart';


class BottomAppBarDemo extends StatefulWidget {
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  late List<Widget> _eachView=[];
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = _eachView
      ..add(EachView("我的"))
      ..add(EachView("个人"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      // appBar: AppBar(
      //   title: Text("WangZhong"),
      //   elevation: 10.0,
      //   centerTitle: true,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EachView("新的页面");
          }));
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked, //底部中央
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton.icon(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: const Text(
                  "我的",
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                }),
            IconButton(
                icon: Icon(Icons.airport_shuttle),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
