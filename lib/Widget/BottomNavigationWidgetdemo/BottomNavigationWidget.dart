import 'package:flutter/material.dart';

import 'EachView.dart';




class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

//底部导航栏制作第一种
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  Color _BottomNavigationcolor = Colors.blue;
  int _currentIndex = 0;
  late List<Widget> list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = list
      ..add( EachView('1'))
      ..add(EachView('2'))
      ..add(EachView('3'))
      ..add(EachView('4'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("你想谁"),
      //   leading: Text("hahah"),
      //   centerTitle: true,
      // ),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4.0,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationcolor,
            ),
              label: "我的1"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationcolor,
            ),
              label: "我的2"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationcolor,
            ),label: "我的3"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationcolor,
            ),label: "我的4"
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


// class MyPage2 extends StatelessWidget {
//   int a;
//   MyPage2(this.a,{Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("底部导航栏案例"),),
//     body: Text(a.toString()),);
//   }
// }