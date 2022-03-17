import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'about_panda_page.dart';

// class PagesScreen extends StatelessWidget {
//   const PagesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TestPage();
//   }
// }

class PagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PagesScreenState();
}

class PagesScreenState extends State<PagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _headView(),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blueGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        12, 0, 12, 0),
                    child: Image.asset(
                      "images/icon_me_vip_bg.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        30, 12, 30, 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/icon_me_vip.png",
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "开通会员",
                          style: TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "万本好书免费读",
                          style: TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "images/icon_me_vip_right_arrow.png",
                          width: 16,
                          height: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        _childView(
                          "images/icon_me_account.png",
                          "我的账户",
                          "购买、充值记录",
                          true,
                        ),
                        _childView(
                          "images/icon_me_task.png",
                          "我的任务",
                          "绑定手机送礼券",
                          false,
                        ),
                        _childView(
                          "images/icon_me_game.png",
                          "我的游戏",
                          "",
                          true,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        _childView(
                          "images/icon_me_gift.png",
                          "兑换中心",
                          "",
                          true,
                        ),
                        _childView(
                          "images/icon_me_message.png",
                          "我的消息",
                          "88",
                          false,
                        ),
                        _childView(
                          "images/icon_me_comment.png",
                          "我的评论",
                          "购买、充值记录",
                          true,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        _childView(
                          "images/icon_me_cloud.png",
                          "云书架",
                          "同步书籍至云端",
                          true,
                        ),
                        _childView(
                          "images/icon_me_download.png",
                          "我的下载",
                          "",
                          true,
                        ),
                        _childView(
                          "images/icon_me_read_record.png",
                          "最近阅读记录",
                          "",
                          true,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        _childView(
                          "images/icon_me_help.png",
                          "帮助与反馈",
                          "",
                          true,
                        ),
                        _childView(
                          "images/icon_me_panda.png",
                          "关于Panda看书",
                          "",
                          true,
                        ),

                        Container(
                          height: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headView() {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        12, 20, 12, 20),
                    child: ClipOval(
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child:
                         Image.asset("images/icon_default_avatar.png"),
                      ),
                    ),
                  ),
                  const Text(
                    "书友q805699513",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      12, 7, 12, 0),
                  child: Image.asset(
                    'images/icon_me_setting.png',
                    width: 23,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "熊猫币",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Color(0x50FFFFFF),
                width: 1,
                height: 23,
                child: Text(""),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "礼券",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Color(0x50FFFFFF),
                width: 1,
                height: 23,
                child: Text(""),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    "签到",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "送礼券",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _childView(String image, String content, String message, bool isGray) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c){
            return AboutPandaPage();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12,
              12, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                width: 23,
                height: 23,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              Expanded(child: Container()),
              Text(
                message,
                style: TextStyle(
                  color: isGray ? Colors.blueGrey : Colors.blueGrey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                "images/icon_me_arrow.png",
                width: 14,
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
