import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewdemo extends StatefulWidget {
  const SingleChildScrollViewdemo({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollViewdemo> createState() => _SingleChildScrollViewdemoState();
}

class _SingleChildScrollViewdemoState extends State<SingleChildScrollViewdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单个组件展示"),),
      body:SingleChildScrollView(
        child: Column(
          children: List.generate(50, (index) {
            return Container(
              height: 150,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }).toList(),
        ),
      )
      ,
    );
  }
}
