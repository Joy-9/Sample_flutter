import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomdemo extends StatefulWidget {
  const Bottomdemo({Key? key}) : super(key: key);

  @override
  State<Bottomdemo> createState() => _BottomdemoState();
}

class _BottomdemoState extends State<Bottomdemo> {
  var flag = true;
  var _username=new TextEditingController();   //初始化的时候给表单赋值
  var _password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username.text='初始值';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('按钮案例'),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('RaisedButton'),
                      onPressed: () {
                        print("Onpressed");
                      },
                      onLongPress: () {
                        print("long");
                      },
                      onHighlightChanged: (highlight) {
                        print('onHighlightChanged:$highlight');
                      },
                      elevation: 10.0,
                    ),
                    RaisedButton(
                      child: Text('RaisedButton'),
                      onPressed: () {},
                      shape: BeveledRectangleBorder(
                          /*http://laomengit.com/flutter/widgets/ShapeBorder.html#beveledrectangleborder*/
                          side: BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(100)),
                      elevation: 1.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('阴影按钮'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("有阴影按钮");
                      },
                    ),
                    SizedBox(width: 5),
                    RaisedButton.icon(
                        icon: Icon(Icons.search),
                        label: Text('图标按钮'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        // onPressed: null,
                        onPressed: () {
                          print("图标按钮");
                        })
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        child: Text('宽度高度'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 20,
                        onPressed: () {
                          print("宽度高度");
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.all(10),
                        child: RaisedButton(
                          child: Text('自适应按钮'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          onPressed: () {
                            print("自适应按钮");
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('圆角按钮'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          print("圆角按钮");
                        }),
                    Container(
                      height: 80,
                      child: RaisedButton(
                          child: Text('圆形按钮'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          splashColor: Colors.red,
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.white)),
                          onPressed: () {
                            print("圆形按钮");
                          }),
                    ),
                    FlatButton(
                      child: Text("按钮"),
                      color: Colors.blue,
                      textColor: Colors.yellow,
                      onPressed: () {
                        print('FlatButton');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        child:
                            OutlineButton(child: Text("注册"), onPressed: () {}),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          child: Text('登录'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          onPressed: () {
                            print("宽度高度");
                          },
                        ),
                        RaisedButton(
                          child: Text('注册'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          onPressed: () {
                            print("宽度高度");
                          },
                        ),
                        MyButton(
                            text: "自定义按钮",
                            height: 60.0,
                            width: 100.0,
                            pressed: () {
                              print('自定义按钮');
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text('普通按钮'),
                      onPressed: () {
                        print("普通按钮");
                      },
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      child: Text('颜色按钮'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        print("有颜色按钮");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text('阴影按钮'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.red),
                          elevation: MaterialStateProperty.all(50)),
                      onPressed: () {
                        print("有阴影按钮");
                      },
                    ),
                    SizedBox(width: 5),
                    ElevatedButton.icon(
                        icon: Icon(Icons.search),
                        label: Text('图标按钮1'),
                        // onPressed: null,
                        onPressed: () {
                          print("图标按钮");
                        })
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 200,
                      child: ElevatedButton(
                        child: Text('宽度高度'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          print("宽度高度");
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          child: Text('自适应按钮1'),
                          onPressed: () {
                            print("自适应按钮");
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        child: Text('圆角'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(20),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () {
                          print("圆角按钮");
                        }),
                    Container(
                      height: 80,
                      child: ElevatedButton(
                          child: Text('圆形按钮'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(20),
                              shape: MaterialStateProperty.all(
                                CircleBorder(
                                    side: BorderSide(color: Colors.white)),
                              )),
                          onPressed: () {
                            print("圆形按钮");
                          }),
                    ),
                    TextButton(
                      child: Text("按钮"),
                      onPressed: () {
                        print('FlatButton');
                      },
                    ),

                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        child: OutlinedButton(
                            child: Text("注册 配置边框"),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                side: MaterialStateProperty.all(
                                    BorderSide(width: 1, color: Colors.red))),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('登录'),
                          onPressed: () {
                            print("宽度高度");
                          },
                        ),
                        ElevatedButton(
                          child: Text('注册'),
                          onPressed: () {
                            print("宽度高度");
                          },
                        ),
                        MyButton(
                            text: "自定义按钮",
                            height: 60.0,
                            width: 100.0,
                            pressed: () {
                              print('自定义按钮');
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Checkbox(
                    value: this.flag,
                    onChanged: (v) {
                      setState(() {
                        if (v != null) {
                          this.flag = v;
                        }
                      });
                    },
                    activeColor: Colors.red,
                  )
                ]),
                Row(
                  children: <Widget>[Text(this.flag ? "选中" : "未选中")],
                ),
                SizedBox(height: 40),

                // CheckboxListTile(
                //    value: this.flag,
                //     onChanged: (v){
                //       setState(() {
                //          this.flag=v;
                //       });
                //     },
                //     title: Text("标题"),
                //     subtitle:Text("这是二级标题") ,
                // ),
                Divider(),
                CheckboxListTile(
                    value: this.flag,
                    onChanged: (v) {
                      setState(() {
                        if (v != null) {
                          this.flag = v;
                        }
                      });
                    },
                    title: Text("标题"),
                    subtitle: Text("这是二级标题"),
                    secondary: Icon(Icons.help))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              // child:TextDemo() ,
              child:Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: "请输入用户名"
                    ),
                    controller: _username,
                    onChanged: (value){
                      setState(() {
                        _username.text=value;
                      });
                    },

                  ),
                  SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "密码"
                    ),
                    onChanged: (value){
                      setState(() {
                        this._password=value;
                      });
                    },

                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      child: Text("登录"),
                      onPressed: (){
                        print(this._username.text);
                        print(this._password);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),ButtonCase()
                ],
              ) ,
            )
          ],
        ));
  }
}

//自定义按钮组件

class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;

  const MyButton(
      {this.text = '', this.pressed = null, this.width = 80, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed: this.pressed,
      ),
    );
  }
}


class ButtonCase extends StatefulWidget {
  const ButtonCase({Key? key}) : super(key: key);

  @override
  _ButtonCaseState createState() => _ButtonCaseState();
}

class _ButtonCaseState extends State<ButtonCase> {
  ButtonStatus _buttonStatus = ButtonStatus.none;

  _buildChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return Text(
        '登录进度按钮',
        style: TextStyle(color: Colors.white,fontSize: 18),
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      minWidth: 240,
      height: 48,
      onPressed: () {
        setState(() {
          _buttonStatus = ButtonStatus.loading;
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _buttonStatus = ButtonStatus.done;
            });
          });
        });
      },
      child: _buildChild(),
    );
  }
}

enum ButtonStatus { none, loading, done }
