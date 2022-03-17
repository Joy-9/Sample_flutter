import 'package:flutter/material.dart';
import 'package:sample/Widget/BottomNavigationWidgetdemo/EachView.dart';


class BottomNavigationWidgets extends StatefulWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

//底部导航栏制作第一种
class _BottomNavigationWidgetState extends State<BottomNavigationWidgets> {
  Color _BottomNavigationcolor = Colors.blue;
  int _currentIndex = 0;
  // 页面控制
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 底部栏切换
  void _onBottomNavigationBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children:  <Widget>[
          EachView("1"),
          EachView("2"),
          EachView("3"),
          // EachView("4"),

        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        onTap: _onBottomNavigationBarTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "aaa"),
          BottomNavigationBarItem(icon: Icon(Icons.style), label: "aaa"),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "aaa"),
        ],
      ),
    );
  }
}
