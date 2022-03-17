import 'package:flutter/material.dart';

class Datapicker extends StatefulWidget {
  const Datapicker({Key? key}) : super(key: key);

  @override
  _DatapickerState createState() => _DatapickerState();
}

class _DatapickerState extends State<Datapicker> {
  DateTime _selectedDate = DateTime.now();
  late DateTime _lastQuitTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("时间日期"),
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton(
              child: Text("aaa"),
              onPressed: () async {},
            ),
            Container(
                height: 250,
                width: 400,
                child: YearPicker(
                  selectedDate: _selectedDate,
                  onChanged: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  firstDate: DateTime(2000, 1),
                  lastDate: DateTime(2020, 12),
                )),
            Container(
                height: 50,
                // width: 400,
                child: RaisedButton(
                  child: Text("时间选择器"),
                  onPressed: () async {
                    var result = await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark(),
                            child: Text("dsfds"),
                          );
                        },
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030));
                    print('$result');
                  },
                )),
            Container(
                height: 50,
                // width: 400,
                child: RaisedButton(
                  child: Text("时间选择器"),
                  onPressed: () async {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                  },
                )),
            Wrap(
              children: List.generate(10, (i) {
                double w = 50.0 + 10 * i;
                return Container(
                  color: Colors.primaries[i],
                  height: 50,
                  width: w,
                  child: Text('$i'),
                );
              }),
            ),

            WillPopScope(
                onWillPop: () async {
                  if (_lastQuitTime == null ||
                      DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
                    print('再按一次 Back 按钮退出');
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('再按一次 Back 按钮退出')));
                    _lastQuitTime = DateTime.now();
                    return false;
                  } else {
                    print('退出');
                    Navigator.of(context).pop(true);
                    return true;
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('点击后退按钮，询问是否退出。'),
                ))
          ],
        ));
  }
}
