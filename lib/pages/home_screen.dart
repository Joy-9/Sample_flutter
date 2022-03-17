import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("我的"),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Text("我的"),
//       ),
//     );
//   }
// }

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/Config.dart';
import '../util/LoadingWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // ignore: non_constant_identifier_names
  List _swiperData = [];
  List _clickHotData = [];
  List _GdData = [];

  // ignore: must_call_super
  void initState() {
    super.initState();
    _getSwiperDate(); // 轮播
    _getClickHotDate(); // 点击
    _getCollectHotDate(); // 收藏
  }

  @override
  Widget build(BuildContext context) {
    // S.init(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("不值得一"),
        actions: [
          RaisedButton(
            color: Colors.blue,
            onPressed: () {},
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: _lunbo(),
          ),
          _titleWidget("猜你喜欢"),
          _shopBoxWidget(),
          _titleWidget("热门小说"),
          _listWidget(),
        ],
      ),
    );
  }

  //轮播图
  Widget _lunbo() {
    if (this._swiperData.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              if (_swiperData[index]["Field"] is String &&
                  _swiperData[index]["Field"] != "") {
                _swiperData[index]["Field"] =
                    int.parse(_swiperData[index]["Field"]);
              }
              return InkWell(
                child: Image.network(
                  Config.domain + "${_swiperData[index]["Image"]}",
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  if (_swiperData[index]["Type"] == "navigator") {
                    Navigator.pushNamed(context, "${_swiperData[index]["Url"]}",
                        arguments: {"bookId": _swiperData[index]["Field"]});
                  } else if (_swiperData[index]["Type"] == "out") {
                    print(_swiperData[index]["Url"]);
                    _openUrl(_swiperData[index]["Url"]);
                  }
                },
              );
            },
            itemCount: _swiperData.length,
            viewportFraction: 0.8,
            scale: 0.9,
            autoplay: true,
          ),
        ),
      );
    } else {
      return Text("加载中。。。");
    }
  }

  // 打开外部浏览器
  _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 小标题
  Widget _titleWidget(value) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.only(left: 5),
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.red,
        width: 4,
      ))),
      child: Text(
        value,
        style: const TextStyle(color: Colors.black54, fontSize: 20),
      ),
    );
  }

  // 商品盒子滚动
  Widget _shopBoxWidget() {
    if (_GdData.length > 0) {
      return Container(
        height: 160,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (contxt, index) {
            return GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.network("${_GdData[index]['Image']}",
                        fit: BoxFit.fitHeight),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 100,
                    child: Text(
                      "${_GdData[index]['Name']}",
                      style: TextStyle(color: Colors.red),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, "/book",
                    arguments: {"bookId": _GdData[index]["BookId"]});
              },
            );
          },
          itemCount: _GdData.length,
        ),
      );
    } else {
      return LoadingWidget();
    }
  }

  // 热点内容
  Widget _listWidget() {
    if (_GdData.length > 0) {
      return Column(
        children: _clickHotData.map((v) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 140,
                        child:
                            Image.network("${v['Image']}", fit: BoxFit.cover),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 140,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${v['Name']}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 1, bottom: 1),
                                child: Text("作者：${v['Author']}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ),
                              Text(
                                "${v['Info']}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/book",
                        arguments: {"bookId": v["BookId"]});
                  },
                ),
              ),
              Divider(
                height: 1,
              )
            ],
          );
        }).toList(),
      );
    } else {
      return LoadingWidget();
    }
  }

  //================================

  // 获取轮播图
  _getSwiperDate() async {
    var apiUrl = "${Config.domain}api/book/swiper?num=5";
    Response result = await Dio().get(apiUrl);
    var list = result.data;
    if (list['code'] == 1) {
      setState(() {
        this._swiperData = list["data"];
      });
    }
  }

  // 获取热点小说
  _getClickHotDate() async {
    var apiUrl = "${Config.domain}api/book/hot_click?num=15";
    Response result = await Dio().get(apiUrl);
    var list = result.data;
    if (list['code'] == 1) {
      setState(() {
        this._clickHotData = list["data"];
      });
    }
  }

  // 获取收藏量高的小说
  _getCollectHotDate() async {
    var apiUrl = "${Config.domain}api/book/hot_collect?num=10";
    Response result = await Dio().get(apiUrl);
    var list = result.data;
    if (list['code'] == 1) {
      setState(() {
        this._GdData = list["data"];
      });
    }
  }
}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//             ElevatedButton(
//               child: Text('按钮演示页面'),
//               onPressed: (){
//                   Navigator.pushNamed(context, '/buttonPage');
//               },
//             ),
//             ElevatedButton(
//               child: Text('Flutter2.x中新增按钮'),
//               onPressed: (){
//                   Navigator.pushNamed(context, '/buttonExtend');
//               },
//             ),
//             SizedBox(width: 20),
//             ElevatedButton(
//               child: Text('表单演示页面'),
//               onPressed: (){
//                   Navigator.pushNamed(context, '/textField');
//               },
//             ),
//             SizedBox(width: 20),
//             ElevatedButton(
//               child: Text('CheckBox'),
//               onPressed: (){
//                   Navigator.pushNamed(context, '/checkBox');
//               },
//             ),
//             ElevatedButton(
//               child: Text('RadioDemo'),
//               onPressed: (){
//                   Navigator.pushNamed(context, '/radio');
//               },
//             )
//         ]
//       ),
//     );
//   }
// }
