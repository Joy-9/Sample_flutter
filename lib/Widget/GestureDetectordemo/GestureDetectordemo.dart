import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//水波纹和手势案例
class GestureDetectordemo extends StatefulWidget {
  const GestureDetectordemo({Key? key}) : super(key: key);

  @override
  State<GestureDetectordemo> createState() => _GestureDetectordemoState();
}

class _GestureDetectordemoState extends State<GestureDetectordemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("水波纹和手势案例"),
        ),
        body: Column(
          children: <Widget>[
            Listener(
              onPointerDown: (PointerDownEvent pointerDownEvent) {
                print('$pointerDownEvent');
              },
              onPointerMove: (PointerMoveEvent pointerMoveEvent) {
                print('$pointerMoveEvent');
              },
              onPointerUp: (PointerUpEvent upEvent) {
                print('$upEvent');
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
                alignment: Alignment.center,
              ),
            ),
            GestureDetector(
              // onTapDown: (TapDownDetails tapDownDetails) {
              //   print('onTapDown');
              // },
              // onTapUp: (TapUpDetails tapUpDetails) {
              //   print('onTapUp');
              // },
              // onTap: () {
              //   print('onTap');
              // },
              // onTapCancel: () {
              //   print('onTapCancel');
              // },
              // onDoubleTap: ()=>print('onDoubleTap'),//双击事件
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "aaaa",
                style: TextStyle(fontSize: 30),
              ),
              splashColor: Colors.red,
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text('这是InkWell点击效果'),
              ),
            ),
            Ink(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: const Text(
                    '这是InkWell的点击效果',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {},
              ),
            )
          ],
        )
    );
  }
}
