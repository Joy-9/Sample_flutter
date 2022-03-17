import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({Key? key}) : super(key: key);

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  var _dragData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("拖拽组件"),),
      body: ListView(
        children: <Widget>[
          Draggable(
            onDragStarted: (){
              print('onDragStarted');
            },
            onDragEnd: (DraggableDetails details){
              print('onDragEnd:$details');
            },
            onDraggableCanceled: (Velocity velocity, Offset offset){
              print('onDraggableCanceled velocity:$velocity,offset:$offset');
            },
            onDragCompleted: (){
              print('onDragCompleted');
            },
            axis: Axis.vertical,
            childWhenDragging: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                '人生赢家',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('想',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              feedback: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('想',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ),
          Column(
            children: <Widget>[
              _buildDraggable(),
              const SizedBox(
                height: 200,
              ),
              DragTarget<Color>(
                builder: (BuildContext context, List<Color?> candidateData,
                    List<dynamic> rejectedData) {
                  print('candidateData:$candidateData,rejectedData:$rejectedData');
                  return _dragData == null
                      ? Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                  )
                      : Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      '三',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                },
                onWillAccept: (Color? color) {
                  print('onWillAccept:$color');
                  return true;
                },
                onAccept: (Color color) {
                  setState(() {
                    _dragData = color;
                  });
                  print('onAccept:$color');
                },
                onLeave: (Color? color) {
                  print('onLeave:$color');
                },
              ),
              const SizedBox(height: 100,),
              RaisedButton(onPressed: (){
                // Navigator.of(context).pushNamed("DraggableDemo");
                Navigator.of(context).pushNamed( "DraggableDemo2");
              },child: const Text("切换另一个draggable"),),
            ],
          ),
        ],
      )
      ,
    );
  }
}
_buildDraggable() {
  return Draggable(
    data: Color(0x000000FF),
    child: Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: const Text(
        '一',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    feedback: Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        child: const Text(
          '二',
        ),
      ),
    ),
  );
}

