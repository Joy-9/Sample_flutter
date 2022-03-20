import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class shared_preferences extends StatefulWidget {
  const shared_preferences({Key? key}) : super(key: key);

  @override
  State<shared_preferences> createState() => _shared_preferencesState();
}

class _shared_preferencesState extends State<shared_preferences> {
  String textInfo = "";

  _setValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      textInfo = '保存';
    });
    /// 将数据保存到 SharedPreferences 中
    await prefs.setString("name", "zhouyi");
  }

  _getValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// 从 SharedPreferences 获取数据
    String? name = await prefs.getString("name");
    setState(() {
      textInfo = '取出数据 " ${name} "';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单数据持久化"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: _setValue,
            child: Text("保存数据"),
          ),
          RaisedButton(
            onPressed: _getValue,
            child: Text("取出数据"),
          ),
          OutlineButton(
            onPressed: () {
              launch('https://pub.flutter-io.cn/packages/shared_preferences');
            },
            child: Text("参考链接"),
          ),
          OutlineButton(
            onPressed: () {
              launch(
                  'http://laomengit.com/guide/data_storage/shared_preferences.html');
            },
            child: Text("参考链接2"),
          ),
          Text(textInfo)
        ],
      ),
    );
  }
}
