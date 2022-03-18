import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  List<int> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹框演示"),
        actions: [     PopupMenuButton<String>(
          initialValue: '语文',
          offset: const Offset(0,-100),
          // child: Icon(Icons.add),
          icon: Icon(Icons.add),
          padding: EdgeInsets.all(5),
          color: Colors.white,
          onSelected: (value){
            print('$value');
          },
          onCanceled: (){
            print('onCanceled');
          },
          tooltip: 'PopupMenuButton',
          itemBuilder: (context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: '语文',
                child: Text('语文'),
              ),PopupMenuDivider(height: 4,),
              const PopupMenuItem<String>(
                value: '数学',
                child: Text('数学'),
              ),PopupMenuDivider(),
              PopupMenuItem<String>(
                value: '英语',
                child: Text('英语'),
              ),PopupMenuDivider(),
              PopupMenuItem<String>(
                value: '生物',
                child: Text('生物'),
              ),PopupMenuDivider(),
              PopupMenuItem<String>(
                value: '化学',
                child: Text('化学'),
              ),
            ];
          },
        )],
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: _showAlert,
            child: Text("对话框"),
          ),
          RaisedButton(
            onPressed: _showListDialog,
            child: Text("列表对话框"),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print('$value');
            },
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                CheckedPopupMenuItem(
                  value: '语文',
                  checked: true,
                  child: Text('语文'),
                ),
                CheckedPopupMenuItem(
                  value: '数学',
                  child: Text('数学'),
                ),
              ];
            },
          ),
          RaisedButton(onPressed: (){},child: Text("弹出框"),),
          SimpleDialog(
            title: Text('提示'),
            children: <Widget>[
              Container(
                height: 80,
                alignment: Alignment.center,

                child: Text('确认删除吗？'),
              ),
              Divider(height: 1,),
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop('cancel');
                },
              ),
              Divider(height: 1,),
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop('ok');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showListDialog() async {
    var result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("标题"),
          children: list
              .map(
                (e) => GestureDetector(
              child: Text(e.toString()),
              onTap: () {
                Navigator.pop(context, e);
              },
            ),
          )
              .toList(),
        );
      },
    );
    print(result);
  }

  void _showAlert() async {
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("标题"),
          content: Text("确认删除吗？"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("确认"),
            ),
          ],
        );
      },
    );
    print(result);
  }
}
