import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DatabaseHelper.dart';
class SQLitedemo extends StatefulWidget {
  const SQLitedemo({Key? key}) : super(key: key);

  @override
  State<SQLitedemo> createState() => _SQLitedemoState();
}

class _SQLitedemoState extends State<SQLitedemo> {
  late TextEditingController textController=TextEditingController();
  List<Todo> taskList = [];
  @override
  void initState() {
    super.initState();

    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        for (var element in value) {
          taskList.add(Todo(id: element['id'], title: element["title"]));
        }
      });
    }).catchError((error) {
      print(error);
    });
  }
  void _addToDb() async {
    String task = textController.text;
    var id = await DatabaseHelper.instance.insert(Todo(title: task));
    setState(() {
      taskList.insert(0, Todo(id: id, title: task));
    });
  }
  void _deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    setState(() {
      taskList.removeWhere((element) => element.id == id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLitedemo"),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              ElevatedButton(onPressed: (){
                launch("https://www.javacodegeeks.com/2020/06/using-sqlite-in-flutter-tutorial.html");
              },child: Text("参考链接1"),),
              ElevatedButton(onPressed: (){
                launch("https://pub.flutter-io.cn/packages/sqflite");
              },child: Text("参考链接2"),),
              ElevatedButton(onPressed: (){
                launch("http://laomengit.com/guide/data_storage/sqflite.html");
              },child: Text("参考链接3"),)
            ],),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Enter a task"),
                    controller: textController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addToDb,
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: taskList.isEmpty
                    ? Container()
                    : ListView.builder(itemCount:taskList.length,itemBuilder: (ctx, index) {
                  if (index == taskList.length) return Text("");
                  return ListTile(
                    title: Text(taskList[index].title),
                    leading: Text(taskList[index].id.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTask(taskList[index].id!.toInt()),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Todo {
  int? id;
  String title;

  Todo({ this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }
}