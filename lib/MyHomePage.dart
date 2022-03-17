
import 'package:flutter/material.dart';
import 'package:sample/pages/airplay_screen.dart';
import 'package:sample/pages/email_screen.dart';
import 'package:sample/pages/home_screen.dart';
import 'package:sample/pages/pages_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        children: <Widget>[AirplayScreen(),HomeScreen(), EmailScreen(), PagesScreen()],
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
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),label: "组件" ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fiber_dvr),label: "小说"  ),
          BottomNavigationBarItem(
              icon: Icon(Icons.restore),label: "测试"  ), BottomNavigationBarItem(
              icon: Icon(Icons.person),label: "我的"  ),
        ],
      ),
    );
  }
}

