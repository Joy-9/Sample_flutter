import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewdemo extends StatefulWidget {
  const PageViewdemo({Key? key}) : super(key: key);

  @override
  State<PageViewdemo> createState() => _PageViewdemoState();
}

class _PageViewdemoState extends State<PageViewdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("pageview案例"),),
      body: PageView(
        children: const <Widget>[
          MyPage1(),
          MyPage2(),
          MyPage3(),
        ],
      ),
    );
  }
}
class MyPage1 extends StatelessWidget {
  const MyPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){
      Navigator.of(context).pushNamed('FirstPage');
    },child: Text("页面效果"),);
  }
}
class MyPage2 extends StatelessWidget {
  const MyPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("2222");
  }
}
class MyPage3 extends StatelessWidget {
  const MyPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("3333");
  }
}
