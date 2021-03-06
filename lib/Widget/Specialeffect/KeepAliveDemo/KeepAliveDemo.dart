import 'package:flutter/material.dart';



class KeepAliveDemo extends StatefulWidget {
  const KeepAliveDemo({Key? key}) : super(key: key);

  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

/*
在工作中切换页面时，再切换回来，
时要求页面状态不发生改变的。这能给APP浏览者最好的体验，
机会所有的APP都有这个需求，属于一个大众需求。
*/
/*
with是dart的关键字，意思是混入的意思，
就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
避免多重继承导致的问题。
SingleTickerProviderStateMixin 主要是我们初始化TabController时，
需要用到vsync ，垂直属性，然后传递this
*/
class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Keep Alive Demo'),
            bottom: TabBar(
              controller: _controller,
              tabs: const [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            )),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[MyHomePageText(), MyHomePageText(), MyHomePageText()],
        ));
  }
}


class MyHomePageText extends StatefulWidget {
  @override
  _MyHomePageTextState createState() => _MyHomePageTextState();
}

//混入AutomaticKeepAliveClientMixin，这是保持状态的关键
//然后重写wantKeppAlive 的值为true。
class _MyHomePageTextState extends State<MyHomePageText>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  //重写keepAlive 为ture ，就是可以有记忆功能了。
  @override
  bool get wantKeepAlive => true;
  //声明一个内部方法，用来点击按钮后增加数量
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加1，点一下加1:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
      //增加一个悬浮按钮，点击时触犯_incrementCounter方法
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
